#!/bin/bash

trap 'rm -rf ./www.gettyimages.co.uk/ ./urlfile >&/dev/null; exit 1' INT

if [ "$1" = "" ]; then
    echo "Usage: ./killwget.sh numberOfImages"
    exit 1
fi

while true
do
    num=$(find ./www.gettyimages.co.uk/detail/ -type f 2>/dev/null | wc -l | awk '{print $1}')
    if [ "$num" = "$1" ]; then
        sleep 5
        pkill -9 wget

        # download the images, after pages download finished
	./imagesget.sh

        exit 0
    fi
done

exit 0
