# I'm broken! Fix me!!!

This is a small tool used to grab images from www.gettyimages.co.uk, and it's still evolving.

Authored by zhouwei, on 2015-7-10


#Usage:
    $ ./multiget.sh pageurl…

images downloaded are in ./xxx-images/

Enjoy it!


#Example:
Find an item(like sports, entertainment, news) in the http://www.gettyimages.co.uk/editorial-images, and then choose one event.

For example, if you want to download the images in the site:

http://www.gettyimages.co.uk/search/events/563919255?family=editorial&sort=best&excludenudity=true&phrase=

then you should run it like this:

    $ ./multiget.sh "http://www.gettyimages.co.uk/search/events/563919255?family=editorial&sort=best&excludenudity=true&phrase="
the site **must** be put in **""**.


#Any problems? 
Please contact me: weizhou@mail.ustc.edu.cn
