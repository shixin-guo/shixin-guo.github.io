---
title: node-更新(apt-get)
date: 2016-03-18 22:21:39
tags: node
categories: node

---

最近在linux上写node，可是我有点强迫症，比较喜欢新版的东西，apt安装很方便，可是官方的源里面的包都是比较老的，nodejs 在apt-get 上还是4.+的版本 而现在官方都更新到6+ 开发版都7了 想要更新还得想点办法。

```
sudo apt-get install curl

For Node.js v4
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

Alternatively, for Node.js v5:
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs

**UPDATE** Node.js v6:
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

**UPDATE** Node.js v7:
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs
```
[https://nodejs.org/en/download/package-manager/](https://nodejs.org/en/download/package-manager/)
