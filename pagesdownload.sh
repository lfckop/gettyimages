#!/bin/bash
# download image-pages from the targeturl

if [ "$1" = "" ]; then
    echo "Usage: ./pagesdownload.sh targeturl"
    exit 1
fi

output="tmpfile-$$"
wget -q -O "$output" "$1"
pagenum=$(./pagenumget.sh < $output)

if ! echo "$1" | grep "phrase" >&/dev/null ; then
    wget -q -r -l 1 --accept-regex='http://www.gettyimages.co.uk/detail/news-photo/.+/[0-9]+$' "$1" &
    for ((i=2;i<="$pagenum";i++))
    do
	pageurl=$(echo "$1" | awk -F "?" '{print $1}')
	pageurl="$pageurl""?excludenudity=true&family=editorial&page=""$i""&phrase=&sort=best"
	wget -q -r -l 1 --accept-regex='http://www.gettyimages.co.uk/detail/news-photo/.+/[0-9]+$' "$pageurl" &
    done
else
    wget -q -r -l 1 "$1" &
    for ((i=2;i<="$pagenum";i++))
    do
	pageurl="$1"
	if echo $pageurl | grep page >&/dev/null ; then
	    pageurl=${pageurl/page=1/page="$i"}
	else
	    pageurl="${pageurl}&page=${i}"
	fi
	wget -q -r -l 1 "$pageurl" &
    done
fi

rm -rf $output

exit 0
