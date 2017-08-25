---
title: hexo+github搭建最简单个人博客
date: 2016-01-29 16:55:16
tags: hexo github blog
toc: true
---
![](http://upload-images.jianshu.io/upload_images/1889471-05bf557dc17132d3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![hexo作者 台湾人](http://upload-images.jianshu.io/upload_images/1889471-b2329812e5c04237.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###hexo优势
>不可思议的快速 ─ 只要一眨眼静态文件即生成完成
支持 Markdown仅需一道指令即可部署到 GitHub Pages 
兼容于 Windows, Mac & Linux
不需要域名与服务器
轻量易用

首先需要安装以下程序：
[Node.js](http://nodejs.org/)安装非常简单，一路Next即可。

[Git](http://git-scm.com/)安装建议勾选Git Bash Here
，方便以后的操作。其他一路Next即可。

**Installation安装**

在选中的文件夹上鼠标右键git bush
```
$ npm install hexo-cli -g
```

**Setup your blog**
```
$ hexo init blog//创建blog文件夹
$ cd blog//打开blog文件夹
```
**Start the server**
```
$ hexo server//启动服务器
```
或者
```
$ hexo server -p 4000
#-p 4000 可以不写 默认是4000 但有时候4000端口占用就要用8888这样自定义的端口了)
```
访问localhost:4000预览,退出server用Ctrl+c


**Create a new post创建新文章题目为hello hexo**

```
$ hexo new "Hello Hexo"
```
** 编辑文章**
hexo new "My New Post"会在  ..\source\_posts目录下生成一个markdown文件：My-New-Post.md
可以使用一个支持markdown语法的编辑器（比如 [Sublime](http://www.sublimetext.com/)  [atom](https://atom.io/)）来编辑该文章
```
title: my new post #可以改成中文的，如“新文章”
date: 2013-05-29 07:56:29 #发表日期，一般不改动
categories: blog #文章文类
tags: [博客，文章] #文章标签，多于一项时用这种格式
--
#这里是正文，用markdown写，
```
[markdown 入门指南](http://www.jianshu.com/p/1e402922ee32/)
```
$ hexo generate
$ hexo deploy
```
同步到github。访问网站看看效果。
**Generate static files生成文章**
```
$ hexo clean #经常要用的命令
$ hexo generate
$ hexo deploy  #Deploy after generation finishes ---ok 
```

填写项目信息：

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1889471-ab3fa34ea8ec7923.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**修改这里的_config.yml**
![在这里修改_config.yml](http://upload-images.jianshu.io/upload_images/1889471-c9ed765f3968a841.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
添加你的github地址
![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1889471-c614670a2f444e14.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###主题配置（我用的是[Maupassant](https://www.haomwei.com/technology/maupassant-hexo.html)）
[hexo主题推荐](https://www.zhihu.com/question/24422335/answer/46357100)
![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1889471-ca67cd9f0beccd6a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###站点配置
**首先提醒一下**

![冒号后面有空格](http://upload-images.jianshu.io/upload_images/1889471-34d61882bc139b66.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


#ok 完成，去写blog吧

###命令总结
```
hexo new "postName" #新建文章
hexo new page "pageName" #新建页面
hexo generate #生成静态页面至public目录
hexo server #开启预览访问端口（默认端口4000，'ctrl + c'关闭server）
hexo deploy #将.deploy目录部署到GitHub
hexo help # 查看帮助
hexo version #查看Hexo的版本

```
#### 复合命令
hexo deploy -g #生成加部署
hexo server -g#生成加预览

####命令的简写为
hexo n == hexo new
hexo g == hexo generate
hexo s == hexo server
hexo d == hexo deploy


![防止本地文件丢失](http://upload-images.jianshu.io/upload_images/1889471-d0c48c9d9671c880.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

front- header
```
title: Test Math
date: 2016-04-05 14:16:00
categories: math
mathjax: true
toc: true
---
```
最后附上我的blog地址[外城](https://gzpgzpgzp.github.io/)
