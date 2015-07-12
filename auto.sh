#!/bin/bash

check=$(which wget)
if [ "$check" = "" ]; then
    echo "please install wget, exit!"
    exit 1
fi

time ./multiget.sh $(./rooturlget.sh)

exit 0
