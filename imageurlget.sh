#!/bin/bash
# get the image url from each page

keyword="data-gallery_comp1024_url"
while read line
do 
    echo $line | grep $keyword > /dev/null 
    if [ "$?" = 0 ]; then 
        set $line
        for var in "$@"
        do 
            echo $var | grep $keyword > /dev/null
            if [ "$?" = 0 ]; then
                echo $var | sed "s/amp;//g" | awk -F '"' '{print $2}'
                break
            fi
        done

        break
    fi
done 

exit 0
