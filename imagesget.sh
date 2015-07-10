#!/bin/bash

path="/Users/zhouwei/gettyimages/www.gettyimages.co.uk/detail/news-photo"
if [ -d $path ]; then
    :;
else
    echo "error: $path not exist"
    exit 1
fi

set $(date)
imagedir="$4-$2-images"
mkdir $imagedir

# get image urls from the pages
for page in $(find $path -type f); do ./urlget.sh < <(cat $page); done > urlfile

# download the images based on image-urls
i=1; while read line; do wget --timeout=6 -O ./$imagedir/${i}.jpg $line >& /dev/null; ((i++)); done < urlfile

# clean files
rm -rf ./www.gettyimages.co.uk/
rm -rf ./urlfile

# count the images downloaded
ls $imagedir | wc -l

exit 0
