---
title: webpack---实践（添坑）
date: 2016-08-18 22:21:39
tags: movie
categories: movies
toc: true

---
![](http://upload-images.jianshu.io/upload_images/1889471-16effd27c619061c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

>为什么要用webpack?（如上图）
官网上写的特别好，好多大牛推荐，但对我这种没接触过的小白来说入手还是有点难。
// 别扯那么多虚的  其实是大家都在用 不了解看源码都迷糊，，，，，

在你对类似webpack这类的工具没有什么概念时，或者在纠结用什么学什么时最好看看这个[文章](http://mp.weixin.qq.com/s?__biz=MzA5MzE4NDA4OQ%3D%3D&mid=2652008933&idx=2&sn=47c5f9881ce6e2369b87bef84a7490de&chksm=8b8718d3bcf091c556a9d47fb0eca0d679115a80386614cc7e8e80d50310fad095601a2e5052)写的详细，你会对各种前段build工具有一个具体的概念。

### npm install webpack
```
//第一步 全局安装
npm install -g webpack
//第二步：在项目根目录下本地安装
npm install webpack --save-dev
```
** webpack的写法全部都在   *" webpack.config.js "* 文件中（项目根目录） **
### 入口文件配置
```
module.exports = {

//配置值是好几个数组------entry/externals/devtool/devServer 
//配置值是好几个对象------entry/output/module/resolve
// so A,B,C,D-----逗号呀。。。不要忘最后一个不写逗号

//入口文件会在运行时首先加载；
    entry: "./entry.js",
    output: {
        //指定输出文件写入磁盘的路径
        path: "./dist/",
        //指定输出文件写入磁盘文件的名字，filename仅仅是给文件命名；
        filename: "bundle.js",
        //将自建脚本文件输出为库文件----独立输出；
        library:''
    }
};
```
# loader
- css-loader 处理css中路径引用等问题
- style-loader 动态把样式写入css
- sass-loader scss编译器
- less-loader less编译器
- postcss-loader scss再处理

```
//npm 安装loader 
//  -save => 在package.json里保存 （-S）
//  -dev 保存到devDependencies里 （-D）
npm install --save -dev css-loader style-loader sass-loader less-loader postcss-loader

```
```
module: {
  loaders: [
    {test: /\.css$/, loader: "style!css?sourceMap!postcss"},
    {test: /\.less$/, loader: "style!css!less|postcss"},
    {test: /\.scss$/, loader: "style!css!sass|postcss"}
  ]
}
```
[loader详细说明](https://segmentfault.com/a/1190000005742111)


### 执行webpack-----命令行模式
```
webpack --progress 
//带有打包进度
webpack --progress --watch 
//带有进度并监听文件改变，重新编译
//webpack给所有的文件安装一个watcher，如果有任何改变，运行编译-----未改变的不会操作-
```

--colors
 输出结果带彩色，比如：会用红色显示耗时较长的步骤
--profile
输出性能数据，可以看到每一步的耗时
--display-modules
默认情况下 node_modules
 下的模块会被隐藏，加上这个参数可以显示这些被隐藏的模块 


### webpack-dev-server :
webpack-dev-server ==> **资源服务器**
Webpack搭建本地服务器，监听文件改变，实时更新页面；但是不会输出结果文件到磁盘，适于生产环境下调试；
webpack-dev-server调用的脚本文件不是output的文件，而是保存在内存中的文件……目前引用的方法只知道用Html-webpack-plugin自动生成html页面来引用；

webpack-dev-server允许内网访问------设置host 0.0.0.0
```
使用命令行模式
webpack-dev-server --colors --host 0.0.0.0 --port 8080
```
常用配置：
```
devServer:{
    //在webpack.config.js中编辑
    historyApiFallback:true,
    hot:true,
    progress:true
}
```
使用命令行模式  npm run start/build/dev (对应scripts里的start/dev/build)运行webpack-dev-server；
```
//在 package.json中的script对象设置快捷命令方式
//运行npm run build/dev
"scripts": {
    "start":"webpack-dev-server --colors --host 0.0.0.0 --port 8080"
  }

  //或

"scripts": {
    "start": "webpack-dev-server --hot --inline",
    "build": "webpack --progress --profile --colors --config webpack.production.config.js"
}
```
[webpack dev server 英文文档](https://webpack.github.io/docs/webpack-dev-server.html)
[webpack dev server 中文翻译](https://segmentfault.com/a/1190000006964335)
[devtool](http://www.cnblogs.com/hhhyaaon/p/5657469.html)
[webpack-dev-server配置](http://www.cnblogs.com/jjucap/p/5605523.html)

### webpack.config.js

```
// 生产环境，运行npm run build则执行这里
if (process.env.NODE_ENV === 'production') {
    module.exports.devtool = '#source-map'
    // http://vue-loader.vuejs.org/en/workflow/production.html
    module.exports.plugins = (module.exports.plugins || []).concat([
        // 环境变量
        new webpack.DefinePlugin({
            'process.env': {
                NODE_ENV: '"production"'
            }
        }),
        // 压缩代码
        new webpack.optimize.UglifyJsPlugin({
            compress: {
                warnings: false
            }
        })
    ])
}
```

[webpack.config.js 配置详细--仅供查阅](https://webpack.vuefe.cn/configuration/index/#-)

### webpack 插件
WebPack.optimize.CommonsChunkPlugin

![](http://upload-images.jianshu.io/upload_images/1889471-9328fd01f6a92455.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

WebPack.optimize.UglifyJsPlugin

![](http://upload-images.jianshu.io/upload_images/1889471-6562bcb1888c5b20.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

[webpack 常用插件讲解，性能优化，异步加载](https://segmentfault.com/a/1190000004577578)

![](http://upload-images.jianshu.io/upload_images/1889471-ec2a90492be088fa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 异步加载

```
require.ensure(["module-a", "module-b"],
function(require) { 
      var a = require("module-a"); // ...
});
```
[异步加载英文文档](https://webpack.github.io/docs/code-splitting.html#require-ensure)

#### webpack重定向alias
[alias参考文章](http://www.myexception.cn/web/1960077.html)


### 参考文章
其实看了好多，如果没有注明的，我改
[超级推荐的文章](https://segmentfault.com/a/1190000002551952)
[系统的中文讲解  推荐新手看看 作者很用心](https://guowenfh.github.io/2016/03/24/vue-webpack-01-base/)
[参考文章how to webpack ](https://github.com/petehunt/webpack-howto)


### 总结
 其实这几年各种打包工具很多，webpack的插件配置起来还是不太方便，学习这个也是因为最近看的好多项目都是用webpack配置的，如果不懂webpack真的不知道从哪里入手。
 npm webpack 这些都是前端发展到现在工程化的产物，以前手撕生肉，现在还会谁会过那种茹毛饮血的生活， 不加点佐料撒点盐谁敢吃。webpack等一些工具都是像刀叉一样，发展到现在的一个必然而已。
