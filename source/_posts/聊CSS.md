---
title: css相关
date: 2015-02-09 16:55:16
tags: css
toc: true
---


放开自己，拥抱未来，拥抱变化。舍弃过往，接受新颖的架构，思想，理念。你就会发现，很短的时候，自己有了质地提升。

[global css](http://a.tbcdn.cn/p/global/1.0/global-min.css)
用来规范css属性在不同浏览器中定义的初始值不同问题

有问题找[w3school](www.w3cshool.com)

碎碎的内容来自[这里](http://www.cnblogs.com/qieguo/p/5421252.html)

## display：inline 
>设置为行内元素。。。。就是变成就和p标签一样，与其他元素在同一行上，没有长宽高，也不能设置 ps：span a label input、img ，strong ， em都是inline标签


>普通流布局：display : inline-block
这是一个传说中取代float布局的存在
//并没有搞懂 什么鬼

### 定位

fixed定位的渲染效率很低，因为它会频繁触发浏览器的重排

##css选择器

id class就不说了 “#”还有“.”就可以了 全局选择 “*”（计算机语言里的乘号后代选择器 div +空格+div里的任意元素

- .aIdName a{.....}
例如 .father + “空格+ .child（可以是div的儿子也可以是孙子）

- 子代选择器 div>a(就是指div下面的儿子辈a标签)

>.classname > a{.....}群组选择器 就是a,b,c,d

- a ,b ,c{....}
相邻选择器就是+ h1 +p{css}就是选择了前面是h1的p标签

- h1+p{....}
还有好多我就不全写了

##css继承

就是儿子随爸爸姓 
继承父类的css但子类的优先级高

##字体大小

px像素大小 
还有一个**em**相对父元素的百分比0.5em就是父类的一半大小 
如果考虑屏幕大小的差异建议用这个 然而不是那么好用

##css伪类顺序

link visited hover active《先设置link 然后依次设置 否则会覆盖导致无效》

##margin
我们看到这个图中，有个列表，每个列表项下面都有一条线，但最后一项没有。我们预期的代码是：
```
<div id="demo">
<h3>标题列表</h3>
<ul>
<li>» 有点累想歇一下好长一个标题</li>
<li>» 有点累想歇一下好长一个标题</li>
<li>» 有点累想歇一下好长一个标题</li>
<li>» 有点累想歇一下好长一个标题</li>
<li>» 有点累想歇一下好长一个标题</li>
</ul>
</div>
```
如果每项都有条底线，我们可以很简单的做到，如下：
```
#demo li{
border-bottom: 1px solid #ccc;
}
```
然而为了处理最后一项，事情就变得有点纠结了。我知道肯定有人要说，我们有 first-child 之类的CSS3选择符，要处理这个，太easy了。
传说中的first/last解决方案
所以我们需要找别的方法，于是这样的代码，相信你见过无数遍了：
```
<div id="demo">
<h3>标题列表</h3>
<ul>
<li>» 有点累想歇一下好长一个标题</li>
<li>» 有点累想歇一下好长一个标题</li>
<li>» 有点累想歇一下好长一个标题</li>
<li>» 有点累想歇一下好长一个标题</li>
<li class="last">» 有点累想歇一下好长一个标题</li>
</ul>
</div>
```
解决方案，代码如下：
```
#demo .last{
border-bottom: 0 none;
}
```


![css浮动--关注inherit](http://upload-images.jianshu.io/upload_images/1889471-92b6e8efb7a48840.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


### box
如大家所熟知的，是css布局中最小的单位，所有的布局都是由一个一个矩形的box搭建出来的，就很像是搭积木那样。而每一个box都会由四部分组成，包括：content，padding，border，margin。那么box的高宽是如何计算的呢？css中有一个属性叫box-sizing，该属性取不同的值会决定box高宽不同的计算方式。
- content-box(默认值):
这也就是最常规的计算方式，某个box的高等于它的height＋padding＋border＋margin，宽也是同理，以下不再赘述。

- border-box:
当取值为border-box时，这个box的高就等于它的height＋margin了，也就是说该box的height是由content部分的height和padding以及border共同组成的了，换言之，padding和border不再向外延伸，而是往里边挤。

[box-sizing详细说明](http://www.cnblogs.com/fxxkhigh/p/5431110.html)
[MDN box-sizing](https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing)
![](http://upload-images.jianshu.io/upload_images/1889471-e1303c4bb51fb652.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
.confirm-btn{ 
    box-sizing: border-box; 
    float: left; width: 50%;
    ...
```

### css auto 
块级元素水平方向的auto,块级元素的margin、border、padding以及content宽度之和等于父元素width。使用auto属性在父元素宽度变化的时候，该元素的宽度也会随之变化。
但是当该元素被设为浮动时，该元素的width就变成了内容的宽度了，由内容撑开，也就是所谓的有了包裹性。overflow | position:absolute | float:left/right都可以产生包裹性，替换元素也同样具有包裹性。

### css clear
[clear w3c](http://www.w3school.com.cn/cssref/selector_after.asp)
[clear MDN](https://developer.mozilla.org/zh-CN/docs/Web/CSS/clear)

![](http://upload-images.jianshu.io/upload_images/1889471-83a910f9495a6848.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![\](http://upload-images.jianshu.io/upload_images/1889471-d995456034d46193.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1889471-dd72acc752329727.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### css ::after ::before
[after/before的妙用](http://blog.dimpurr.com/css-before-after/)
[竟然还可以这么玩666](http://blog.jobbole.com/49173/)
[这个blog写的也很不错，比我写的好多了](https://github.com/dwqs/blog/issues/28)
### css calc()
![](http://upload-images.jianshu.io/upload_images/1889471-a0d6e1b9118c293d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
[calc详细介绍](http://www.w3cplus.com/css3/imitating-calc-fallback-fixed-width-sidebar-in-responsive-layout.html)

### cssom
[wo lan zmd](http://www.zhangxinxu.com/wordpress/2011/09/cssom%E8%A7%86%E5%9B%BE%E6%A8%A1%E5%BC%8Fcssom-view-module%E7%9B%B8%E5%85%B3%E6%95%B4%E7%90%86%E4%B8%8E%E4%BB%8B%E7%BB%8D/)
## Flex

[Flex](http://www.ruanyifeng.com/blog/2015/07/flex-grammar.html?utm_source=tuicool)是Flexible Box的缩写，意为"弹性布局"，用来为盒状模型提供最大的灵活性。
>弹性盒子在移动端的应用会越来越普遍，这套模型值得去好好研究。语法规则都是非常贴近人性，非常灵活，浏览器兼容性也非常好，当然国内百花齐放的移动浏览器会有哪些大坑呢？我们拭目以待~-----by 某人
 

![](http://upload-images.jianshu.io/upload_images/1889471-7ad8aece4b157169.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

[阮一峰提供flex的语法介绍](http://www.ruanyifeng.com/blog/2015/07/flex-grammar.html?utm_source=tuicool)
[flex的实践应用](http://www.ruanyifeng.com/blog/2015/07/flex-examples.html)

问题（myself）
1 dl, dt, dd三个标签浏览器默认margin值多少？是否有标签默认文字粗体？
2 line-height:150%和line-height:1.5的区别是？
3 float为何会让外部容器高度塌陷？这是bug？
4 vertical-align的表现为何在IE7, IE8, IE9下表现不尽相同？其中的渲染机制是？

5 vertical-align负值与margin-bottom负值的差异

7 display : inline-block

![](http://upload-images.jianshu.io/upload_images/1889471-7a105df48260424c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
