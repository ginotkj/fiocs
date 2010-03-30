#!/bin/sh
##
## make_parts.sh
## 
## Made by Facundo
## Login   <facundo@faku-laptop>
## 
## Started on  Sat Mar 20 12:44:13 2010 Facundo
## Last update Sat Mar 20 12:44:13 2010 Facundo
##

part=$1
qty=$2

for i in $(seq 1 1 $qty)
do
cp -v $part.sch $part$i.sch
sed -i -e "s/\(model-name=$part\)/\1$i/" $part$i.sch
sed -i -e "s/current_page/$i/" $part$i.sch
sed -i -e "s/total_pages/$qty/" $part$i.sch
sed -i -e "s/<filename>/$part$i\.sch/" $part$i.sch
done