#!/bin/bash
#========================================================================
#   FileName: common.sh
#     Author: Nicolas Wan
#      Email: opensmarty@163.com
#   HomePage: http://opensmarty.github.io
# LastChange: 2017-10-13 21:05:13
#========================================================================
start=$(date +%s%N)
start_ms=${start:0:16}

# Console customed prompt color
COLOR_GREEN="\033[0;32m"
COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[1;33m"
COLOR_REMOVE="\e[00m"
BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# This is the application of name.
APP="happyclass"
DATE=`date +%y%m%d`

# 更改项目权限.
changeFileMod () {
    # 初始化项目权限
    for element in `ls $1`
    do
        file=$1/$element
        if [ -d $file ]
        then
            echo $file 是目录
            chmod 775 $file
            changeFileMod $file
        else
            echo $file 是文件
            fileinfo=`basename $file`
            filename=${fileinfo%.*}
            extension=${fileinfo##*.}
            if [ $extension == "sh" ]
            then
                chmod 744 $file
            else
                chmod 644 $file
            fi
        fi
    done
}

# handle string with sed.
str_replace () {
    sed -i 's/$1/$2/g' $3
}


# enhanced echo
ECHO () {
    echo -e $1$2$COLOR_REMOVE
}

# detect and install
requirePackage () {
    ECHO "Detecting Package [$1] : \c"

    # install apache2 if have not
    if ! havePackage $1 &>/dev/null
    then
        ECHO $COLOR_YELLOW "[miss]"
        ECHO "$1 not installed, going to install ... ... \c"
        if ! aptInstall $1 &>/dev/null
        then
            ECHO $COLOR_RED "[fail]"
            echo "Error: $1 install failed, please fix it manually"
            exit 1
        fi
    fi

    ECHO $COLOR_GREEN "[ok]"
    return 0
}

# apache mod enable
enableMod () {
    ECHO "Enable apache mod [$1]: \c"
    #if ( ln -s /etc/apache2/mods-available/$1.* /etc/apache2/mods-enabled/ -f )
    if ( a2enmod $1 &>/dev/null )
    then
        ECHO $COLOR_GREEN "[ok]"
    else
        ECHO $COLOR_GREEN "[fail]"
        echo "Please Fix manually on enable mod [$1]"
    fi
}

# deploy files
deployFiles () {
    cp -u $1 $2 &>/dev/null
}



if ! haveCMD lsb_release &>/dev/null
then
    echo 'Error: lsb_release not detected, seems not a proper platform for this script'
    exit 1
fi

# Enviroment needed to be Ubuntu 16.04
OS=$(lsb_release -si)
VERSION=$(lsb_release -sr)

if [ "$OS" != "Ubuntu" ]; then
    echo "Error: This deploy script only apply to Ubuntu"
    exit 1
fi

if [[ "$VERSION" != "16.04" ]]; then
    read -p "Warning: Recommond Ubuntu Version is 14.04, continue? [y/n]" re
    if [ $re == 'n' ]; then
        echo "Error: script stopped"
        exit 1
    fi
fi
