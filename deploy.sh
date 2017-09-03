#!/bin/bash -e
# hexo 生成部署到github.io
hexo d -g

# 将源代码上传到dev分支保存

git add .
git commit -m "修改 添加"
git push origin dev
