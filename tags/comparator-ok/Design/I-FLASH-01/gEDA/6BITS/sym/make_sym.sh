#!/bin/bash

# sym_file=$1 #en un futuro
sym_file="test.sym"

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

j=1
for i in $(seq 1 1 $pines);
do
    echo "Creating pin $i"
    x0=100 ; y0=$(echo $((200*$j)))
    xf=400 ; yf=$(echo $((200*$j)))
    echo "P $x0 $y0 $xf $yf 1 0 0" >> $sym_file
    echo '{' >> $sym_file

    x0=1800 ; y0=$(echo $((200 * $j)))
    echo "T $x0 $y0 $color $textsize $visibility1 $ang $alig2 1" >> $sym_file
    echo "pintype=in" >> $sym_file

    x0=500 ; y0=$(echo $((200 * $j)))
    echo "T $x0 $y0 $color $textsize $visibility4 $ang $alig2 1" >> $sym_file
    echo "pinlabel=q$i" >> $sym_file

    x0=100 ; y0=$(echo $((200 * $j + 100)))
    echo "T $x0 $y0 $color $textsize $visibility4 $ang $alig1 1" >> $sym_file
    echo "pinnumber=$j" >> $sym_file

    x0=2600 ; y0=$(echo $((200 * $j)))
    echo "T $x0 $y0 $color $textsize $visibility1 $ang $alig2 1" >> $sym_file
    echo "pinseq=$j" >> $sym_file
    echo '}' >> $sym_file

##########

    let j=$j+1

    x0=100 ; y0=$(echo $((200*$j)))
    xf=400 ; yf=$(echo $((200*$j)))
    echo "P $x0 $y0 $xf $yf 1 0 0" >> $sym_file
    echo '{' >> $sym_file

    x0=1800 ; y0=$(echo $((200 * $j)))
    echo "T $x0 $y0 $color $textsize $visibility1 $ang $alig2 1" >> $sym_file
    echo "pintype=in" >> $sym_file

    x0=500 ; y0=$(echo $((200 * $j)))
    echo "T $x0 $y0 $color $textsize $visibility4 $ang $alig2 1" >> $sym_file
    echo "pinlabel=nq$i" >> $sym_file

    x0=100 ; y0=$(echo $((200 * $j + 100)))
    echo "T $x0 $y0 $color $textsize $visibility4 $ang $alig1 1" >> $sym_file
    echo "pinnumber=$j" >> $sym_file

    x0=2600 ; y0=$(echo $((200 * $j)))
    echo "T $x0 $y0 $color $textsize $visibility1 $ang $alig2 1" >> $sym_file
    echo "pinseq=$j" >> $sym_file
    echo '}' >> $sym_file

    let j=$j+1

done
let yf=$yf+200
echo "B 400 100 1000 $yf 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1" >> $sym_file

exit 0

## Agrego Vdd y GND
#Vdd=on
#GND=on
#futuro

## Genero el box
#futuro