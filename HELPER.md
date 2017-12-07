# Helper For OS
This is a helpful document for your opensmarty-starter.

##Create your tag and deploy it in your git system, please.
```bash
git tag v1.0.0 -m '发布源码v1.0.0版本'
git push origin --tag
```
##How do you use your git to delete the local tag?
```bash
git tag -d v1.0.0
```
##How do you use your git to delete the remote tag?
```bash
git push origin --delete tag v1.0.0
```
##How do you release your tags to Github?
###1.点击【Release】按钮.
###2.如果要创建Release,则点击右上角【Draft a new release】按钮.

#Upgrade php7.0 to php7.1 for your Ubuntu 16.04.
##升级php7.1
```bash
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get upgrade php
sudo apt-get install php7.1-mbstring
sudo apt-get install php7.1-gd
sudo apt-get install php7.1-dom
sudo apt-get install php7.1-mysql
sudo apt-get install php7.1-sqlite
sudo apt-get install php7.1-mcrypt
sudo apt-get install php7.1-fpm
sudo apt-get install php7.1-cgi
sudo apt-get install php7.1-phpdbg
```

##phalcon重新安装，注意要兼容php7.1。
```bash
sudo apt-get install php7.1-dev libpcre3-dev gcc make re2c
sudo cp /etc/php/7.0/mods-available/phalcon.ini  /etc/php/7.1/mods-available/phalcon.ini 
sudo ln -s /etc/php/7.1/mods-available/phalcon.ini  /etc/php/7.1/apache2/conf.d/20-phalcon.ini
sudo ln -s /etc/php/7.1/mods-available/phalcon.ini  /etc/php/7.1/fpm/conf.d/20-phalcon.ini
sudo ln -s /etc/php/7.1/mods-available/phalcon.ini  /etc/php/7.1/cli/conf.d/20-phalcon.ini
sudo ln -s /etc/php/7.1/mods-available/phalcon.ini  /etc/php/7.1/cgi/conf.d/20-phalcon.ini
sudo ln -s /etc/php/7.1/mods-available/phalcon.ini  /etc/php/7.1/phpdbg/conf.d/20-phalcon.ini

git clone git://github.com/phalcon/cphalcon.git
cd cphalcon/build
sudo ./install
```
##Generate new token
https://github.com/settings/tokens 点击 「Generate new token」