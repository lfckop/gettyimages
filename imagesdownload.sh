#!/bin/bash
# download the images

# check the path
path="/Users/zhouwei/gettyimages/www.gettyimages.co.uk/detail/news-photo"
if [ -d $path ]; then
    :
else
    echo "error: $path not exist"
    exit 1
fi

set $(date)
imagedir="$4-$2-images"
mkdir $imagedir

# get image urls from the image pages
for page in $(find $path -type f)
do 
    ./imageurlget.sh < $page
done > urlfile

# download the images based on image-urls
i=1
while read line
do 
    wget -q --timeout=6 -O ./$imagedir/${i}.jpg $line >&/dev/null &
    ((i++))
done < urlfile

echo "$imagedir"

exit 0
