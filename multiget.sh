#!/bin/bash

n="$#"

if [ "$n" = 0 ]; then
    echo "Usage: ./multiget.sh url... numOfImages"
    exit 1
fi

for ((i=1;i<n;i++))
do
    eval url='$'"$i"
    ./pagesget.sh $url &
done

eval numOfImages='$'"$n"
time ./killwget.sh $numOfImages

exit 0
