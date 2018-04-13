#!/bin/bash -e
# hexo 生成部署到github.io
# 拉取远程分支的dev代码到 当前分支

# 注意本地的master 或者dev分支和远程的master 有差别，以后重新部署是要用origin：dev的 远程分支的dev上面才是源代码远程 master 上是hexo 自动生成的代码
git pull origin dev

git add .
git commit -m "auto deploy and push dev branch"
# 将源代码上传到dev分支保存
git push origin dev
# 部署
hexo clean 
hexo d -g