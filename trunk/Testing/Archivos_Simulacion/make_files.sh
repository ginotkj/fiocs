#!/bin/bash
#
# Make the files for PSpice Simulation Manager
#

opt=$1
orig=CONV_FLASH_editado.cir

dos2unix $orig

dir="./OrCAD_simulation_files"
num=$(cat $orig | grep ^M | wc -l)

vdd_node=$(cat $orig | grep VDD | awk '{print $2}')

echo "Drains = $num"
echo "VDD node = $vdd_node"

while read line
#for mos in $(cat $orig)
do
mos=$(echo $line | grep ^M )
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
    if [ "$typo" == "CMOSN" ]
	then
	cp $orig $dir/$drain.cir
	echo "*INYECCION" >> $dir/$drain.cir
	echo "" >> $dir/$drain.cir
	echo "I_I1    $drain 0 DC 0Adc AC 0Aac" >> $dir/$drain.cir
	echo "+EXP 0 5m 2n 2.004n 2.015n 500ps" >> $dir/$drain.cir
	echo "*TENSIONES DE SALIDA" >> $dir/$drain.cir
	echo "" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([CONV_FLASH_D-MSB])" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([CONV_FLASH_D-5SB])" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([CONV_FLASH_D-4SB])" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([CONV_FLASH_D-3SB])" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([CONV_FLASH_D-2SB])" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([CONV_FLASH_D-LSB])" >> $dir/$drain.cir
	echo "" >> $dir/$drain.cir
	echo "*TENSION Y CORRIENTE EN EL PUNTO DE FALLA" >> $dir/$drain.cir
	echo "" >> $dir/$drain.cir
	echo ".PROBE/CSDF ID($tran)" >> $dir/$drain.cir
	echo ".PROBE/CSDF I(I_I1)" >> $dir/$drain.cir
	echo ".PROBE/CSDF V($drain)" >> $dir/$drain.cir
	echo "" >> $dir/$drain.cir
	echo ".END" >> $dir/$drain.cir
    fi
fi
#read aux
#sleep 1
done < $orig

unix2dos $orig