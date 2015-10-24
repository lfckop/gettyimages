#!/bin/bash
# download image-pages from the targeturl

if [ "$1" = "" ]; then
    echo "Usage: ./pagesdownload.sh targeturl"
    exit 1
fi

output="tmpfile-$$"
wget -q -O "$output" "$1"
pagenum=$(./pagenumget.sh < $output)
if [ "$pagenum" -gt 6 ]; then pagenum=6; fi
#pagenum=1

wget -q -r -l 1 --accept-regex='http://www.gettyimages.co.uk/detail/news-photo/.+/[0-9]+$' "$1" &
for ((i=2;i<="$pagenum";i++))
do
    pageurl="$1""&page=$i"
    wget -q -r -l 1 --accept-regex='http://www.gettyimages.co.uk/detail/news-photo/.+/[0-9]+$' "$pageurl" &
done

rm -rf $output

exit 0
