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

# enhanced echo
ECHO () {
    echo -e $1$2$COLOR_REMOVE
}


#提交说明参数，命令没带参数，则设m为空

if [ -z $1 ]
then
    m="ok, this is empty info for committing."
else
    m=$1
fi

#根目录
root=$(pwd)
cd $root

#项目名称
#demo for github:
#   https://github.com/opensmarty/opensmarty-demo.git
#starter for github:
#   https://github.com/opensmarty/opensmarty-starter.git
# 自动化同步发布demo和starter
# demo 用于测试及开发laravel扩展包； starter只是一个纯净的框架，禁止提交非必要文件。
demo=${root##*/}
starter=${demo%-*}-'starter'
#远程分支

# branch[0] 为默认的origin.
branchName[0]="origin"
branchName[1]="demo"
branchName[2]="starter"

branch[0]="git@github.com:opensmarty/$demo.git"
branch[1]="git@github.com:opensmarty/$demo.git"
branch[2]="git@github.com:opensmarty/$starter.git"

print_r() {
    index=0
    for name in ${branch[@]}
    do
        echo "branch["$index"]/【${branchName[$index]}】:"$name
        ((index++))
    done
}

#打印项目分支
ECHO $COLOR_RED "打印项目分支如下:"
print_r

#提交函数
push(){

    index=0
    for val in ${branch[@]}
    do
        origin=${branchName[$index]}

        if [[ $(git remote -v) =~ $origin ]]
        then
            if [[ $origin == 'origin' ]]
            then
                ECHO $COLOR_YELLOW "$origin[exist]"
            else
                ECHO $COLOR_RED "项目【$origin】开始更新"
                ECHO $COLOR_GREEN "分支[$index]:$origin"
                git pull $origin master
                git add .
                git status
                git commit -m "$m"
                git push $origin master
                ECHO $COLOR_GREEN "更新结束"
            fi
        fi

        ((index++))
#        echo ""
    done
}

#执行过程
push

end=$(date +%s%N)
end_ms=${end:0:16}
ECHO $COLOR_REMOVE "cost time is:"
ECHO $COLOR_REMOVE "scale=6;($end_ms - $start_ms)/1000000 | bc"

