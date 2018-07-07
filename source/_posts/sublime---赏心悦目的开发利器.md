---
title: sublime-=--赏心悦目的开发利器
date: 2016-08-18 22:21:39
tags: sublime
categories: tools
toc: true
---

// 转 vscode 了 哈哈 sublime 很优秀轻便 但是 vscode 功能更贴心 插件很完善 社区支持更好
![官网截图](http://upload-images.jianshu.io/upload_images/1889471-6e40dd4d545c96e4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 下载安装

- Windows 不用说了吧 下载 exe 安装就好，安装包很小，安装很快
- Ubuntu 的话下载 deb 文件包 dpkg -i [deb 文件名]，就好了，如果需要安装依赖 sudo apt-get install -f 一下，然后重复 dpkg -i 就可以了

### 安装插件：

sublime 有丰富的插件生态，就算什么也不安装也能满足你大部分需求。

**自动安装：**
从菜单 **View - Show Console** 或者 **ctrl + ~** 快捷键，调出 console。
将以下 Python 代码粘贴进去并 enter 执行，不出意外即完成安装。以下提供 ST3 和 ST2 的安装代码：
Sublime Text 3：

```
import urllib.request,os; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); open(os.path.join(ipp, pf), 'wb').write(urllib.request.urlopen( 'http://sublime.wbond.net/' + pf.replace(' ','%20')).read())
```

Sublime Text 2：

```
import urllib2,os; pf='Package Control.sublime-package'; ipp = sublime.installed_packages_path(); os.makedirs( ipp ) if not os.path.exists(ipp) else None; urllib2.install_opener( urllib2.build_opener( urllib2.ProxyHandler( ))); open( os.path.join( ipp, pf), 'wb' ).write( urllib2.urlopen( 'http://sublime.wbond.net/' +pf.replace( ' ','%20' )).read()); print( 'Please restart Sublime Text to finish installation')
```

**手动安装：**
可能由于各种原因，无法使用代码安装，那可以通过以下步骤手动安装 Package Control： 1.点击 Preferences > Browse Packages 菜单 2.进入打开的目录的上层目录，然后再进入 Installed Packages/目录 3.下载  [Package Control.sublime-package](https://sublime.wbond.net/Package%20Control.sublime-package)  并复制到 Installed Packages/目录 4.重启 Sublime Text。

Package Control 主文件下载地址：[https://github.com/wbond/sublime_package_control](https://github.com/wbond/sublime_package_control)
使用快捷键 ctrl+shift+ p 然后输入 install

### 卸载插件

**ctrl+shift+p**输入**remove package**选择要删掉的插件即可
sublime 会显示列表告诉你安装了哪些插件

附上我的 sublime 截图

## ![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1889471-dcf1aeb3a872aad8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 插件推荐

- jsformant
  js 开发者会喜欢的
  同样使用 Package Control 安装 JsFormat 插件后
  即可在 JS 文件中通过鼠标右键->JsFormat 或键盘快捷键 Ctrl+Alt+F 对 JS 进行格式化

- emmet
  写 html 结构时候很爽
  这个用熟练了，会很帅真的
  [emmet 使用方法](http://www.w3cplus.com/tools/emmet-cheat-sheet.html)
  [emmet 使用方法](http://blog.wpjam.com/m/spped-up-writing-css-via-emmet/)

```
#page>div.logo+ul#navigation>li*5>a{Item $}
```

- markdown preview
  给经常看 readme.md 文件的小伙伴
  查看 markdown 文件，ctrl + shift + p 输入 markdown 会提示 show in brower 然后选择 markdown 就会在浏览器里面显示 md 文件了

[插件推荐](https://www.zhihu.com/question/24736400) 但我个人觉得还是需求决定 你需要什么就去搜 体验发现插件的乐趣，不要一股脑全安装上去，还不会用

### 主题安装

我选择[set](https://packagecontrol.io/packages/Seti_UI)i 这个主题，主要是配色我喜欢，而且侧边栏显示文件列表时候，会根据文件类型显示小图标。

![](http://upload-images.jianshu.io/upload_images/1889471-d9bd16da058bb2e4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

我的配置截图 （在 Performance --> Settings 里面修改 ）

![修改主题时候的文件地址](http://upload-images.jianshu.io/upload_images/1889471-25a194727995608c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![](http://upload-images.jianshu.io/upload_images/1889471-db4e986f2f2c6592.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![](http://upload-images.jianshu.io/upload_images/1889471-58ecd0d3bd9f8bbf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
[seti-ui 配置教程](http://chinagdg.org/2016/02/ttt2-seti-ui/) ###快捷键（Sublime Text 3） （有点多，备忘而已，随用随查）  
Ctrl+Shift+P：打开命令面板
** Ctrl+D：选择单词，重复可增加选择下一个相同的单词 **
Ctrl+P：搜索项目中的文件
Ctrl+G：跳转到第几行
Ctrl+W：关闭当前打开文件
Ctrl+Shift+W：关闭所有打开文件
** Ctrl+Shift+V：粘贴并格式化 **
Ctrl+L：选择行，重复可依次增加选择下一行
Ctrl+Shift+L：选择多行
Ctrl+Shift+Enter：在当前行前插入新行
Ctrl+X：删除当前行
Ctrl+M：跳转到对应括号
Ctrl+U：软撤销，撤销光标位置
Ctrl+J：选择标签内容
Ctrl+F：查找内容
Ctrl+Shift+F：查找并替换
Ctrl+H：替换
Ctrl+R：前往 method
Ctrl+N：新建窗口
Ctrl+K+B：开关侧栏
Ctrl+Shift+M：选中当前括号内容，重复可选着括号本身
Ctrl+F2：设置/删除标记
Ctrl+/：注释当前行
Ctrl+Shift+/：当前位置插入注释
Ctrl+Alt+/：块注释，并 Focus 到首行，写注释说明用的
Ctrl+Shift+A：选择当前标签前后，修改标签用的 F11：全屏 Shift+F11：全屏免打扰模式，只编辑当前文件 Alt+F3：选择所有相同的词 Alt+.：闭合标签 Alt+Shift+数字：分屏显示 Alt+数字：切换打开第 N 个文件 Shift+右键拖动：光标多不，用来更改或插入列内容鼠标的前进后退键可切换 Tab 文件按
Ctrl，依次点击或选取，可需要编辑的多个位置按
Ctrl+Shift+上下键，可替换行
**选择类**
**Ctrl+D**选中光标所占的文本，继续操作则会选中下一个相同的文本。
**Alt+F3**选中文本按下快捷键，即可一次性选择全部的相同文本进行同时编辑。举个栗子：快速选中并更改所有相同的变量名、函数名等。
**Ctrl+L**选中整行，继续操作则继续选择下一行，效果和**Shift+↓**效果一样。
**Ctrl+Shift+L**先选中多行，再按下快捷键，会在每行行尾插入光标，即可同时编辑这些行。
**Ctrl+Shift+M**选择括号内的内容（继续选择父括号）。举个栗子：快速选中删除函数中的代码，重写函数体代码或重写括号内里的内容。
**Ctrl+M**光标移动至括号内结束或开始的位置。
**Ctrl+Enter**在下一行插入新行。举个栗子：即使光标不在行尾，也能快速向下插入一行。
**Ctrl+Shift+Enter**在上一行插入新行。举个栗子：即使光标不在行首，也能快速向上插入一行。
**Ctrl+Shift+[**选中代码，按下快捷键，折叠代码。
**Ctrl+Shift+]**选中代码，按下快捷键，展开代码。
**Ctrl+K+0**展开所有折叠代码。
**Ctrl+←**向左单位性地移动光标，快速移动光标。
**Ctrl+→**向右单位性地移动光标，快速移动光标。
**shift+↑**向上选中多行。
**shift+↓**向下选中多行。
**Shift+←**向左选中文本。
**Shift+→**向右选中文本。
**Ctrl+Shift+←**向左单位性地选中文本。
**Ctrl+Shift+→**向右单位性地选中文本。
**Ctrl+Shift+↑**将光标所在行和上一行代码互换（将光标所在行插入到上一行之前）。
**Ctrl+Shift+↓**将光标所在行和下一行代码互换（将光标所在行插入到下一行之后）。
**Ctrl+Alt+↑**向上添加多行光标，可同时编辑多行。
**Ctrl+Alt+↓**向下添加多行光标，可同时编辑多行。
**编辑类**
**Ctrl+J**合并选中的多行代码为一行。举个栗子：将多行格式的 CSS 属性合并为一行。
**Ctrl+Shift+D**复制光标所在整行，插入到下一行。
**Tab**向右缩进。
**Shift+Tab**向左缩进。
**Ctrl+K+K**从光标处开始删除代码至行尾。
**Ctrl+Shift+K**删除整行。
**Ctrl+/**注释单行。
**Ctrl+Shift+/**注释多行。
**Ctrl+K+U**转换大写。
**Ctrl+K+L**转换小写。
**Ctrl+Z**撤销。
**Ctrl+Y**恢复撤销。
**Ctrl+U**软撤销，感觉和**Gtrl+Z**一样。
**Ctrl+F2**设置书签
**Ctrl+T**左右字母互换。
**F6**单词检测拼写
**搜索类**
**Ctrl+F**打开底部搜索框，查找关键字。
**Ctrl+shift+F**在文件夹内查找，与普通编辑器不同的地方是 sublime 允许添加多个文件夹进行查找，略高端，未研究。
**Ctrl+P**打开搜索框。举个栗子：1、输入当前项目中的文件名，快速搜索文件，2、输入@和关键字，查找文件中函数名，3、输入：和数字，跳转到文件中该行代码，4、输入#和关键字，查找变量名。
**Ctrl+G**打开搜索框，自动带：，输入数字跳转到该行代码。举个栗子：在页面代码比较长的文件中快速定位。
**Ctrl+R**打开搜索框，自动带@，输入关键字，查找文件中的函数名。举个栗子：在函数较多的页面快速查找某个函数。
**Ctrl+：**打开搜索框，自动带#，输入关键字，查找文件中的变量名、属性名等。
**Ctrl+Shift+P**打开命令框。场景栗子：打开命名框，输入关键字，调用 sublime text 或插件的功能，例如使用 package 安装插件。
**Esc**退出光标多行选择，退出搜索框，命令框等。
**显示类**
**Ctrl+Tab**按文件浏览过的顺序，切换当前窗口的标签页。
**Ctrl+PageDown**向左切换当前窗口的标签页。
**Ctrl+PageUp**向右切换当前窗口的标签页。
**Alt+Shift+1**窗口分屏，恢复默认 1 屏（非小键盘的数字）
**Alt+Shift+2**左右分屏-2 列
**Alt+Shift+3**左右分屏-3 列
**Alt+Shift+8**垂直分屏-2 屏
**Alt+Shift+9**垂直分屏-3 屏
**Ctrl+K+B**开启/关闭侧边栏。
**F11**全屏模式
**Shift+F11**免打扰模式
