#!/bin/bash
# first lets get the uniq content from the file

count=()
cat logfile | awk '{print $1}' | sort  | uniq > uniqfiles

echo "this script is going to get the ip addresses printed in first column and their word counts"
j=0
for i in `cat uniqfiles`
do
    count[j]=$(grep $i logfile | wc -l)
    j=$((j+1))     
done

echo ${count[*]}

for ((i = 0; i<5; i++)) 
do
      
    for((j = 0; j<5-i-1; j++)) 
    do
      
        if [ ${count[j]} -gt ${count[$((j+1))]} ] 
        then
            # swap 
            temp=${count[j]} 
            arr[$j]=${count[$((j+1))]}   
            arr[$((j+1))]=$temp 
        fi
    done
done
  
echo "Array in sorted order :"
echo ${count[*]} 
