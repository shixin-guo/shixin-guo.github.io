hexo 搭建的 github page 个人博客

访问地址[gzponline.github.io](https://gzponline.github.io/)

具体搭建流程[具体搭建 GitHub page 流程](https://gzponline.github.io/2016/01/29/hexo+github%E6%90%AD%E5%BB%BA%E6%9C%80%E7%AE%80%E5%8D%95%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2/)

deploy.sh 主要是为了把源代码上传到 dev 分支。每次更新文章触发 deploy。sh 就好。直接生成部署文章 并上传到 dev 分支保存源文件

## tip 新建文章 要不用 hexo new “文章名字” 要不直接在/source/\_posts 下面新建 md 文件 但要注意 md 文件内要添加

title: 文章标题
date: 2017-07-31 16:55:16
tags: react redux flux
toc: true
mathjax: true

---

否则会导致 deploy 之后文章显示 no—title
