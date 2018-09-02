#! /usr/bin/sh

eval sudo cp build/html/*.html /var/www/pocketMoney/html/
eval sudo cp build/html/*.js /var/www/pocketMoney/html/
eval sudo cp build/html/_static/* /var/www/pocketMoney/html/_static/
eval sudo service httpd restart
echo "check http://150.95.180.56/pocketMoney/html/"
echo "ok"
