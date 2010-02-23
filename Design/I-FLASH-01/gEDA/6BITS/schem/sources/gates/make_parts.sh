#!/bin/sh
##
## make_parts.sh
## 
## Made by Facundo
## Login   <facundo@faku-laptop>
## 
## Started on  Mon Feb 22 23:58:45 2010 Facundo
## Last update Tue Feb 23 00:00:17 2010 Facundo
##

for i in $(seq 1 1 63)
do 
    cp -v $1 inv.$i.sch
done