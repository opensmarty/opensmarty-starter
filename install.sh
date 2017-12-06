#!/bin/bash
#========================================================================
#   FileName: deploy.sh
#     Author: nicolas
#      Email: opensmarty@163.com
#   HomePage: http://opensmarty.github.io
# LastChange: 2017-10-13 21:05:13
#========================================================================


# import common functions
source common.sh

APP_PATH=`dirname $BASE`
# Change some file permissions
ECHO "Change some file permissions : \c"

read -p "Warning: Change [all/one] file permissions, continue? [0/1/2]" re
if [ $re == 0 ]; then
    changeFileMod $APP_PATH
elif [ $re == 1 ]; then
    # 特定目录权限更改，如日志、缓存等，主要针对source/storage/
    chmod -R 777 $APP_PATH/source/storage/
else
    echo "Don't change the file permissions"
fi

ECHO $COLOR_GREEN "Change [$re] file permissions: [ok]"

# require dpkg packages list
for package in $(cat $BASE/packages.txt)
do
    requirePackage $package
done

# deploy apache configure files
deployFiles $BASE/configure/apache2/apache2.conf /etc/apache2/apache2.conf

# deploy apache httpd configure files
deployFiles $BASE/configure/apache2/httpd.conf /etc/apache2/httpd.conf

# deploy apache site configure files
deployFiles $BASE/configure/apache2/conf.d/$APP.conf /etc/apache2/conf.d/

# deploy nginx configure files
deployFiles $BASE/configure/nginx/nginx.conf /etc/nginx/nginx.conf

# deploy nginx site configure files
deployFiles $BASE/configure/nginx/conf.d/$APP.conf /etc/nginx/conf.d/

# deploy php configure files
#deployFiles $BASE/configure/php7/conf.d/* /etc/php7/conf.d/

# enable apache mods
for mod in $(cat ./configure/apache2/enable.txt)
do
    enableMod $mod
done

#str_replace "myhc" "myhappyclass" $BASE/configure/apache2/conf.d/$APP.conf
#str_replace "myhc" "myhappyclass" $BASE/configure/nginx/conf.d/$APP.conf

# change owners to www-data
# change file permissions to 644
#chown -R www-data:www-data $BASE/../
#chmod -R 644 $BASE/../

# restart apache2 service to continue
service apache2 restart
service nginx restart

WELCOME="Welcome to $APP, everyone! This system must support $OS with version $VERSION."
ECHO $COLOR_GREEN "[WELCOME]:$WELCOME"

end=$(date +%s%N)
end_ms=${end:0:16}
echo "cost time is:"
echo "scale=6;($end_ms - $start_ms)/1000000" | bc