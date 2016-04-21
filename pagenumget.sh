#!/bin/bash
# get the number of pages

while read line
do
    echo $line | grep -E "/> of [[:digit:]]+<" >&/dev/null
    if [ "$?" = 0 ]; then
	#set $line
	#echo $3
	echo $line | cut -c -20 | awk '{print $3}' | awk -F "<" '{print $1}'
	break
    fi
done 

exit 0
