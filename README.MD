this is a small tool used to grab images from www.gettyimages.co.uk, and it's still evolving.

authored by zhouwei, on 2015-7-10


#Usage:
    $ ./multiget.sh pageurl…

images downloaded are in ./xxx-images/

enjoy it!


#Example:
find a item(like sports, entertainment, news) in the http://www.gettyimages.co.uk/editorial-images, and then choose one event.

for example, if you want to download the images in the site:

http://www.gettyimages.co.uk/search/events/563919255?editorialproduct=entertainment

then you should run it like this:

    $ ./multiget.sh "http://www.gettyimages.co.uk/search/events/563919255?editorialproduct=entertainment"

***attention***: in "pageurl", "" is needed.


#More
if you want to make it more thoroughly, you may just run it like this:

    $ ./auto.sh

it will download liverpoolfc's latest training images automatically. 

***attention***: if you want to download other images, you need to change the homepage site and the grep keywords in the file ./rooturlget.sh 

***attention***: this way is **not** recommended to use, and it may only be used by myself.


#any problems? 
please contact me: weizhou@mail.ustc.edu.cn
