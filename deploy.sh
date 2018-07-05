#!/bin/bash -e
# hexo 生成部署到github.io
# 拉取远程分支的dev代码到 当前分支
function errorEcho {
    echo '\033[31m ERROR! \033[0m '$1
}

function successEcho {
    echo '\033[32m SUCCESS! \033[m '$1
}

git pull origin dev:master

git add .
git commit -m "auto deploy and push dev branch"
# 将源代码上传到dev分支保存  注意本地的master 或者dev分支和远程的master (远程master 是hexo生成的内容)有差别，
git push origin master:dev

# 部署
hexo clean 
hexo d -g
successEcho "Now you are good to go"