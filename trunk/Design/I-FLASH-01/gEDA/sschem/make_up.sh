#!/bin/bash

cirfile=$1
clean_cirfile=$2

cat $cirfile | sed -e 's/\(S..\/S..\/GND\)/0/g' | sed -e 's/\(S..\/GND\)/0/g' | sed -e 's/\//_/g' > $clean_cirfile

