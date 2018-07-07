---
title: vscode 使用 prettier 与 eslint 自动规范代码
date: 2018-07-05 12:55:53
tags:
---

#### 主要解决问题

使用 vscode 在保存文件时候自动触发代码格式检查，
优势是 快捷方便，如果单纯使用 eslint 编辑器只是告诉你哪里出现了问题，但是不会帮助你解决， 尤其是我们真对很多已有项目进行代码规范时候，工作量非常大，prettier 配合 vscode 会自动把当前文件规范化，包括 css markdown 等很多常用的文档格式。

vscode 添加 eslint prettier 插件

shell

```
npm i prettier eslint-config-prettier eslint-plugin-prettier -D
```

.eslintrc

```
{
  "extends": ["react-app", "plugin:prettier/recommended"]
}
```

command + ,

![](https://upload-images.jianshu.io/upload_images/1889471-ff34bbe4c44689f2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
添加

```
    "editor.formatOnSave": true,
    "[javascript]": {
        "editor.formatOnSave": false
    },
    "eslint.autoFixOnSave": true,
    "eslint.alwaysShowStatus": true,
    "prettier.disableLauguages": [
        "js"
    ],
```

ok 代码在你保存时候就会自动格式化成符合规范的代码了
