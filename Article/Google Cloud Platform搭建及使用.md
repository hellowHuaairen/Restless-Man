Google Cloud Platform 免费送300美刀，赶紧体验一波

## 一、Google Cloud Platform (GCP) 简介

Google Cloud Platform (以下简称GCP)是Google提供的云平台,。Google云平台提供很多功能，包括计算服务，存储服务，网络服务，大数据服务，人工智能服务，以及谷歌的产品等，可以用来搭建加速服务, 网站和存储数据等等。本文将介绍如何申请GCP一年的免费试用、Linux服务器环境搭建。Docker环境搭建，运行有意思的镜像。

下图是我账号的首页

![](http://pzytkbyya.bkt.clouddn.com/1572059257368.png)

## 二、**Google Cloud Platform** 账号注册

### 1.注册前提

- Google账号
- 双币信用卡（Visa就可以）
- 能访问Google

### 2.账号注册

注册地址：https://cloud.google.com/


点击“免费开始使用”，登录Gmail账号，按照步骤进行操作即可。

### 3.访问首页

注册完成后，访问控制台：[https://console.cloud.google.com](https://console.cloud.google.com/) 

# 三、创建虚拟机

### 1.创建VM实例

打开控制台，选择“VM实例”


点击“创建实例”，根据自己的需要，选择配置。最后点击“创建”即可。


### 2.连接虚拟机

#### 1.默认连接方式

进入虚拟机管理列表，选择“SSH”,可通过浏览器连接远程虚拟机实例。


连接成功入下图：


```
sudo su  #切换rootu用户
passwd   #设置root用户密码
```

#### 2.远程SSH连接

```
vi /etc/ssh/sshd_config    #编辑配置文件
```

对文件内容修改：

```
PermitRootLogin yes      #默认为no,需要开启root访问权限
StrictModes yes          
PasswordAuthentication yes  #默认为no，需要开启密码登录
```

重启ssh服务

```
systemctl status sshd.service   #查看ssh服务
systemctl restart sshd.service  #重启ssh服务
systemctl start sshd.service    #启动ssh服务
```

这样就可以通过远程连接工具FinallShell，Xshell，SecureCRT等工具连接了。

## 四、安装Docker

### 1.前提条件

Docker 运行在 CentOS 7 上，要求系统为64位、系统内核版本为 3.10 以上 。

### 2.yum 安装Docker

```
uname -r   #查看内核版本
yum update  #更新yum
yum -y install docker #安装docker
systemctl start docker.service  #启动docker
docker version  #查看docker版本
systemctl enable docker #设置docker开启自启动
```

### 3.安装docker应用

#### 3.1获取docker镜像

1. 在命令行输入： docker search xxx  即可搜索镜像
2. 在Docker Hub获取你需要的镜像，网址：<https://hub.docker.com/> 

#### 3.2安装镜像

前两天在Docker hub找到了这位大牛，他只做了很多实用的镜像。

他的作品都在这里：<https://hub.docker.com/u/oldiy/> 

##### 1.运行镜像

以安装web音乐播放器 music-player-docker为例：

```
docker search music-player-docker  #查找镜像
docker pull docker.io/oldiy/music-player-docker   #拉取镜像
mkdir music_data      #创建文件夹
docker run -d --name music -p 264:264 -v /home/zzzxwzg16/music_data/:/var/www/html/cache oldiy/music-player-docker  #启动容器
```

#####  2.谷歌云防火墙开启端口

添加防火墙规则，和阿里云一样对外开启端口就可以访问了。


##### 3.访问web播放器

在浏览器访问地址：http://ip:264，我的web播放器的访问地址是：<http://34.68.204.21:264/> 


## 附录：

1.Google Cloud Platform(GCP)实例开启密码与root用户登陆 <https://www.bilibili.com/read/cv472620/> 

2.Linux上安装Docker(非常简单的安装方法) <https://blog.csdn.net/liupeifeng3514/article/details/79851467> 

2.Google Cloud Platform免费申请 <https://www.wmsoho.com/google-cloud-platform-ssr-bbr-tutorial/> 