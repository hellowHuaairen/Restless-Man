## 一、桌面版音乐播放器
劳动节放假了，给大家分享一个轻松的开源项目，一个基于 Electron + Vue 开发的音乐软件。项目的一大特色就是多平台搜索歌曲，并支持下载功能（有些平台的vip歌曲也可以哦！）。
## 二、开发环境搭建
### 2.1 前提
- 本地安装Node12.x+环境，Node.js是一个运行在服务端的JavaScript框架，主要用于创建快速的、可扩展的网络应用。
- 本地已安装`VSCode`开发工具（其他工具也可以）。
- 掌握Vue基础语法，因为Vue是目前最流行的前端框架之一。

### 2.2  本地构建
**下载项目**<br/>
项目地址: https://github.com/lyswhut/lx-music-desktop<br/>
直接下载项目源码包，如下图：
![](https://imgkr.cn-bj.ufileos.com/fc50f60c-c4e2-482f-bced-3a6139ccaa45.png)

**本地运行**<br/>
解压下载的`zip`源码包，使用`VSCode`开发工具打开，如下图：
![](https://imgkr.cn-bj.ufileos.com/8e772e43-6792-493e-8180-1c8fb0faf940.png)
打开`终端`（控制台），执行下面命令就可以本地运行：
```bash
#设置electron淘宝镜像下载地址
npm config set electron_mirror=https://npm.taobao.org/mirrors/electron/
npm i #安装依赖
npm run dev #开发模式
```
本地运行效果如下图:
![](https://imgkr.cn-bj.ufileos.com/6a4673a2-f3e8-43d3-a3c2-d6cc65534fe4.png)
控制台会输出如下内容:
![](https://imgkr.cn-bj.ufileos.com/691160dc-011e-488e-90c0-12d562f95e6f.png)

**本地打包**<br/>
使用下面命令可进行打包:
```bash
npm run pack:dir #构建免安装版
npm run pack #构建安装包（Windows版）
npm run pack:mac #构建安装包（Mac版）
npm run pack:linux #构建安装包（Linux版）
```
## 三、源码学习技巧
提前声明，我是前端菜鸟，只是对前端比较感兴趣。这里以一个小功能慢慢学习此项目。<br/>
本地开发环境运行项目，会自动运行`Google devtool`,熟悉谷歌调试工具的小伙伴应该知道它的强大。这里我介绍两个功能，元素定位，日志查看。<br/>
**元素定位**<br/>
操作如下图，这样就可查看对应`Element`的信息
![](https://imgkr.cn-bj.ufileos.com/5d5af020-5ff6-4d29-8f38-dfdf2baee14d.png)
结合定位到的元素的信息，在源码中查找相关代码。

**日志查看**<br/>
操作如下图，开发环境下如果有日志输出，我们可以通过日志反向学习代码。
![](https://imgkr.cn-bj.ufileos.com/693ed799-c0a2-4b48-96a0-0f37e6484393.png)
可以看到每一次搜索框输入一个字母都会组装一个请求，回车的时候才会发送搜索歌曲的请求连接，
`http://search.kuwo.cn/r.s?client=kt&all=taylor%20swift&pn=0&rn=30&uid=794762570&ver=kwplayer_ar_9.2.2.1&vipver=1&show_copyright_off=1&newver=1&ft=music&cluster=0&strategy=2012&encoding=utf8&rformat=json&vermerge=1&mobi=1&issubtitle=1`<br/>
当然通过全局搜索`---start---`我们就可以知道组装请求链接的那部分代码在哪里了。

## 四、安装包下载
当然，你也可以直接下载安装包，本地安装使用，
安装包下载地址:https://github.com/lyswhut/lx-music-desktop/releases
根据自己的需要下载相应的版本。
![](https://imgkr.cn-bj.ufileos.com/46baf4c8-ed2f-46cc-88d1-4c2f82434ca7.png)

## 五、最后
五一假期正好是个充电的时间。这款`PC`版音乐播放器是个不错的学习项目，你值得拥有！