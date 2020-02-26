## 一、前言
之前写过很多种博客搭建的方法， [10个月文章汇总](https://mp.weixin.qq.com/s?__biz=MzI0MDM3NDMxNQ==&mid=2247484745&idx=1&sn=bd495d4f4cd186d8c2ead59d8de5ef43&chksm=e91a820dde6d0b1b1b92a73895e3efcb339ae92214b3ea09e5f33805960a3f94fd74555d658d&token=914620399&lang=zh_CN#rd) 可阅读之前的文章。本篇讲 SpringBoot + Mybatis + Thymeleaf 方式搭建个人博客，三种主题自由切换。博客页面也很美观、各种功能齐全。对于懂 Java 语言的伙伴来说是个不错的方式；作者的代码也是特别的6，对于初学 `Springboot` 的伙伴，也是一个不错的实战项目。那么话不多说我们直接开始实战吧！

## 二、博客搭建

**前提**

- 安装 `Jdk8` 或者更高版本，全称 Java Development Kit，它是 Java 的库函数，是编译、运行java程序的工具包。
- 安装 `Maven3`环境，进行项目构建和项目依赖包管理。
- 安装开发工具，例如：Idea，Eclipse，Spring Tool Suite 等
- 安装 `Git` 工具，使用 `GitBash` 工具进行下载，提交代码等操作。

**下载项目**

执行如下命令，将代码克隆到本地指定目录，这里指定的目录是 `D:\devEnv`。
```bash
cd D:\devEnv\
git clone https://github.com/ZHENFENG13/My-Blog.git
```

**导入数据库**

阅读项目 `READ.md` 文件可知，项目数据库的初始化脚本存放在 `static-files/my_blog_db.sql` 目录。这里我通过数据库可视化工具 Navicat 导入数据。如下图：
![](https://imgkr.cn-bj.ufileos.com/273c0d67-50e9-4e47-8f2d-f427b7167161.png)

**修改配置文件**

修改项目配置文件 `resources\application.properties`，主要修改数据库 url，数据库用户名和密码。

```bash
# datasource config
spring.datasource.name=my-blog-datasource
spring.datasource.driverClassName=com.mysql.cj.jdbc.Driver
spring.datasource.url=jdbc:mysql://localhost:3306/my_blog_db?useUnicode=true&characterEncoding=utf8&autoReconnect=true&useSSL=false&serverTimezone=UTC
spring.datasource.username=root
spring.datasource.password=password

```

**本地运行**

这里有两种方式运行：
1.Idea 导入项目，找到 `MyBlogApplication`，右键“运行”即可启动。
![](https://imgkr.cn-bj.ufileos.com/d27585f8-f9fa-4f9f-b375-f5e5f6b856d5.png)

2.在项目根目录，执行如下命令，也可以运行项目。

```bash
cd D:\devEnv\My-Blog
mvn clean package -DskipTests
cd target
java -jar my-blog-4.0.0-SNAPSHOT.jar
```

**切换主题**

大概阅读了一下代码，我找到主题切换的地方，在 `MyBlogController` 类中定义的：

```java
@Controller
public class MyBlogController {

    //public static String theme = "default";
    //public static String theme = "yummy-jekyll";
    public static String theme = "amaze";
  ...
}
```
修改 `theme` 的值可切换到不同的主题显示。<br/>
这里大概说一下我寻找相关代码的思路：
- 项目启动后，查找项目系统配置，是否有切换主题的开关。
- 在项目配置文件中找关于 `主题` 注释 或者 `theme` 的配置
- 在后端代码中寻找关于 `主题`的注释 或者 `theme` 的变量


**配置ssl**

1.下载阿里云 `ssl` 证书，因为 `SpringBoot` 默认使用的内嵌的 `tomcat`，所以这里下载 `tomcat` 版证书即可。如下图：
![](https://imgkr.cn-bj.ufileos.com/c2c1aeee-d089-40d5-a5e3-8153255a3341.png)

注：上篇文章已讲解阿里云如何购买免费证书，请阅读上篇文章 [Tomcat配置SSL证书实现 https 访问](https://mp.weixin.qq.com/s?__biz=MzI0MDM3NDMxNQ==&mid=2247484892&idx=1&sn=e5baa670afc89ea2fa27b570853a85c6&chksm=e91a8298de6d0b8e4fe733e0a65fe9539c99ee4fc29f644cb7fe0d003136439bf7d03d52dfbf&token=914620399&lang=zh_CN#rd)<br/>
2.下载下来的配置压缩包包含两个文件：
![](https://imgkr.cn-bj.ufileos.com/44b4f070-0fef-445d-b552-0c0dce898ba7.png)<br/>
3.修改项目配置文件 `resources\application.properties`，添加如下内容：
```bash
server.port = 443  #服务启动端口改为 443
server.ssl.key-store=*.pfx #配置自己证书的 pfx 文件
server.ssl.key-store-password=xxxx #pfx-password.txt 的文件内容
```
4.修改项目入口类 `MyBlogApplication`，添加如下代码：

```java
    //HTTP访问自动转HTTPS访问
    @Bean
    public TomcatServletWebServerFactory tomcatServletWebServerFactory(Connector connector){
        TomcatServletWebServerFactory tomcat=new TomcatServletWebServerFactory(){
            @Override
            protected void postProcessContext(Context context) {
                SecurityConstraint securityConstraint=new SecurityConstraint();
                securityConstraint.setUserConstraint("CONFIDENTIAL");
                SecurityCollection collection=new SecurityCollection();
                collection.addPattern("/*");
                securityConstraint.addCollection(collection);
                context.addConstraint(securityConstraint);
            }
        };
        tomcat.addAdditionalTomcatConnectors(connector);
        return tomcat;
    }
    @Bean
    public Connector connector(){
        Connector connector=new Connector("org.apache.coyote.http11.Http11NioProtocol");
        connector.setScheme("http");
        connector.setPort(80); //服务默认启动端口
        connector.setSecure(false);
        connector.setRedirectPort(443); 
        return connector;
    }
```
服务器对外暴露端口为 `80`, `443` 为 `https` 默认端口。

**服务器部署**

服务部署 `SpringBoot` 项目有很多种方式：
- Tomcat 容器部署项目
- Jar 形式启动项目
- Docker 容器启动项目

本编以 `Jar` 包形式启动 `SpringBoot` 项目。这里注意：需要将项目构建好的 `jar`包和上面的证书文件 `xx.pfx` 文件放在同一个目录。<br/>
这里为了好管理服务，我创建了两个 `sh` 文件startup.sh、shutdown.sh，以后通过这两个脚本启动或停止服务。<br/>
`startup.sh` 文件内容如下：

```bash
nohup java -jar my-blog.jar  >my-blog.log &
```

`shutdown.sh` 文件内容如下：

```bash
#!/bin/bash
PID=$(ps -ef | grep my-blog.jar | grep -v grep | awk '{ print $2 }')
if [ -z "$PID" ]
then
    echo Application is already stopped
else
    echo kill $PID
    kill $PID
fi
```

**浏览器访问**

在浏览器访问：`https://domain:port` 即可访问服务。我刚刚搭建的服务地址 `www.restlessman.cn`，效果如下图：
![](https://imgkr.cn-bj.ufileos.com/926b890a-7c3c-4f58-ba51-0b30a35be0ea.png)


## 三、最后

整体阅读下来搭建个人博客是不是超级简单！搭建博客最主要是为了记录个人的学习和生活，可以通过网络认识更多有意思的小伙伴。博客页面效果也是需要不断更新的，所以选择自己擅长的框架搭建个人博客也是很重要的，后期熟悉框架后，自己可自定义博客了，添加自己喜欢的模块和插件。
