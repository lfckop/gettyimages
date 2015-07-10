#!/bin/bash

out=$(./rooturlget.sh); 
targeturl=$(echo $out | awk -F '"' '{print $2}'); 
targeturl="http://www.gettyimages.co.uk""$targeturl"; 
numOfImages=$(echo $out | awk -F ">" '{print $2}' | awk '{print $1}'); 

./pagesget.sh "$targeturl" &
sleep 2
time ./killwget.sh "$numOfImages"

exit 0
