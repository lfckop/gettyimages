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
        sleep 3
        pkill -9 wget
	sleep 2

	echo -e "\n******  just relax, I'm still working for you, please wait  ******\n"

        # download the images, after pages download finished
	result=$(./imagesget.sh)
	echo "*****************************************"
	if [ $result -eq $1 ]; then
	    echo "   done! $result images downloaded!"
        else
	    echo "there are $1 images, but only $result images downloaded, you may restart the mission if you want"
	fi
	echo "*****************************************"

        # ring the bell when it's finished
        echo -e "\a\a\a\a\a\a\a\a\a\a"
        exit 0
    fi
done

exit 0
