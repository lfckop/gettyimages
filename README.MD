this is a small tool used to grab images from www.gettyimages.co.uk

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

#More
if you want to do it more thoroughly, you may just run it like this:

$ ./auto.sh

it will download liverpoolfc's latest training images automatically. 

attention: if you want to download other images, you need to modify the grep keywords in ./rooturlget.sh

#any problems? 
please contact me: weizhou@mail.ustc.edu.cn
