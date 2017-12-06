#!/bin/bash
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
echo ''
echo '打印项目分支如下:'
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
                echo ''
            else
                echo "分支[$index]:$origin"
                git pull $origin master
                git add .
                git status
                git commit -m "$m"
                git push $origin master
            fi
        fi

        ((index++))
#        echo ""
    done
}

#执行过程
echo "项目【$project】开始更新"
push
echo "更新结束"
