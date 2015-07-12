#!/bin/bash
# download image-pages from the targeturl

if [ "$1" = "" ]; then
    echo "Usage: ./pagesdownload.sh targeturl"
    exit 1
fi

output="tmpfile-$$"
wget -q -O "$output" "$1"
pagenum=$(./pagenumget.sh < $output)

wget -q --timeout=6 --random-wait -r -l 1 -p -e robots=off -U mozilla --accept-regex='http://www.gettyimages.co.uk/detail/news-photo/.+/[0-9]+$' "$1" &

for ((i=2;i<="$pagenum";i++))
do
    pageurl=$(echo "$1" | awk -F "?" '{print $1}')
    pageurl="$pageurl""?excludenudity=true&family=editorial&page=""$i""&phrase=&sort=best"
    wget -q --timeout=6 --random-wait -r -l 1 -p -e robots=off -U mozilla --accept-regex='http://www.gettyimages.co.uk/detail/news-photo/.+/[0-9]+$' "$pageurl" &
done

rm -rf $output

exit 0
