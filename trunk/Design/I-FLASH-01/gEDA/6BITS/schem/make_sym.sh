#!/bin/bash

# sym_file=$1 #en un futuro
sym_file="codigo.sch"

## Detecto version
#futuro
version='v 20081231 1'
echo $version > $sym_file

## Agrego pines
pines=$1 #en un futuro
# ord=$3 #en un futro
#pines=10
step=200
ord=izq #ord=der
color=5
textsize=8
ang=0
alig1=1
alig2=0
visibility1='0 0' # Hide - Name=Value
visibility2='0 1' # Hide - Value
visibility3='1 0' # Show - Name=Value
visibility4='1 1' # Show - Value
visibility5='0 2' # Hide - Name
visibility6='1 2' # Show - Name


for i in $(seq 1 1 $pines);
do
    echo "Creating input $i"
    x0=33200 ; let y0=$(echo $((200*$i)))+28200
#    xf=400 ; yf=$(echo $((200*$i)))
    echo "C $x0 $y0 1 0 0 input-2.sym" >> $sym_file
    echo '{' >> $sym_file

    x0=32600 ; let y0=$y0+100
    echo "T $x0 $y0 $color $textsize $visibility3 $ang $alig1 1" >> $sym_file
    echo "net=INPUT:$i" >> $sym_file

    x0=31600
    echo "T $x0 $y0 $color $textsize $visibility1 $ang $alig1 1" >> $sym_file
    echo "value=INPUT" >> $sym_file

    x0=30600
    echo "T $x0 $y0 $color $textsize $visibility1 $ang $alig1 1" >> $sym_file
    echo "device=none" >> $sym_file
    echo '}' >> $sym_file
    
    x0=
    echo "N 34600 $y0 35800 $y0 4" >> $sym_file

#C 33200 28400 1 0 0 input-2.sym
#{
#T 32600 28500 5 10 1 0 0 1 1
#net=INPUT:1
#T 33700 28500 5 10 0 1 0 7 1
#value=INPUT
#T 33800 29100 5 10 0 0 0 0 1
#device=none
#}
#N 35800 28500 34600 28500 4
done

exit 0

## Agrego Vdd y GND
#Vdd=on
#GND=on
#futuro

## Genero el box
#futuro