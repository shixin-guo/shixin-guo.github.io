---
title: vscode 使用 prettier 与 eslint 自动规范代码
date: 2018-07-05 12:55:53
tags:
---

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
