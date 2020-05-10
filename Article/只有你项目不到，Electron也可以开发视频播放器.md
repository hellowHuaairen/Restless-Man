## 一、桌面版视频播放器
今天又发现一款强大的开源软件，electron 开发的一个可以播放国内主流视频(腾讯、爱奇艺、优酷、芒果、乐视)的播放器。而且播放视频可直接跳过广告。好的开源项目第一时间分享给大家！
## 二、开发环境搭建
### 2.1 前提
- 本地安装`Node12.x+`环境，Node.js是一个运行在服务端的`JavaScript`框架，主要用于创建快速的、可扩展的网络应用。
- 本地已安装`VSCode`开发工具（其他工具也可以）。
- 掌握`Vue`、`Vuex`基础语法。
- `Electron`是由`Github`开发，用HTML，CSS和JavaScript来构建跨平台桌面应用程序的一个开源库。

### 2.2  本地构建
**下载项目**<br/>
项目地址: https://gitee.com/meetqy/hapv<br/>
使用`gitBash`直接下载项目即可：
```bash
 git clone git@github.com:meetqy/hapv.git
```
也可以这样直接下载项目源码包，如下图：
![](https://imgkr.cn-bj.ufileos.com/88e5712c-d0c2-431d-a41d-896c41c8bdd0.png)

**本地运行**<br/>
打开命令行窗口，执行如下命令，就可以本地运行：
```bash
 cd hapv
 npm install 
```
如果下载速度特别慢，设置淘宝镜像,操作如下：
```bash
 npm install -g cnpm --registry=https://registry.npm.taobao.org
 cnpm install
```
然后执行如下命令可以本地运行
```bash
npm run start
```
本地运行的效果图下所示：
![](https://imgkr.cn-bj.ufileos.com/1fba167e-bbb4-47a9-90e8-71ec1c08bcf5.png)


**项目打包**<br/>
支持两种方式，`Mac`和`Windows`，根据自己的电脑的系统选择不同的版本安装即可。命令如下：

使用下面命令可进行打包:
```bash
npm run build:mac #构建安装包（Mac版）
npm run build:win #构建安装包（Windows版）
```
## 三、安装包下载
**Mac版本下载**<br/>
地址: https://gitee.com/meetqy/hapv/releases<br/>
**Windows版本下载**<br/>
作者没有构建`windows`版本，小编我就构建了一个`windows`版本，在我的公众号后台回复`hapv`就可以下载。
## 四、使用说明
### 4.1选择平台
视频播放器支持切换多种平台，根据仔细的喜好可自由切换，如下图：
![](https://imgkr.cn-bj.ufileos.com/4afa7a48-4242-40bb-a08b-5820dfa7d1b9.png)
### 4.2播放视频
选择喜欢的节目，点击`立即播放`即可，可直接跳过广告喔。
![](https://imgkr.cn-bj.ufileos.com/79e48000-173b-473c-9329-e59daafc7736.png)

### 4.3其他功能
视频播放器包括`播放积累`、`正在播放`、`线路切换`等功能。
![](https://imgkr.cn-bj.ufileos.com/17e00fd7-034f-4f73-b228-d9ca9657459d.png)


## 五、最后
今天推荐的项目特别使用，如果你也喜欢看视频，这款手工开发的视频播放器很适合你哦。学习娱乐两不误！

公众号后台回复:`hapv`，就可下载 Electron 视频播放器哦！
