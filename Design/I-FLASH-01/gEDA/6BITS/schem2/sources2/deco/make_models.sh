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

decomodels='
deco64_2inand1
deco64_2inand2
deco64_2inand3
deco64_2inand4
deco64_2inand5
deco64_2inand6
deco64_2inand7
deco64_2inand8
deco64_2inand9
deco64_2inand10
deco64_2inand11
deco64_2inand12
deco64_2inand13
deco64_2inand14
deco64_2inand15
deco64_2inand16
deco64_2inand17
deco64_2inand18
deco64_2inand19
deco64_2inand20
deco64_2inand21
deco64_2inand22
deco64_2inand23
deco64_2inand24
deco64_2inand25
deco64_2inand26
deco64_2inand27
deco64_2inand28
deco64_2inand29
deco64_2inand30
deco64_2inand31
deco64_2inand32
deco64_2inand33
deco64_2inand34
deco64_2inand35
deco64_2inand36
deco64_2inand37
deco64_2inand38
deco64_2inand39
deco64_2inand40
deco64_2inand41
deco64_2inand42
deco64_2inand50
deco64_2inand59
deco64_2inand43
deco64_2inand44
deco64_2inand45
deco64_2inand46
deco64_2inand47
deco64_2inand48
deco64_2inand49
deco64_2inand51
deco64_2inand52
deco64_2inand53
deco64_2inand54
deco64_2inand55
deco64_2inand56
deco64_2inand57
deco64_2inand58
deco64_inv2
deco64_inv1
deco64_inv3
deco64_inv4
deco64_inv5
deco64_inv6
deco64_inv7
deco64_inv8
deco64_8inand1
deco64_8inand2
deco64_8inand3
deco64_8inand4
deco64_8inand5
deco64_8inand6
deco64_8inand7
deco64_4inand2
deco64_4inand1'

i=1 #counter
step=-1000


######### para decos

bx=100000 #base x position
by=85000 #base y position
path="../gates"
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