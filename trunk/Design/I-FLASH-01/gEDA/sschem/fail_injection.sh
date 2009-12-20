#!/bin/sh
##
## fail_injection.sh
## 
## Made by Facundo
## Login   <facundo@faku-laptop>
## 
## Started on  Tue Dec 15 20:47:38 2009 Facundo
## Last update Sat Dec 19 21:12:30 2009 Facundo
##

circuit=$1
tempdir=$(mktemp -d)
tempcir="$tempdir/tempcirfile.cir"
trancount=0

function check_out {
    if [ $1 -eq 0 ]
    then
	echo "OK"
    else
	echo "Fail"
    fi
    return 0
}

if [ -z $circuit ]
then
    echo "Please give a circuit file!"
    exit 2
fi

echo "Created temporary dir $tempdir...OK"
echo -n "Creating temporary file $tempcir..."
check_out $?

trancount=$(cat $circuit | grep ^M | wc -l)
echo "Transistor count: $trancount"

echo "Identifying groups..."
cat $circuit | grep ^M | awk -F' ' '{print $1}' > $tempcir
group1=$(cat $tempcir | awk -F'_' '{print $1}' | sort | uniq | wc -l)
group2=$(cat $tempcir | awk -F'_' '{print $2}' | sort | uniq | wc -l)
echo "$group1 block components identified at TOP level schem"
echo "$group2 block components identified at BOTTOM level schem"

echo -n "Cleaning temp files..."
rm -fr $tempdir
check_out $?