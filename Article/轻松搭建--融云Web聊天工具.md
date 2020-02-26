# 轻松搭建--类似微信的聊天工具



## 一、前言

腾讯QQ，微信我们大家一直在用的聊天工具。一直想着自己搭建一套类似QQ的聊天工具，最近发现了一款“融云”的聊天平台。可以满足聊天功能。

它支持应用内社交等场景，体验单群聊、聊天室、音视频通话、红包、小视频、动态表情等通讯能力。 

它的源码在`Github`都能找到，`Android端`，`Ios`端，`Web端`，`Server端`源码都有。今天先搭建一套`Web`版的聊天工具。

![](.\轻松搭建--融云Web聊天工具\1.png)

## 二、搭建步骤

### 1.`Server`端环境搭建

#### 1.下载项目

```
git clone https://github.com/sealtalk/sealtalk-server
```

#### 2.获取融云`App Key`和`App Key`

访问地址：<https://www.rongcloud.cn/>  注册融云账号，并创建应用

![](.\轻松搭建--融云Web聊天工具\2.png)

#### 3.修改配置文件

修改 `src/conf.js`的内容：这里主要修改下数据库信息和融云的配置信息

```js
 module.exports = {
  // 认证 Cookie 名称, 可根据业务自行定义
  AUTH_COOKIE_NAME: 'rong_auth_cookie', 
  // 认证 Cookie 加密密钥, 可自行定义, 任意字母数字组合
  NICKNAME_COOKIE_NAME: '', 
  // 认证 Cookie 过期时间, 单位为毫秒
  AUTH_COOKIE_MAX_AGE: '2592000000', 
  // 融云颁发的 App Key
  RONGCLOUD_APP_KEY: '8ljko22vuee',
  // 融云颁发的 App Secret
  RONGCLOUD_APP_SECRET: 'y0je2id4h1LWz', 
  AUTH_COOKIE_DOMAIN: 'devtalk.im',
  CORS_HOSTS: 'http://web.devtalk.im',
  // 本服务启动后占用的 HTTP 端口号
  SERVER_PORT: '8585', 
  DB_NAME: 'sealtalk', // 需保证 mysql 中包含此库 
  DB_USER: 'devtalk', 
  DB_PASSWORD: 'devtalk', 
  DB_HOST: '127.0.0.1', 
  DB_PORT: '3306' 
};
```

#### 4.执行命令

```bash
node install.js  //安装依赖
npm install -g pm2 //安装pm2工具
pm2 start src/index.js --name sealtalk-server  //启动服务
pm2 list //查看服务列表
pm2 logs //查看日志
pm2 log id/name //查看日志
pm2 -h //帮助文档
```

执行`pm2 list` 有名称为`sealtalk-server`表示服务启动成功。

![](.\轻松搭建--融云Web聊天工具\3.png)

### 2.`Web`端环境搭建

#### 1.下载项目

```
git clone https://github.com/sealtalk/sealtalk-web
```

#### 2.修改配置

修改配置文件` src/app.config.js `

```js
window.__sealtalk_config = {
  serverUrl: "http://localhost:8585", // 此处填写您部署的 App Server 地址
  appkey: "appkey" // 此处填写您的融云 AppKey
};
```

#### 3.执行命令

```bash
npm install -g typescript coffee-script grunt-cli //项目初始化
npm install -g bower //全局安装bower
bower install //安装bower依赖
npm install -g grunt-cli //全局安装grunt
grunt build //grunt构建项目
grunt release //发布正式代码
grunt connect //启动本地服务
```

#### 4.`Docker`运行前端项目

```bash
docker run -d -p 9001:80 -v /usr/myWorkSpace/im/code/sealtalk-web/build:/usr/share/nginx/html  --name docker.io/nginx
```

注：这是我在服务器运行的命令，本地搭建可忽略。

#### 5.`Web`端访问

在浏览器访问：<http://www.restlessman.cn:9001/> 

测试账号：18629693995 密码：123456

![](.\轻松搭建--融云Web聊天工具\4.png)

![](.\轻松搭建--融云Web聊天工具\5.png)

### 3.其他操作

#### 1.端口无法访问

1.我使用的`阿里云`，新增加对外暴露端口的时候需要添加安全组（我使用的阿里云客户端）

![](.\轻松搭建--融云Web聊天工具\6.jpg)

2.`宝塔`端口未开放

![](.\轻松搭建--融云Web聊天工具\7.png)

#### 2.基础工具的安装

- Git，Npm，maven，Mysql

#### 3.用户注册

- 访问首页，首页地址：<http://www.restlessman.cn:9001/> 
- 进入注册页面，填写`昵称`，`手机号`，然后点击`发送验证码`，在短信验证栏输入`9999`,最后输入`密码`，点击`注册`即可完成登录。

## 四、最后

今天介绍了一下`Web`版的搭建步骤，整理操作其实不难，有兴趣的话可以按照上面的步骤操作，给自己的服务器上搭建一套 web 版的聊天工具，先使用着。下一篇文章我会介绍`Android`客户端的搭建，我们就可以完成客户端的即时通讯了！



## 附录：

- IM 即时通讯  <https://docs.rongcloud.cn/open-resource/index.html#IM> 