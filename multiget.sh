#!/bin/bash

begin=$(date +%s)

check=$(which wget)
if [ "$check" = "" ]; then
    echo "please install wget, exit!"
    exit 1
fi

trap 'rm -rf ./www.gettyimages.co.uk/ ./urlfile >&/dev/null; pkill -9 wget; exit 1' INT

if [ "$1" = "" ]; then
    echo "Usage: ./multiget.sh pageurl..."
    exit 1
fi

# download image-pages from the pageurl
for pageurl in "$@"
do
   ./pagesdownload.sh "$pageurl" 
done

while true
do
    pgrep wget >&/dev/null
    if [ "$?" = 1 ]; then
	# pages download is finished
	break
    fi
done

echo -e "\n******  just relax, I'm still working for you, please wait  ******\n"

# download the images, after pages download finished
imagedir=$(./imagesdownload.sh)

while true
do
    pgrep wget >&/dev/null
    if [ "$?" = 1 ]; then
        # images download is finished
        break
    fi
done

# clean temp files
rm -rf ./www.gettyimages.co.uk/ >&/dev/null

# count the images downloaded
result=$(ls $imagedir | wc -l | awk '{print $1}')

echo "*****************************************"
echo "   done! $result images downloaded!"
echo "*****************************************"

# ring the bell when it's finished
echo -e "\a\a\a\a\a\a\a\a\a\a"

end=$(date +%s)
timeused=$((end-begin))
if [ $timeused -lt 60 ]; then
    echo "******  time consumed: $timeused seconds  ******"
else
    min=$((timeused/60))
    sec=$((timeused-60*min))
    if [ $min -eq 1 ]; then
        echo "******  time consumed: 1 minute $sec seconds  ******"
    else
	echo "******  time consumed: $min minutes $sec seconds  ******"
    fi
fi
echo ""

exit 0
