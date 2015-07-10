this is a simple tool used to grab images from www.gettyimages.co.uk

authored by zhouwei, on 2015-7-10

#Usage:
$ ./pagesget.sh targetUrl

$ ./killwget.sh numberOfImages

images downloaded are in ./xxx-images/

enjoy it!

#Example:
if you want to download the images in the site:

    http://www.gettyimages.co.uk/search/events/563919255?editorialproduct=entertainment

then you should do it like this:

$ ./pagesget.sh "http://www.gettyimages.co.uk/search/events/563919255?editorialproduct=entertainment"

important: in "$url", "" is needed

then in another terminal:

$ ./killwget.sh 11

important: the number 11 is the count of images in the site

#any problems? 
please contact me: weizhou@mail.ustc.edu.cn
