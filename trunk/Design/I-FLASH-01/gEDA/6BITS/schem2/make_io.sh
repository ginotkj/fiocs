#!/bin/sh
##
## make_io.sh
##
## Made by Facundo
## Login   <facundo@faku-laptop>
##
## Started on  Wed Mar 17 20:37:42 2010 Facundo
## Last update Wed Mar 17 20:37:42 2010 Facundo
##

j=1
step=-500 #negativo
#x=8700
x=5000
y=63300
p=$3
for i in $(seq $1 1 $2)
do

#################################################
xdev=$(echo $x-900 | bc)
ydev=$(echo $y-400 | bc)
xtxt=$(echo $x-850 | bc)
ytxt=$(echo $y-250 | bc)
xt=$(echo $x-500 | bc)
yt=$(echo $y-400 | bc)
echo "C $x $y 1 180 0 spice-subcircuit-IO-1.sym"
echo "{"
echo "T $xdev $ydev 5 10 0 1 180 0 1"
echo "device=spice-IO"
echo "T $xtxt $ytxt 5 10 1 1 180 0 1"
echo "refdes=P$p"
echo "T $xt $yt 5 10 1 1 180 0 1"
echo "pinlabel=q$i"
echo "}"
#################################################
y=63300
y=$(echo $y+($j*$step) | bc)
j=$(echo $j+1 | bc) #incrementa j que es para separar los pines. es diferente a p para hacer varias columnas de los mismo comp pero diferentes ports
p=$(echo $p+1 | bc) #incrementa solo los puertos xq son unicos
################################################
xdev=$(echo $x-900 | bc)
ydev=$(echo $y-400 | bc)
xtxt=$(echo $x-850 | bc)
ytxt=$(echo $y-250 | bc)
xt=$(echo $x-500 | bc)
yt=$(echo $y-400 | bc)
echo "C $x $y 1 180 0 spice-subcircuit-IO-1.sym"
echo "{"
echo "T $xdev $ydev 5 10 0 1 180 0 1"
echo "device=spice-IO"
echo "T $xtxt $ytxt 5 10 1 1 180 0 1"
echo "refdes=P$p"
echo "T $xt $yt 5 10 1 1 180 0 1"
echo "pinlabel=nq$i"
echo "}"
#################################################
y=63300
y=$(echo $y+($j*$step) | bc)
j=$(echo $j+1 | bc) #incrementa j que es para separar los pines. es diferente a p para hacer varias columnas de los mismo comp pero diferentes ports
p=$(echo $p+1 | bc) #incrementa solo los puertos xq son unicos
done