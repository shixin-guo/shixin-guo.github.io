---
title: 萌萌的yarn-pk-老将npm
date: 2016-06-29 16:55:16
tags: js
toc: true
---


### 八卦一下npm与yarn
npm 在更早的时候已经参与了 yarn 项目，并且鼓励这一行为，因为对于 npm 这样大范围使用的系统来说直接做出这些可能带来兼容性问题的改进很难。（不要以为 npm 比你制杖）

### Yarn的优势 ：
1. 默认就有锁定文件、
2. 速度快 并行下载  
3. 更快速地安装依赖以及依赖的更新会自动同步到 package.json 文件中。
4. npm 迁移到 Yarn 成本几乎为零，



#### 锁定文件
为了防止拉取到不同的版本，Yarn 有一个锁定文件 (lock file) 记录了被确切安装上的模块的版本号。每次只要新增了一个模块，Yarn 就会创建（或更新）yarn.lock 这个文件。这么做就保证了，每一次拉取同一个项目依赖时，使用的都是一样的模块版本。

npm 其实也有办法实现处处使用相同版本的 packages，但需要开发者执行 npm shrinkwrap 命令。这个命令将会生成一个锁定文件，在执行 npm install 的时候，该锁定文件会先被读取，和 Yarn 读取 yarn.lock 文件一个道理。npm 和 Yarn 两者的不同之处在于，Yarn 默认会生成这样的锁定文件，而 npm 要通过 shrinkwrap 命令生成 npm-shrinkwrap.json 文件，只有当这个文件存在的时候，packages 版本信息才会被记录和更新。

#### 速度
npm 是按照队列执行每个 package，也就是说必须要等到当前 package 成功安装之后，才能继续后面的安装。而 Yarn 是同步执行所有任务，提高了性能。
