#!/bin/bash
#
# Make the files for PSpice Simulation Manager
#

opt=$1
if [ -z "$opt" ]
then
failtype=$1
else
failtype=$2
fi

if [ "$failtype" == "exp" ]
then
	fail="
I_I1         aquifalla 0 DC 0Adc AC 0Aac
+EXP 0 4m 2n 30p 2.2n 500p"
elif [ "$failtype" == "rampa" ]
then
	fail="
I_I1         aquifalla 0 DC 0Adc AC 0Aac
+PULSE 0 4m 2n 50p 1.5n 100p 10n"
elif [ "$failtype" == "rampa2" ]
then
	fail="
I_I1         aquifalla 0 DC 0Adc AC 0Aac
+PULSE 0 4m 2n 30p 150p 0p 10n
I_I2         aquifalla 0 DC 0Adc AC 0Aac
+PULSE 0 2m 2n 60p 1n 50p 10n"
else
	fail="
* FALLA EXPONENCIAL
*I_I1         aquifalla 0 DC 0Adc AC 0Aac
*+EXP 0 4m 2n 30p 2.2n 500p

* FALLA RAMPA
*I_I1         aquifalla 0 DC 0Adc AC 0Aac
*+PULSE 0 4m 2n 50p 1.5n 100p 10n
	
*	FALLA DOBLE RAMPA
*I_I1         aquifalla 0 DC 0Adc AC 0Aac
*+PULSE 0 4m 2n 30p 150p 0p 10n
*I_I2         aquifalla 0 DC 0Adc AC 0Aac
*+PULSE 0 2m 2n 60p 1n 50p 10n
	"
fi

orig=CONV_FLASH_editado.cir

dos2unix $orig

dir="./OrCAD_simulation_files"
num=$(cat $orig | grep ^M | wc -l)

vdd_node=$(cat $orig | grep VDD | awk '{print $2}')

echo "Drains = $num"
echo "VDD node = $vdd_node"
echo "Fail:"
echo "$fail"
echo ""
echo "Press 'enter' to continue..."
read garbage

while read line
#for mos in $(cat $orig)
do
mos=$(echo $line | grep ^M )
if [ ! -z "$mos" ]
then
    tran=$(echo $mos | awk '{print $1}')
    gate=$(echo $mos | awk '{print $3}')
    drain=$(echo $mos | awk '{print $2}')
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
	chmod a+w $dir/$drain.cir
	echo "*INYECCION" >> $dir/$drain.cir
	echo "" >> $dir/$drain.cir
	#echo "I_I1    $drain 0 DC 0Adc AC 0Aac" >> $dir/$drain.cir
	echo "$fail" >> $dir/$drain.cir
	sed -i -e "s/aquifalla/$drain/" $dir/$drain.cir
	echo "" >> $dir/$drain.cir
	echo "*TENSIONES DE SALIDA" >> $dir/$drain.cir
	echo "" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([C_F_D-MSB])" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([C_F_D-5SB])" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([C_F_D-4SB])" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([C_F_D-3SB])" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([C_F_D-2SB])" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([C_F_D-LSB])" >> $dir/$drain.cir
	echo "" >> $dir/$drain.cir
	echo "*TENSION Y CORRIENTE EN EL PUNTO DE FALLA" >> $dir/$drain.cir
	echo "" >> $dir/$drain.cir
	echo ".PROBE/CSDF ID($tran)" >> $dir/$drain.cir
	echo ".PROBE/CSDF I(I_I1)" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([$drain])" >> $dir/$drain.cir
	echo "" >> $dir/$drain.cir
	echo ".END" >> $dir/$drain.cir
    fi
    if [ "$typo" == "CMOSP" ]
	then
	cp $orig $dir/$drain.cir
	chmod a+w $dir/$drain.cir
	echo "*INYECCION" >> $dir/$drain.cir
	echo "" >> $dir/$drain.cir
	#echo "I_I1    $drain 0 DC 0Adc AC 0Aac" >> $dir/$drain.cir
	echo "$fail" >> $dir/$drain.cir
	sed -i -e "s/aquifalla/$drain/" $dir/$drain.cir
	echo "" >> $dir/$drain.cir
	echo "*TENSIONES DE SALIDA" >> $dir/$drain.cir
	echo "" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([C_F_D-MSB])" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([C_F_D-5SB])" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([C_F_D-4SB])" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([C_F_D-3SB])" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([C_F_D-2SB])" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([C_F_D-LSB])" >> $dir/$drain.cir
	echo "" >> $dir/$drain.cir
	echo "*TENSION Y CORRIENTE EN EL PUNTO DE FALLA" >> $dir/$drain.cir
	echo "" >> $dir/$drain.cir
	echo ".PROBE/CSDF ID($tran)" >> $dir/$drain.cir
	echo ".PROBE/CSDF I(I_I1)" >> $dir/$drain.cir
	echo ".PROBE/CSDF V([$drain])" >> $dir/$drain.cir
	echo "" >> $dir/$drain.cir
	echo ".END" >> $dir/$drain.cir
    fi

fi
#read aux
#sleep 1
done < $orig

unix2dos $orig