#!/bin/bash -e
# hexo 生成部署到github.io
拉取远程分支的dev代码到 当前分支
git pull origin dev
hexo d -g

# 将源代码上传到dev分支保存

git add .
git commit -m "auto deploy and push dev branch"
git push origin dev
