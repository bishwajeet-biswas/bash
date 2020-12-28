#!/bin/bash
# first lets get the uniq content from the file

j=()
cat logfile | awk '{print $1}' | sort  | uniq > uniqfiles

echo "this script is going to get the ip addresses printed in first column and their word counts"
count=0
for i in `cat uniqfiles`
do
    j[count]=$(grep $i logfile | wc -l)
    count=$((count+1))
done

echo ${j[*]}
arr=($(echo ${j[*]}| tr " " "\n" | sort -n))

echo ${arr[*]}


for i in `cat uniqfiles`
do
    #echo -n " $i "
    for j in "echo ${arr[*]}"
    do
        if [ "$j" == "$(grep $i logfile | wc -l)" ];
        then
        #echo -n " $i "
        #grep $i logfile | wc -l
        echo "hello" && echo $j
        else 
        echo "this is $j"
        fi
    done
    #grep $i logfile | wc -l
done

