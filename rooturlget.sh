#!/bin/bash

homepage="http://www.gettyimages.co.uk/editorialimages/sport"
wget $homepage -O output >& /dev/null
count=0
while read line
do
    echo $line | grep -i "liverpool" | grep -i "training session" >& /dev/null
#    echo $line | grep -i "jordan henderson" >& /dev/null
    if [ "$?" = 0 ]; then
        count=1
	continue
    fi
    if [ "$count" -gt 0 ]; then
	((count++))
	if [ $count -eq 14 ]; then
	    echo $line
	    break
	fi
    fi
done < output

rm -rf output >& /dev/null

exit 0
