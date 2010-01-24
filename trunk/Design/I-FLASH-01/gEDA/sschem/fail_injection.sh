#!/bin/bash
##
## fail_injection.sh
## 
## Made by Facundo
## Login   <facundo@faku-laptop>
## 
## Started on  Tue Dec 15 20:47:38 2009 Facundo
## Last update Sun Jan 24 19:37:18 2010 Facundo
##

# Globals vars
circuit=$1
total_mem=$(free -m | grep Mem | awk '{print $2}')
critical_free_mem=10
sim_output="flash.raw"
sim_data="flash.bin" #los nombres de esquematicos, cirfiles, sim output deben ser todos iguales cambiando la extension solamente
#ejemplo
# flash mainname
# flash.sch schem
# flash.cir cirfile
# flash.cmd spice command file
# flash.raw spice output file
# flash.bin spice data file

# Colors
red="\033[31m"
blue="\033[34m"
green="\033[32m"
bold="\033[1m"
yellow="\033[33m"
magenta="\033[35m"
lightblue="\033[36m"
white="\033[37m"
reset="\033[0m"
savecur="\033[s"
restorecur="\033[u"
eraseeol="\033[K"

#####################################

function check_out {
    if [ $1 -eq 0 ]
    then
	echo -e "${green}OK${reset}"
    else
	echo -e "${red}Fail${reset}"
    fi
    return 0
}

function clean_temp {
    echo -n "Cleaning temp files ($tempdir)..."
    rm -fr $tempdir
    check_out $?   
}

function get_free_mem {
    local aux=0
    let aux=$(free -m | grep Mem | awk '{print $4}')
    echo $aux
    return 0
}

function check_mem {
    free_mem=$(get_free_mem)
    free_mem_percentage=$(echo "scale=2 ; $free_mem / $total_mem * 100" | bc)
    free_mem_percentage=${free_mem_percentage/.*}
    echo -e "${yellow} $free_mem_percentage %${reset}"
    
    if [ $free_mem_percentage -le $critical_free_mem ]
    then
	echo "Critical free memory. Aborting..."
	clean_temp
	exit 3
    fi   
}

function check_tmp {

#cheuqear tamaño del temp entre simulaciones
}

function simul {
    ngspice -b $1 -o $simul_raw &>/dev/null
    if [ $? -ne 0 ]
	then
	((global_error_sim++))
    fi
}

function check_sim {
    ((global_success_sim++))
    ((global_fail_sim++))
}

####################################

if [ -z $circuit ]
then
    echo "Please give a circuit file!"
    exit 2
else
    simulation_file=$(cat $circuit | grep cmd | awk '{print $2}')
    if [ "$simulation_file" == "" ]
    then
	echo -e "${white}${bold}Not simulation command file found!${reset}"
	echo -e "${white}${bold}Please check $circuit file${reset}"
	exit 4
    fi
fi

clear

echo -ne ${blue}
echo "###################################################"
echo "#               Circuit Information               #"
echo "###################################################"
echo -e ${reset}




echo -ne "${bold}${white}Creating temporary dir...${reset}"
tempdir=$(mktemp -d)
check_out $?
echo -e "${white}${bold}Temporary dir: ${reset}${yellow}$tempdir${reset}"

tempcir="$tempdir/tempcirfile" #sin el .cir para poder hacer un for con los inyectados
echo -ne "${white}${bold}Creating temporary file ${reset}${yellow}$tempcir...${reset}"
cp $circuit $tempcir
check_out $?
echo

tempdata="$tempdir/tempdata" #sin el .cir para poder hacer un for con los inyectados
echo -ne "${white}${bold}Creating temporary file ${reset}${yellow}$tempdata...${reset}"
touch $tempdata
check_out $?
echo

echo -e "${white}${bold}Circuit file:${reset}${yellow} $circuit${reset}"
echo -e "${white}${bold}Simulation file: ${reset}${yellow}$simulation_file${reset}"
echo

trancount=0
n_trancount=0
p_trancount=0

n_trancount=$(cat $circuit | grep ^M | grep nmos | wc -l)
echo -e "${white}${bold}NMOS transistors: ${yellow}$n_trancount${reset}"

p_trancount=$(cat $circuit | grep ^M | grep pmos | wc -l)
echo -e "${white}${bold}PMOS transistors: ${yellow}$p_trancount${reset}"

trancount=$(cat $circuit | grep ^M | wc -l)
echo -e "${white}${bold}Total transistors: ${yellow}$trancount${reset}"

injection_points_count=$(cat $circuit | grep ^M | awk -F' ' '{print $2}' | sort | uniq | wc -l)
injection_points=$(cat $circuit | grep ^M | awk -F' ' '{print $2}' | sort | uniq)
echo -e "${white}${bold}Total injection points: ${yellow}$injection_points_count${reset}"

echo 
echo -ne ${blue}
echo "###################################################"
echo "#                  Groups found                   #"
echo "###################################################"
echo -e ${reset}

cat $circuit | grep ^M | awk -F' ' '{print $1}' > $tempdata
group1=$(cat $tempdata | awk -F'_' '{print $1}' | sort | uniq | wc -l)
group2=$(cat $tempdata | awk -F'_' '{print $2}' | sort | uniq | wc -l)
group3=$(cat $tempdata | awk -F'_' '{print $3}' | sort | uniq | wc -l)
echo -e "${white}$group1 block components identified at FIRST level schem${reset}"
echo -e "${white}$group2 block components identified at SECOND level schem${reset}"
echo -e "${white}$group3 block components identified at THIRD level schem${reset}"

echo 
echo -ne ${blue}
echo "###################################################"
echo "#                 Simulation Info                #"
echo "###################################################"
echo -e ${reset}

echo -en "${white}${bold}Generating circuit files...${reset}"
aux=0
for i in $injection_points
do
    sed -e "s/\.end/IFAIL $i 0 DC 10u/" $circuit > $tempdir/cir_$i.cir
    let aux=$aux+$?
    echo '.end' >> $tempdir/cir_$i.cir
    let aux=$aux+$?
done
check_out $aux

echo -ne "${white}Do you want to simulate the files (y/n/Y/N)? "
echo -ne ${savecur}
read answer
while [ "$answer" != "y" -a "$answer" != "Y" -a "$answer" != "n" -a "$answer" != "N" ]
do
    echo -ne "${restorecur}${eraseeol}${restorecur}"
    read answer
done

if [ "$answer" == "n" -o "$answer" == "N" ]
then
    clean_temp
    exit 4
fi

echo -ne "${white}Copying simulation commands file...${reset}"
cp $simulation_file $tempdir
check_out $?

echo -ne "${white}Checking free memory...${reset}"
check_mem

echo -e "Simulating..."

cirs=$(ls $tempdir/*.cir)
global_error_sim=0 #simulation not done
global_success_sim=0 #simulation success and agree against normal
global_fail_sim=0 #simulation success and fail against normal


for cir in $cirs
do
    simul $cir
    echo "Errors: $global_error_sim"
    check_mem
done


clean_temp