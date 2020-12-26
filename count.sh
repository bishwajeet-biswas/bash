#/bin/bash!
# first lets get the uniq content from the file

 cat logfile | awk '{print $1}' | uniq > uniqfiles

echo "this script is going to get the ip addresses printed in first column and their word counts"

for i in `cat uniqfiles`
do
    echo -n " $i " 
    grep $i logfile | wc -l 
done

rm uniqfiles
