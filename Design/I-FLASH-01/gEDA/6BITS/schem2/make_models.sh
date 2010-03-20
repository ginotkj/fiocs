#!/bin/sh
##
## make_models.sh
## 
## Made by Facundo
## Login   <facundo@faku-laptop>
## 
## Started on  Sat Mar 20 18:59:18 2010 Facundo
## Last update Sat Mar 20 18:59:18 2010 Facundo
##

compmodels='
comp1
comp2
comp3
comp4
comp5
comp6
comp7
comp8
comp9
comp10
comp11
comp12
comp13
comp14
comp15
comp16
comp17
comp18
comp19
comp20
comp21
comp22
comp23
comp24
comp25
comp26
comp27
comp28
comp29
comp30
comp31
comp32
comp33
comp34
comp35
comp36
comp37
comp38
comp39
comp40
comp41
comp42
comp43
comp44
comp45
comp46
comp47
comp48
comp49
comp50
comp51
comp52
comp53
comp54
comp55
comp56
comp57
comp58
comp59
comp60
comp61
comp62
comp63'
invmodels='
inv1
inv2
inv3
inv4
inv5
inv6
inv7
inv8
inv9
inv10
inv11
inv12
inv13
inv14
inv15
inv16
inv17
inv18
inv19
inv20
inv21
inv22
inv23
inv24
inv25
inv26
inv27
inv28
inv29
inv30
inv31
inv32
inv33
inv34
inv35
inv36
inv37
inv38
inv39
inv40
inv41
inv42
inv43
inv44
inv45
inv46
inv47
inv48
inv49
inv50
inv51
inv52
inv53
inv54
inv55
inv56
inv57
inv58
inv59
inv60
inv61
inv62
inv63'
decomodels='deco64'

i=1 #counter
step=-1000

######### para comparadores

bx=73000 #base x position
by=84200 #base y position
path="sources2/comp"
for model in $compmodels
do
echo "C $bx $by 1 0 0 spice-model-1.sym"
echo "{"
echo "T $(echo $bx+100 | bc) $(echo $by+700 | bc) 5 10 0 1 0 0 1"
echo "device=model"
echo "T $(echo $bx+100 | bc) $(echo $by+600 | bc) 5 10 1 1 0 0 1"
echo "refdes=A$i"
echo "T $(echo $bx+1300 | bc) $(echo $by+300 | bc) 5 10 1 1 0 0 1"
echo "model-name=$model"
echo "T $(echo $bx+500 | bc) $(echo $by+100 | bc) 5 10 1 1 0 0 1"
echo "file=$path/$model.model" #ver de hacer un if
echo "}"
i=$(echo $i+1 | bc)
by=$(echo $by+$step | bc)
done

####################
######### para gates

bx=78000 #base x position
by=84200 #base y position
path="sources2/gates"
for model in $invmodels
do
echo "C $bx $by 1 0 0 spice-model-1.sym"
echo "{"
echo "T $(echo $bx+100 | bc) $(echo $by+700 | bc) 5 10 0 1 0 0 1"
echo "device=model"
echo "T $(echo $bx+100 | bc) $(echo $by+600 | bc) 5 10 1 1 0 0 1"
echo "refdes=A$i"
echo "T $(echo $bx+1300 | bc) $(echo $by+300 | bc) 5 10 1 1 0 0 1"
echo "model-name=$model"
echo "T $(echo $bx+500 | bc) $(echo $by+100 | bc) 5 10 1 1 0 0 1"
echo "file=$path/$model.model" #ver de hacer un if
echo "}"
i=$(echo $i+1 | bc)
by=$(echo $by+$step | bc)
done

####################

######### para decos

bx=83000 #base x position
by=84200 #base y position
path="sources2/deco"
for model in $decomodels
do
echo "C $bx $by 1 0 0 spice-model-1.sym"
echo "{"
echo "T $(echo $bx+100 | bc) $(echo $by+700 | bc) 5 10 0 1 0 0 1"
echo "device=model"
echo "T $(echo $bx+100 | bc) $(echo $by+600 | bc) 5 10 1 1 0 0 1"
echo "refdes=A$i"
echo "T $(echo $bx+1300 | bc) $(echo $by+300 | bc) 5 10 1 1 0 0 1"
echo "model-name=$model"
echo "T $(echo $bx+500 | bc) $(echo $by+100 | bc) 5 10 1 1 0 0 1"
echo "file=$path/$model.model" #ver de hacer un if
echo "}"
i=$(echo $i+1 | bc)
by=$(echo $by+$step | bc)
done

####################