#!/bin/bash


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

circuit=$1
if [ -z $circuit ]
then
    echo "Please insert a circuit name without .sch"
    exit 2
fi

clear

echo -ne ${blue}${bold}
echo "###################################################"
echo "#             Checking DRC on circuit             #"
echo "###################################################"
echo -e ${reset}${white}
echo -e "Command: ${yellow}gnetlist -gdrc2 -o $circuit.drc $circuit.sch &>/dev/null"
echo -en "${white}Result: "
if ! $(gnetlist -gdrc2 -o $circuit.drc $circuit.sch 2>/dev/null | grep 'DRC errors found' -q)
then
    echo -e "${green}${bold}OK${reset}"
    echo -ne ${blue}${bold}
    echo "###################################################"
    echo "#               Generating netlist                #"
    echo "###################################################"
    echo -e ${reset}${white}
    echo -e "Command: ${yellow}gnetlist -gspice-sdb -o $circuit.cir $circuit.sch &>/dev/null"
    echo -en "${white}Result: "
    if $(gnetlist -gspice-sdb -o $circuit.cir $circuit.sch &>/dev/null)
    then
	echo -e "${green}${bold}OK${reset}"
	echo -ne ${blue}${bold}
	echo "###################################################"
	echo "#                 Cleaning circuit                #"
	echo "###################################################"
	echo -e ${reset}${white}
	echo -e "Command: ${yellow}cat $circuit.drc | sed -e 's/\(S..\/S..\/GND\)/0/g' | sed -e 's/\(S..\/GND\)/0/g' | sed -e 's/\//_/g' > clean_$circuit.cir"
	echo -en "${white}Result: "
	if $(cat $circuit.cir | sed -e 's/\(S..\/S..\/GND\)/0/g' | sed -e 's/\(S..\/GND\)/0/g' | sed -e 's/\//_/g' > clean_$circuit.cir)
	then
	    echo -e "${green}${bold}OK${reset}"
	    echo
	else
	    echo -e "${red}${bold}Failed${reset}"
	    echo "A problem appear when trying to clean the circuit. Check $circuit.cir or clean_$circuit.cir for details."
	fi
    else
	echo -e "${red}${bold}Failed${reset}"
	echo "Please see $circuit.cir for details."
    fi
else
    echo -e "${red}${bold}Failed${reset}"
    echo "Please see $circuit.drc for details."
fi