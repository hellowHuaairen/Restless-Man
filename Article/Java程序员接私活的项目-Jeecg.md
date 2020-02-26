# Java程序员接私活的项目-JeecgBoot

近两年微服务大火，而对于`Java`程序员可实操的微服务框架就是**SpringBoot**，为什么大家都在使用微服务呢？- -第一，项目运行简单。相比较之前的 `Java Web`项目是需要部署到容器里，相应的我们需要掌握容器（Tomcat，Jboss，Jetty，Weblogic等）的一些基本知识。现在我们不依赖与任何容器，直接运行`Jar`包即可。

第二，配置文件减少，减少开发难度。

![](.\Java程序员接私活的项目-Jeecg\jeecg.png)

**为什么会选择`JeecgBoot`呢？**

JeecgBoot 是一款基于代码生成器的 J2EE 快速开发平台！ 简单功能由 Online Coding 配置实现（在线配置表单、在线配置报表、在线图表设计、在线设计流程、在线设计表单），减少了开发人员的工作量。 完全可以利用来接私活的！

## 一、技术栈

### 1.后端

- 基础框架：Spring Boot 2.1.3.RELEASE 
- 持久层：Mybatis-plus 3.1.2 
- 安全框架：Apache Shiro 1.4.0，Jwt 3.7.0 
- 数据库连接池：阿里巴巴Druid 1.1.10
- 缓存框架：redis
- 日志打印：logback
- 其他：fastjson，poi，Swagger-ui，quartz, lombok（简化代码）等。

### 2.前端

- Vue 2.6.10,Vuex,Vue Router
- Axios
- ant-design-vue
- webpack,yarn
- vue-cropper- 头像裁剪组件
- @antv/g2 - Alipay AntV 数据可视化图表
- Viser-vue- antv/g2 封装实现
- eslint，@vue/cli 3.2.1
- vue-print-nb - 打印



## 二、快速实战

### 1.本地环境搭建

#### 1.前提

- 确保已安装 `JDK8`,`maven`
- 确保已安装 `Node.js`

#### 2.拉取项目

```bash
git clone https://github.com/zhangdaiscott/jeecg-boot.git 
```

#### 3.运行前端

- 运行前端项目

```bash
cd  jeecg-boot/ant-design-jeecg-vue #切换到前端目录
npm install #安装依赖
npm run serve #运行前端项目
```

**启动成功：**

![1575088373963](.\Java程序员接私活的项目-Jeecg\1575088373963.png)

#### 4.运行后端项目

将项目导入 `Idea`，等待项目自动带入成功后，运行`JeecgApplication`类。

**注意：**

1.执行数据库脚本 

连接`数据库`，执行数据库脚本，脚本文件 `mysql-5.7.sql`

![1575088168528](.\Java程序员接私活的项目-Jeecg\1575088168528.png)

2.项目配置文件问题

默认项目加载`dev`的配置，所以修改 `application-dev.yml`文件中的 mysql，redis 连接信息

```json
#mysql连接信息    
datasource:
	master:
	  url: jdbc:mysql://ip:3306/jeecg-boot?characterEncoding=UTF-8&useUnicode=true&useSSL=false
	  username: root
	  password: root
	  driver-class-name: com.mysql.jdbc.Driver
  #redis 配置
  redis:
    database: 0
    host: redisIp
    lettuce:
      pool:
        max-active: 8   #最大连接数据库连接数,设 0 为没有限制
        max-idle: 8     #最大等待连接中的数量,设 0 为没有限制
        max-wait: -1ms  #最大建立连接等待时间。如果超过此时间将接到异常。设为-1表示无限制。
        min-idle: 0     #最小等待连接中的数量,设 0 为没有限制
      shutdown-timeout: 100ms
    password: 'password'
    port: 6379
```

启动成功：

![1575088574718](.\Java程序员接私活的项目-Jeecg\1575088574718.png)



#### 5.浏览器访问

在浏览器访问：localhost:3000

![1575088701552](.\Java程序员接私活的项目-Jeecg\1575088701552.png)

### 2.服务器环境搭建

为什么要选择`JeecgBoot`，有详细的开发文档，这里我使用的`极简部署方案`，文档将的很详细，这里我简单说下。

- 将前端项目打包后放到`jeecg-boot-module-system` 项目的 `/src/main/resources/static` 目录下。 
- 修改后端项目`jeecg-boot-module-system`的配置文件，包括 contex-path，mysql，redis 的连接信息。

极简部署方案地址：<http://doc.jeecg.com/1273924> 

我在服务器部署一个环境：<http://www.restlessman.cn:8080/> 

## 三、总结

我觉得学习最好的方式就是模仿！写过代码的人都知道，有了项目源码却无法让项目跑起来是多么头疼的一件事！所以我一直在写开源项目环境搭建的文章。项目跑起来了，我们再研究其中的代码，可以通过单元测试，断点调试等多种方式来学习。在实战中学习才是最快的学习方式。

## 附录：

- 项目文档：<http://doc.jeecg.com/> 