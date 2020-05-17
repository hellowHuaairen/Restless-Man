## 一、简介
> 这是一款基于 `JS` 实现的超轻量级桌面版聊天软件。主要适用于私有云项目内部聊天，企业内部管理通讯等功能，主要通讯协议websocket。也支持web网页聊天实现。文字聊天，互传文件，离线消息，群聊，断线重连等功能。<br/>
先看一下效果，下图左边是`web`版，右边为`PC`版。
![](https://imgkr.cn-bj.ufileos.com/debdf1e7-da66-4187-9add-5d8dcf4bd3bb.gif)

## 二、本地搭建
### 2.1 技术栈
后端技术栈： 
- springboot: 让开发人员快速开发的一款Java的微服务框架。
- tio: 是百万级网络框架
- oauth2.0: OAuth 2.0 是一个行业的标准授权协议。OAuth 2.0 专注于简化客户端开发人员，同时为 Web 应用程序，桌面应用程序，手机和客厅设备提供特定的授权流程。

前端技术栈：
- vue: 套用于构建用户界面的渐进式前端框架。
- iview: 一套基于 Vue.js 的开源 UI 组件库,主要服务于 PC 界面的中后台产品。
- electron: 用HTML，CSS和JavaScript来构建跨平台桌面应用程序的一个开源库。

### 2.2 启动后端服务
**下载项目**<br/>
使用`gitBash` 工具下载项目到本地
```bash
git clone https://gitee.com/lele-666/V-IM.git
```
这里说明一下，项目的前后端代码这样就一次下载下来了。
- V-IM-PC: 前端代码
- V-IM-Server: 后端代码

**修改配置文件application.properties**<br/>
这里主要修改数据库连接和文件上传的路径:
```bash
#server.port=8081

spring.mvc.static-path-pattern=/**
#上传的文件路径
web.upload-path=D:/Temp

spring.datasource.driver-class-name=com.mysql.jdbc.Driver
spring.datasource.url=jdbc:mysql://127.0.0.1:3306/vim?useSSL=false
spring.datasource.username=root
spring.datasource.password=123456
...
```
注: 后端服务的端口根据自己的需要进行设置即可，默认 `8080`。

**初始化数据库**<br/>
数据库初始化脚本在`V-IM-Server\doc\init-20181231.sql`，通过`Navicat`数据库可视化工具导入数据库脚本即可。
![](https://imgkr.cn-bj.ufileos.com/a3e1cf7a-e4f0-4beb-a270-daa09f12caad.png)

**运行VServerApplication.java**<br/>
将项目导入到`Idea`，自动下载项目的相关依赖后，直接运行项目`VServerApplication`类的`main`方法，就可以开发环境启动后端服务了。
![](https://imgkr.cn-bj.ufileos.com/26db3805-1c01-4150-bfd4-fa786dd52452.png)

### 2.3 启动 `web` 前端服务
**下载依赖**<br/>
一次执行下面命令，就可下载前端项目所需的所有依赖包。
```bash
cd V-IM-PC #切换目录
npm install #npm安装依赖
yarn #yarn 
```
**本地运行**<br/>
本地运行两种方式，分别是 `Web`和`PC`。命令如下：
```bash
npm run serve #以web方式运行
npm run electron:serve #以客户端方式运行
```
注: `web`启动时，前端项目访问的端口是`8080`,会与后端的端口相同，所以将前端的访问的端口修改下就可以了。修改的文件为`index.js`:
```javascript
export default {
  app_name: "V-IM",
  http_protocol: "http",
  http_port: 8080, #修改这个地方
  ws_port: 9326,
  init: "/api/user/init",
  his_url: "/api/message/list",
  chat_users_url: "/api/user/chatUserList",
  token_path: "/oauth/token",
  register_url: "/register",
  ws_protocol: "ws",
  getHostUrl: function() {
    return (
      this.http_protocol +
      "://" +
      localStorage.getItem("host") +
      ":" +
      this.http_port
    );
  },
  ...
```
`web`版的效果:
![](https://imgkr.cn-bj.ufileos.com/1620cc60-ff9f-4449-bf84-0876089695c4.png)
`PC`版的效果:
![](https://imgkr.cn-bj.ufileos.com/dcb002b8-8ea1-4c87-ac01-bb0ea73086e8.png)

**打包命令**<br/>
本地测试功能问题，就可以进行项目打包了，打包命令也有两个:
```bash
npm run build #打包为web形式
npm run electron:build #打包为可执行文件
```

### 2.4 启动 `PC` 前端
**安装PC版**<br/>
这里有两种方式，直接下载作者已经打包好的`*.exe`文件，或者使用上面的命令自己构建`PC`版本。
我这里直接下载的`PC`版本。<br/>
下载地址:https://gitee.com/lele-666/V-IM/raw/master/v-im%20Setup%200.5.3.exe
**本地运行**<br/>
安装好`PC`版后，双击运行即可。效果如下图:![](https://imgkr.cn-bj.ufileos.com/54b7e262-3d3b-455d-b27b-76203b1f9b22.png)
这里配置一下`服务`就可连接到对应的后台服务了。


##  四、最后
按照这样的步骤走下来，几分钟就可以搭建`QQ`版聊天工具了。本编讲了开发环境搭建聊天工具的步骤。当然服务器部署也特别简单的。如果你对这款聊天工具有兴趣，不妨动动手指哦！

## 附录
- t-io项目地址: https://gitee.com/tywo45/t-io

