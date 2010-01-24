#!/bin/bash
##
## fail_injection.sh
## 
## Made by Facundo
## Login   <facundo@faku-laptop>
## 
## Started on  Tue Dec 15 20:47:38 2009 Facundo
## Last update Wed Jan 20 09:20:04 2010 Facundo
##

circuit=$1
tempdir=$(mktemp -d)
tempcir="$tempdir/tempcirfile.cir"
trancount=0

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

####################################

if [ -z $circuit ]
then
    echo "Please give a circuit file!"
    exit 2
fi

clear

echo "Created temporary dir $tempdir...OK"
echo -n "Creating temporary file $tempcir..."
check_out $?

echo -ne ${blue}
echo "###################################################"
echo "#               Circuit Information               #"
echo "###################################################"
echo -e ${reset}

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

cat $circuit | grep ^M | awk -F' ' '{print $1}' > $tempcir
group1=$(cat $tempcir | awk -F'_' '{print $1}' | sort | uniq | wc -l)
group2=$(cat $tempcir | awk -F'_' '{print $2}' | sort | uniq | wc -l)
group3=$(cat $tempcir | awk -F'_' '{print $3}' | sort | uniq | wc -l)
echo "$group1 block components identified at FIRST level schem"
echo "$group2 block components identified at SECOND level schem"
echo "$group3 block components identified at THIRD level schem"

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

echo -n "Do you want to simulate the files?"
read answer
while [ "$answer" != "y" -a "$answer" != "Y" -a "$answer" != "n" -a "$answer" != "N" ]
do
    read answer
    if [ "$answer" == "y" -o "$answer" == "Y" ]
	then
	echo "Not working yet..."
    fi
done

echo -n "Cleaning temp files ($tempdir) ..."
rm -fr $tempdir
check_out $?