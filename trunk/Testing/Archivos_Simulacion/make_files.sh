#!/bin/bash
#
# Make the files for PSpice Simulation Manager
#

opt=$1
orig=CONV_FLASH.cir

dos2unix $orig

dir="/home/mobaxterm/tesis/Testing/Archivos_Simulacion/OrCAD_simulation_files"
num=$(cat $orig | grep ^M | wc -l)

vdd_node=$(cat $orig | grep VDD | awk '{print $2}')

echo "Drains = $num"
echo "VDD node = $vdd_node"

while read line
#for mos in $(cat $orig)
do
mos=$(echo $line | grep ^M)
if [ ! -z "$mos" ]
then
    tran=$(echo $mos | awk '{print $1}')
    gate=$(echo $mos | awk '{print $2}')
    drain=$(echo $mos | awk '{print $3}')
    source=$(echo $mos | awk '{print $4}')
    bulk=$(echo $mos | awk '{print $5}')
    typo=$(echo $mos | awk '{print $6}')
    if [ "$opt" == "-v" ]
	then
	echo "Transistor: $tran"
	echo "      GATE: $gate"
	echo "     DRAIN: $drain"
	echo "    SOURCE: $source"
	echo "      BULK: $bulk"
	echo "      TYPE: $typo"
    fi
fi
#read aux
#sleep 2
done < $orig

unix2dos $orig