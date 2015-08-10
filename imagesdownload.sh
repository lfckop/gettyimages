#!/bin/bash
# download the images

# check the path
path="$(pwd)/www.gettyimages.co.uk/detail/news-photo"
if [ ! -d $path ]; then
    echo "error: $path not exist"
    exit 1
fi

imagedir="images-"$(date "+%Y%m%d-%H时%M分%S秒")
mkdir $imagedir

# download the images based on image-urls
i=1
for page in $(find "$path" -type f)
do 
    imageurl=$(./imageurlget.sh < $page)
#    wget -q --timeout=6 -O ./$imagedir/${i}.jpg $imageurl >&/dev/null &
    pagename=$(echo $page | awk -F "/" '{print $NF}')
    wget -q --timeout=6 -O ./$imagedir/${pagename}.jpg $imageurl >/dev/null &
    ((i++))
done 

echo "$imagedir"

exit 0
