#/bin/bash!
# first lets get the uniq content from the file

 cat logfile | awk '{print $1}' | sort  | uniq > uniqfiles

echo "this script is going to get the ip addresses printed in first column and their word counts"

for i in `cat uniqfiles`
do
    #echo -n " $i \t -" 
    j=$(grep $i logfile | wc -l)
    echo $j  
    
done

echo $j
rm uniqfiles
