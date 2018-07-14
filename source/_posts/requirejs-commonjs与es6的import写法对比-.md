---
title: requirejs-commonjs与es6的import写法对比-
date: 2016-05-10 22:21:39
tags: javascript
categories: js

---

### require.js
首先定义：
```
//content.js

define('content.js', function(){

    return 'A cat';

})
```

然后require：

```
//index.js
require(['./content.js'], function(animal){

    console.log(animal);   //A cat

})
```
### CommonJS
```
//index.js
var animal = require('./content.js')
```
```
//content.js
module.exports = 'A cat'
```
###  ES6的写法
```
//index.js
import animal from './content'
```

```
//content.js
export default 'A cat'
```
