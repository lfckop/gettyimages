this is a small tool used to grab images from www.gettyimages.co.uk, and it's still evolving.

authored by zhouwei, on 2015-7-10


#Usage:
    $ ./multiget.sh pageurl…

images downloaded are in ./xxx-images/

enjoy it!


#Example:
find an item(like sports, entertainment, news) in the http://www.gettyimages.co.uk/editorial-images, and then choose one event.

for example, if you want to download the images in the site:

http://www.gettyimages.co.uk/search/events/563919255?editorialproduct=entertainment

then you should run it like this:

    $ ./multiget.sh "http://www.gettyimages.co.uk/search/events/563919255?editorialproduct=entertainment"

***attention***: in "pageurl", **""** is needed.


#any problems? 
please contact me: weizhou@mail.ustc.edu.cn
