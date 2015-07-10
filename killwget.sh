#!/bin/bash

trap 'rm -rf ./www.gettyimages.co.uk/ ./urlfile >&/dev/null; exit 1' INT

if [ "$1" = "" ]; then
    echo "Usage: ./killwget.sh numberOfImages"
    exit 1
fi

while true
do
    num=$(tree www.gettyimages.co.uk/detail/ 2>/dev/null | grep files | awk '{print $3}')
    if [ "$num" = "$1" ]; then
        sleep 5
        pkill -9 wget

        # download the images, after pagas download finished
	./getimages.sh

        exit 0
    fi
done

exit 0
