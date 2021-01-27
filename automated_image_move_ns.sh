#!/bin/bash
timestamp=`date +%d-%m-%Y:%H:%M:%S`
echo $timestamp
#hostname=$(hostname)
#echo $hostname
#echo $hostname USER IS GOING TO DEPLOY ON $destinationnamespace NAMESPACE $date >> log.txt
######################GET SOURCE NS #################################
kubectl get namespace | awk '{print $1}'
read -p "ENTER SOURCE NAMESPACE : " sourcenamespace
#######################GET DESTINATION NS############################
kubectl get namespace | awk '{print $1}'
read -p "ENTER DESTINATION NAMESPACE : " destinationnamespace
#######################GET SOURCE DEPLOY ############################
kubectl get deploy -o wide -n $sourcenamespace  | awk '{print $1}'
read -p "Enter Source pod name : " name
echo "Hi, $name. ENTER SOURCE POD NAME!"
########################GET DESTINATION POD ##########################
kubectl get deploy -o wide -n $destinationnamespace | awk '{print $1}'
read -p "ENTER DESTINATION POD NAME : " destname
##########################To find old image id########################
OldImageID=$(kubectl get deploy -o wide -n $destinationnamespace | grep $destname | awk '{print $7}' )
#echo "Hi, $destname. Destination pod name"
#########################GET SOURCE CONTAINER ########################
container=$(kubectl get deploy $name -n $sourcenamespace -o jsonpath='{.spec.template.spec.containers[*].name}')
version=$(kubectl get deploy -o wide -n $sourcenamespace | grep $name | awk '{print $7}' )
echo $version
echo "\e[1;31m NEW IMAGE DEPLOY WILL BE \e[0m" $version on $destinationnamespace
######################################################################
destcontainer=$(kubectl get deploy $destname -n $destinationnamespace -o jsonpath='{.spec.template.spec.containers[*].name}')
echo $destcontainer
sleep 2
########################## DEPLOYMENT #################################
kubectl set image deployment/$destname $destcontainer=$version -n $destinationnamespace

echo New Image id $version on $destinationnamespace namespace from $sourcenamespace container=$destname on $timestamp instead of $OldImageID >> deployment.log
echo Old Image id= $OldImageID
echo New Image id= $version
#######################################################################
