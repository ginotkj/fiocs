#!/bin/bash

# sym_file=$1 #en un futuro
sym_file="test.sym"

## Detecto version
#futuro
version='v 20080127 1'
echo $version > $sym_file

## Agrego pines
# pines=$2 #en un futuro
# ord=$3 #en un futro
pines=10
ord=izq #ord=der
color=5
textsize=10
ang=0
visibility1='0 0' # Hide - Name=Value
visibility2='0 1' # Hide - Value
visibility3='1 0' # Show - Name=Value
visibility4='1 1' # Show - Value
visibility5='0 2' # Hide - Name
visibility6='1 2' # Show - Name

for i in $(1 1 $pines)
do
x0= ; y0= ; xf= ; yf=
echo "P $x0 $y0 $xf $yf 1 0 0" >> $sym_file
echo '{' >> $sym_file

x0= ; y0= 
echo "T $x0 $y0 $color $textsize $visibility1 $ang 0 1" >> $sym_file
echo "pintype=" >> $sym_file

x0= ; y0= 
echo "T $x0 $y0 $color $textsize $visibility4 $ang 0 1" >> $sym_file
echo "pinlabel=" >> $sym_file

x0= ; y0= 
echo "T $x0 $y0 $color $textsize $visibility4 $ang 0 1" >> $sym_file
echo "pinnumber=" >> $sym_file

x0= ; y0= 
echo "T $x0 $y0 $color $textsize $visibility1 $ang 0 1" >> $sym_file
echo "pinseq=" >> $sym_file
echo '}' >> $sym_file

done

## Agrego Vdd y GND
#Vdd=on
#GND=on
#futuro

## Genero el box
#futuro