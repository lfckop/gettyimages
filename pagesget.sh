#!/bin/bash

if [ "$1" = "" ]; then
    echo "Usage: ./pagesget.sh targeturl"
    exit 1
fi

wget --random-wait -r -l 1 -p -e robots=off -U mozilla "$1"

exit 0
