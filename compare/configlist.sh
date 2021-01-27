#!/bin/bash

read -r -p "which namespace =  : " namespace

kubectl get cm -n $namespace | awk 'NR!=1{print $1}' > config.txt

for i in `cat config.txt`

do 
    echo "for deployment= " $i
    kubectl get cronjob -n $namespace -o yaml | grep $i -B 2
    echo "\n--***--"
done

