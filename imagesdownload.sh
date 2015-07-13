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

# download the images based on image-urls
i=1
for page in $(find $path -type f)
do 
    imageurl=$(./imageurlget.sh < $page)
    wget -q --timeout=6 -O ./$imagedir/${i}.jpg $imageurl >&/dev/null &
    ((i++))
done 

echo "$imagedir"

exit 0