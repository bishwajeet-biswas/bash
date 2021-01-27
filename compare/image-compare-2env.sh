#!/bin/bash

components="ui
user
panel
api
sms
trainer
insert
eja
broker
proxy
mdw
redis
widget
integ
module
s0
noti
redis"



echo "This script is going to fetch images of in specific order "

read -r -p "please enter the First Namespace : " namespace
read -r -p "Please enter the Second Namespace: " ns2

cron () {

   
   kubectl get cronjobs -o wide -n $namespace | awk '{print $1 " ==> " $12}'
   
   kubectl get cronjobs -o wide -n $ns2       | awk '{print $1 " ==> " $12}'
}

statefulsets () {
   
    kubectl get statefulsets -o wide -n $namespace | awk '{print $1 " ==> " $5}'
   
    kubectl get statefulsets -o wide -n $ns2       | awk '{print $1 " ==> " $5}'
}

deploy () {
    echo
    for i in $components
    do
   
        echo "$i of $namespace"
        kubectl get deploy -o wide -n $namespace | grep $i | awk '{print $1 " ==>  " $7 }'
        echo
        echo "$i of $ns2"
        kubectl get deploy -o wide -n $ns2 | grep $i | awk '{print $1 " ==>  " $7 }'
        echo
    done

}


    
while true
do
  
 echo "\n"
 read -r -p "Do you want to see deployment images [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 

 echo "\n"

 deploy
 
break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done

while true
do
  
 echo "\n"
 read -r -p "Do you want to see cronjobs images [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 

 echo "\n"

 cron
 
break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done

while true
do
  
 echo "\n"
 read -r -p "Do you want to see statefulsets images [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 

 echo "\n"

 statefulsets
 
break
 ;;
     [nN][oO]|[nN])
 echo "No"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done
