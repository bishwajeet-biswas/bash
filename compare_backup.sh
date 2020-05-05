#!/bin/bash


compare () {

   read -r -p "please enter the namespace : " namespace
   read -r -p "Please enter the component : " component
   kubectl get deploy -o wide -n $namespace | grep $component | awk '{print $1 "\t==>\t" $7}'
}


while true
do
 
compare 

 echo "\n"
 read -r -p "Do you want to compare image with other environment [Y/n] " input
 
 case $input in
     [yY][eE][sS]|[yY])
 

 echo "\n"

 compare
 
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

