# 轻松搭建--融云Android聊天工具



上一篇是搭建Web版本的融云，贴链接



融云支持客户端的二次开发，`Android`和`ios`两个版本，安卓是通过`Java`开发的，所以我就尝试自己构建一把。ios端的项目构建我也在尝试中。前两天安卓客户端打包成功，基本功能也都可以使用。本篇记录一下Android版聊天客户端的搭建步骤。

![](轻松搭建--融云Android聊天工具\01.png)

## 一、安装步骤

### 1.前提

- 分布式的版本控制工具 `Git`
- 安卓项目开发工具 `Android Studio`

### 2.下载项目源码

```
git clone https://github.com/sealtalk/sealtalk-android.git
```

### 3.修改部分内容

使用`Android Studio`打开项目源码，如下图：

![1578196571571](轻松搭建--融云Android聊天工具\1578196571571.png)

修改内容：

1.替换 SealTalkUrl.java 中的 DOMAIN 常量值为您所部署的 SealTalk 服务地址。

```java
public class SealTalkUrl {
    public static final String DOMAIN = 这里请替换为您所部署的 SealTalk Server 地址;
```

2.替换 IMManager.java 中，init 方法中调用融云初始化的代码 RongIM.init 替换为您所申请的融云 AppKey。

```java
    private void initRongIM(Context context) {
        // 可在初始 SDK 时直接带入融云 IM 申请的APP KEY
        RongIM.init(context, 这里请替换为您的融云 AppKey, true);
```

### 4.项目打包，输出apk文件

安卓项目是`Gradle`进行项目管理的，和我们知道`Maven`功能是类似。.



![1578198106585](轻松搭建--融云Android聊天工具\1578198106585.png)



项目构建完成后，在源码目录搜索`*.apk`，就可以找到刚刚打包的文件。（不太懂安卓）

![1578198255923](轻松搭建--融云Android聊天工具\1578198255923.png)

我已把打包后的安卓客户端上传到服务器了。

下载地址：http://www.restlessman.cn:9001/apps/android/sealtalk.apk



## 二、使用融云的说明

1.免费版本融云注册用户最多100人。平台支持对用户的管理。

![1578199086861](轻松搭建--融云Android聊天工具\1578199086861.png)

2.免费版基础功能

![1578199161506](轻松搭建--融云Android聊天工具\1578199161506.png)

3.其他功能

- 音视频服务
- 小视频服务
- 短信服务
- 红包服务

开发环境有些功能可以免费体验，有兴趣的朋友可以试一试。

## 三、最后

至此，我已搭建了融云聊天的web，Android版本，可以进行简单的即时通讯了。一套聊天工具搭建下来也学到不少东西。

- node.js服务端搭建需要使用pm2来管理服务
- 学习到更多Linux下的命令
- 学会安卓项目如何打包

**下一步计划：**

1.对融云的web端进行改造；

2.开发一套windows桌面程序。



附录：

参考文档：<https://docs.rongcloud.cn/im/introduction/intro/> 







