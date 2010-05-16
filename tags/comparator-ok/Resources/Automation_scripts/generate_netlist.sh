#!/bin/bash

netlist="spice"
net_out="$1.$netlist"
drc="drc2"
drc_temp="/tmp/drc.$$"
cir_file="$1.cir"
sim_out="$1.out"
sim_raw="$1.raw"
sim_ps="$1.ps"

clear
echo "######################################################"
echo
echo "Filename: $1"
echo -n "Checking DRC....."
gnetlist -g $drc -o $drc_temp $1 >>/dev/null 2>&1
out=$(tail -n1 $drc_temp | grep "^No errors found")
if [ $? -ne 0 ]
then
    echo "Errors found!"
    echo "Please check $drc_temp for more info"
    exit 1
else
    echo "OK"
    echo -n "Deleting temporary files..."
    rm -f $drc_temp
    if [ $? -eq 0 ]
    then
	echo "OK"
    else
	echo "Error"
	exit 1
    fi
fi

echo -n "Generating netlist..."
gnetlist -g $netlist -o $net_out $1 >>/dev/null 2>&1
if [ $? -eq 0 ]
then
    echo "OK"
else
    echo "Error"
    exit 1
fi
echo -n "Creating circuit file..."
cp $net_out $cir_file
sed -i -e 's/^\.[Ee][Nn][Dd]//' $cir_file
if [ $? -eq 0 ]
then
    echo '.OP' >> $cir_file
    echo '.END' >> $cir_file
    if [ $? -eq 0 ]
    then
	echo "OK"
    fi
else
    echo "Error"
    exit 1
fi
echo -n "Simulating circuit..."
ngspice -b $cir_file -o $sim_out -r $sim_raw >>/dev/null 2>&1
if [ $? -eq 0 ]
then
    echo "OK"
else
    echo "Error"
    exit 1
fi

## chequear el postscript o parsear ascii... o hacer ambos y chequear ps para imagenes!!!