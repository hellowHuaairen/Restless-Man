# Axelor Open Suite 一款 OA 项目框架
## 一、简介
![](https://imgkr.cn-bj.ufileos.com/26a404fa-686c-46bd-8d94-0619f25c79c3.png)
Axelor Open Suite 关注业务流程，减少了开发的复杂度，帮助我们快速构建应用。它是一款 `MVC` 框架，需要我们写很少量的 `java` 代码，因为它的 `models`，`views`， `actions` 都是在 `xml` 文件中定义的，框架会自动帮我们生成各部分的代码，大大提高了开发效率，只有少量的业务代码需要我们开发。功能已 “app” 的形式存在，支持安装和卸载操作。框架的文档特别丰富，并且讲的特别详细，是个不错的学习项目。 <br/>

Axelor Open Suite包括以下模块：
- 客户关系管理
- 销售管理
- 财务和成本管理
- 人力资源管理
- 项目管理
- 库存和供应链管理
- 生产管理
- 多公司，多币种和多语言

## 二、项目搭建

### 2.1 本地搭建

**下载项目**

[项目安装包下载地址](https://www.axelor.com/community/downloads/)，根据自己的操作系统，下载不同的安装包。![](https://imgkr.cn-bj.ufileos.com/a0b77748-143a-439a-8551-4644509945cf.png)


**运行项目**
1.运行 `axelor.exe`<br/>
将下载的 `zip` 包解压，双击执行 `axelor.exe`，就可以本地安装 `Axelor`。
![](https://imgkr.cn-bj.ufileos.com/eea5928f-3724-4406-a0c8-e332eab4f39f.png)
说明：
- Web Port：web 端对外暴露的端口，即浏览器访问端口
- Database Port：PostgreSQL 数据库端口
- Database Password：PostgreSQL 数据库用户密码
- Confirm Password：确认密码
- Language：语言
- Theme：使用的应用程序主题

2.访问项目
项目运行成功后，在浏览器访问：http://localhost:8080/，账号密码：admin/admin
![](https://imgkr.cn-bj.ufileos.com/1ffc1928-8721-40a4-ae0f-d16fbfba0a2f.png)

### 2.2 服务器搭建

 **前提**
 
 - 安装 `Docker` 环境，Docker 是一个开源的应用容器引擎，打包后的应用可发布到任何平台，不受外部环境的干扰。
 - 掌握常用的 `Docker` 命令，docker run，docker ps，docker images，docker logs。
 
 **安装 Docker 环境**
 
 ```bash
 uname -r #查看你当前的内核版本
 yum update #更新yum
 yum -y install docker #安装 docker
 systemctl start docker.service #启动 docker 服务
 docker version #查看 docker版本
 ```
 
 **运行项目**
 执行下面命令即可运行项目。
 
 ```bash
 docker run -d -it -p 8081:80 --name aio-erp axelor/aio-erp
 ```
 说明：
  - -d 参数表示后台运行。
  - -p 8081:80 参数表示对外暴露 8081 端口，外部访问 8081 指向内部 80 端口。
  - --name 参数指定创建容器的名称
  
 **运行效果**
 浏览器访问：http://ip:8081/即可，这里我搭建一个环境，地址：http://34.68.204.21:8081/，运行效果如下图：
 ![](https://imgkr.cn-bj.ufileos.com/4e623862-f1ce-4829-b35f-4c81807ed72d.png)
 更多功能可访问[项目说明文档](https://docs.axelor.com/abs/5.0/functional/index.html)
 
 ### 2.3 其他运行方式
 - War 包方式运行，[官方安装文档](https://docs.axelor.com/abs/5.0/install/war/index.html)
 - 源码运行，[官方文档](https://docs.axelor.com/abs/5.0/install/source/index.html)

## 三、最后
这个项目是我刷 `B站` 的时候发现的，Axelor 功能很强大。大部学习 Java 的同学可能一直在用 `Spring` 的系列产品，其他的一些框架可能关注比较少。希望我的讲解能让你看到更多开源项目，感受开源项目的乐趣。有兴趣的伙伴可以动动手了！

## 四、参考
- [快速入门官方文档](https://docs.axelor.com/adk/5.0/)
- [功能文档](https://docs.axelor.com/abs/5.0/functional/)
- [Github仓库地址](https://github.com/axelor/axelor-open-suite)