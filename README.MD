this is a small tool used to grab images from www.gettyimages.co.uk

authored by zhouwei, on 2015-7-10


#Usage:
    $ ./multiget.sh url… numOfImages

images downloaded are in ./xxx-images/

enjoy it!


#Example:
if you want to download the images in the site:

    http://www.gettyimages.co.uk/search/events/563919255?editorialproduct=entertainment

then you should run it like this:

    $ ./multiget.sh "http://www.gettyimages.co.uk/search/events/563919255?editorialproduct=entertainment" 11

***attention***: in "url", "" is needed.

***attention***: the number 11 is the count of images in the site.

*************************

*or*, if you want to download the images in the site(117 images, 2 pages):
    
    http://www.gettyimages.co.uk/search/events/538759813?editorialproduct=liverpoolfc

then you should run it like this:

$ ./multiget.sh "http://www.gettyimages.co.uk/search/events/538759813?editorialproduct=liverpoolfc" "http://www.gettyimages.co.uk/search/events/538759813?excludenudity=true&family=editorial&page=2&phrase=&sort=best" 107

***attention***: "" is needed, 107 is the total count of images in 2 pages.


#More
if you want to make it more thoroughly, you may just run it like this:

    $ ./auto.sh

it will download liverpoolfc's latest training images automatically. 

***attention***: if you want to download other images, you need to change the homepage site and the grep keywords in the file ./rooturlget.sh 


#any problems? 
please contact me: weizhou@mail.ustc.edu.cn
