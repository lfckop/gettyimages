#!/bin/bash
# download the images

# check the path
path="/Users/zhouwei/gettyimages/www.gettyimages.co.uk/detail/news-photo"
if [ ! -d $path ]; then
    echo "error: $path not exist"
    exit 1
fi

set $(date)
imagedir="images-$2-$4"
mkdir $imagedir

# download the images based on image-urls
i=1
for page in $(find $path -type f)
do 
    imageurl=$(./imageurlget.sh < $page)
#    wget -q --timeout=6 -O ./$imagedir/${i}.jpg $imageurl >&/dev/null &
    pagename=$(echo $page | awk -F "/" '{print $9}')
    wget -q --timeout=6 -O ./$imagedir/${pagename}.jpg $imageurl >&/dev/null &
    ((i++))
done 

echo "$imagedir"

exit 0
