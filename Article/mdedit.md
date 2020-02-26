## 一、开源项目简介
今天分享一款支持自定义样式的微信 Markdown 排版工具 Markdown Nice，大大节省微信公众号文章排版问题。生成好的排版内容也是可以发布到其他平台的，例如知乎、开源中国、稀土掘金、博客园和 CSDN 等。

## 二、项目搭建

**前提**

- 本地已安装 `Node.js` 环境，若没安装请自行安装
- 服务端部署需要掌握 `Docker` 技术

**下载项目**

 下载项目到本地，执行如下代码：
 
 ```bash
 cd D:\devEnv\
 git clone https://github.com/mdnice/markdown-nice #下载项目
 ```
 **安装插件**
 
 切换到项目根目录，打开命令行窗口，执行如下命令安装 `yarn` 插件
 
 ```bash
 npm install yarn -g #安装插件
 ```
 
 **本地运行**
 
 切换到项目根目录，打开命令行窗口，执行如下命令，运行项目：
 
  ```bash
 yarn  #安装插件
 yarn start   #启动项目
 ```
 
 说明：由于本项目需要的项目依赖比较多，所有安装依赖的时候稍微等等。
 本地访问：http://localhost:3000/
 ![](https://imgkr.cn-bj.ufileos.com/5cf33b35-41df-4697-8858-fc73e90b68c1.png)

 **服务器部署**
 
 在项目根目录下执行 `yarn build` 构建项目，生成的 `build` 目录为构建好的内容。将构建好的代码部署到服务上，这里我使用的 `Docker` 工具。执行如下代码就可以将项目部署到服务器了。
 
```bash
docker search nginx  #搜索docker 镜像
docker pull docker.io/nginx
docker ps -a #查看所有docker 容器
netstat -an|grep 80  #查看 80 端口占用情况
history |grep docker |grep nginx  #查看关于 docker nginx 的操作历史
docker run --name nginx80  -p 8000:80  -v /usr/myWorkpace/mdedit/markdown-nice/build:/usr/share/nginx/html -d docker.io/nginx
```
服务已部署成功，访问：http://34.68.204.21:8000/
 
**更多功能**

 图片上传功能尚未配置，接下来我也会配置一下。
 更多功能和说明，可参考项目文档，文档地址：https://docs.mdnice.com/

## 三、最后
为什么我愿意分享开源项目，道理其实很简单，开源项目的作者可能为了技术能力提升，又或者解决了痛点等等原因。既然他们能将项目开源，那我更加乐意将优秀的开源项目分享给更多人，让更多的小伙伴感受到开源项目的魅力。
参与开源，学会分享，乐在其中!

 