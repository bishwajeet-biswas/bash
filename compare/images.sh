#!/bin/bash

components="ui
panel
api
sms
trainer
insert
broker
proxy
mdw
midd
redis
noti
rab
widget
integ"

echo "This script is going to fetch images of in specific order "

read -r -p "please enter the namespace : " namespace

cron () {

   kubectl get cronjobs -o wide -n $namespace | awk '{print $1 " ==> " $12}'
}

statefulsets () {
    kubectl get statefulsets -o wide -n $namespace | awk '{print $1 " ==> " $5}'
}

deploy () {
    echo
    for i in $components
    do
   
        kubectl get deploy -o wide -n $namespace | grep $i | awk '{print $1 " ==>  " $7 }'
        echo
    done

}

# echo
# for i in $components
# do
   
#     kubectl get deploy -o wide -n $namespace | grep $i | awk '{print $1 " ==>  " $7 }'
#     echo
# done
    
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
