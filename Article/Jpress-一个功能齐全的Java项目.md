JPress--一个包罗万象的后台管理系统

>  多年来，作者一直在用 WordPress 做个人技术博客、营销页面 和 公司官网等，感受到 WordPress 的实用、简洁和强大，而他也是 WordPress 的受益者。 JPress是一个使用Java开发，类似WordPress的产品。不仅仅包含了极其简单的模板设计方法， 更多的是做了非常多符合中国互联网生态的创新。 天生融合微信生态系统，简单易上手。

话不多说，我们一起学习 JPress 吧！最快的方式就是先把它运行起来，然后再逐渐深入到每个功能点。

JPress的官方部署文档很详细，今天分享一中方式：Docker部署方式。



**码云**：star 2.5k    Fork 1.3k

## 一、环境部署

注:更多其他平台的部署方案可参考官方文档

### 1.准备工作

- 准备一台centos7服务
- 安装 docker,docker-compose环境

### 2.linux环境安装docker

a.安装 docker

```bash
uname -r #查看你当前的内核版本
yum update #更新yum
yum -y install docker #安装 docker
systemctl start docker.service #启动 docker 服务
docker version #查看 docker版本
```

b.安装 docker-compose

```bash
yum install docker-compose #安装 docker-compose
docker-compose version #查看版本
```

### 3.修改配置文件

```bash
wget https://gitee.com/fuhai/jpress/raw/master/docker-compose.yml #下载文件
```

我主要修改的内容是mysql版本，mysql默认对外暴露的端口和jpress连接的数据库ip地址。

修改后的内容如下：

```yaml
version: '3.1'

services:

  db:
    image: mysql:5.7 #mysql的版本
    command: --default-authentication-plugin=mysql_native_password
    restart: always
    ports:
      - "3306:3306"  #添加mysql对外暴露的端口
    environment:
      MYSQL_ROOT_PASSWORD: jpress
      MYSQL_DATABASE: jpress
      MYSQL_USER: jpress
      MYSQL_PASSWORD: jpress
    volumes:
      - "./docker_volumes/mysql:/var/lib/mysql"

  jpress:
    depends_on:
      - db
    links:
      - db
    image: fuhai/jpress:v2.0.8
    ports:
      - "8080:8080"
    restart: always
    environment:
      TZ: Asia/Shanghai
      JPRESS_DB_HOST: db  #修改为数据库的真实ip地址
      JPRESS_DB_PORT: 3306
      JPRESS_DB_NAME: jpress
      JPRESS_DB_USER: jpress
      JPRESS_DB_PASSWORD: jpress
    volumes:
      - "./docker_volumes/webapp/attachment:/opt/jpress/webapp/attachment"
      - "./docker_volumes/webapp/addons:/opt/jpress/webapp/addons"
      - "./docker_volumes/webapp/WEB-INF/addons:/opt/jpress/webapp/WEB-INF/addons"
      - "./docker_volumes/webapp/wp-content:/opt/jpress/webapp/wp-content"
      - "./docker_volumes/webapp/templates/dockers:/opt/jpress/webapp/templates/dockers"

```

### 4.启动项目

```bash
docker-compose up -d #启动项目
docker-compose down #停止并删除项目
```

### 5.运行效果

#### a.后台管理页面

**测试地址**：<http://34.68.204.21:8080/admin/login> 

**账号**：admin  **密码**: 123456

![1577023728830](.\Jpress-一个功能齐全的Java项目\1577023728830.png)

#### b.前端页面

**测试地址**：<http://34.68.204.21:8080/> 

![1577023817951](.\Jpress-一个功能齐全的Java项目\1577023817951.png)

## 二、定制化开发

#### 1.模板开发

在官网浏览了一下，Jpress 也和 WordPrss 一样是支持模板下载的，但是这里的模板基本都是收费的。我想作为一个开发，我们完全有能力开发页面展示模板，不仅可以自己使用，也可以与 JPress 合作，转个零花钱。

这里推荐一个免费的模板：LivingCoral 博客主题

主题下载地址：<https://gitee.com/tateliao/JPress-LivingCoral/> 

![1577025111058](.\Jpress-一个功能齐全的Java项目\1577025111058.png)

### 2.插件开发

当然我们也可以开发插件了。这上面的插件都是明码标价，如果JPress使用的特别多的话，我们完全可以依托这个平台，开发一些有价值的插件。

![1577025252009](.\Jpress-一个功能齐全的Java项目\1577025252009.png)

### 3.微信/小程序的接入

JPress支持微信/小程序的接入，在官网我也看到小程序的免费开源。我觉得可以试一试。

![1577025488370](.\Jpress-一个功能齐全的Java项目\1577025488370.png)

## 三、二次开发

项目目录结构如下：

```bash
├── codegen
├── jpress-addons
├── jpress-commons
├── jpress-core
├── jpress-model
├── jpress-service-api
├── jpress-service-provider
├── jpress-template
├── jpress-web
├── module-article
├── module-page
├── starter
├── starter-dev
└── starter-tomcat
```

将项目导入到 idea 或者 eclipse 

- 修改`jboot-simple.properties` 数据库连接信息

- 先执行`mvn clean instal `
- 直接运行 `starter/src/main/java/Starter.java `

## 四、最后

上周在翻看`码云`的`GVP`项目时，无意间看到了`JPress`项目，仔细一看我竟然很早之前就`star`了。所以很有缘，本周的开源项目分享就是你了。`WordPress`的功能确实超级齐全，作者能能完成`JPress`项目的开发也很超级厉害。有兴趣的朋友可以去支持一波。

## 附录

官方文档：<http://www.jpress.io/article/37> 