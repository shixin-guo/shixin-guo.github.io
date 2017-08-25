---
title: nodemon---nodejs调试利器
date: 2016-08-18 22:21:39
tags: node
categories: node

---

[nodemon](http://nodemon.io/) 是一款非常实用的工具，用来监控 NodeJS 源代码的任何变化和自动重启你的服务器，这样我们只需要刷新页面就能看到你的改动。这里还有个一个工具 [supervisor](http://supervisord.org/) 也能实现同样的功能，但相比起来 nodemon 更加灵活轻量，内存占用更少。
### 安装
使用 npm 将 nodemon 安装到全局：
```
npm install -g nodemon
```

### 使用
nodemon 会将你输入的启动命令包裹起来，所以你可以使用任何可以使用的启动参数
```
nodemon [your node app]
```

### 帮助
使用-h或者--help来查看完整的帮助：
```
nodemon -h
```


使用 nodemon 非常简单，如果我们的应用接受 ** host 和 port **两个参数，那么我们可以这样来启动我们的应用：
```
nodemon ./server.js localhost 8080
```


你也可以传递** debug **标志给 nodemon：
```
nodemon --debug ./server.js 80
```
#### 手动重启
当 nodemon 运行时，如果你想手动重启你的应用，除了可以停止并重启 nodemon 之外，你还可以简单滴敲入rs并回车，然后 nodemon 将重启你的服务。
