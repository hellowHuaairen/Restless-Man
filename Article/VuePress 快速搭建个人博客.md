# VuePress +Gitee 快速搭建个人博客

## 一、快速搭建博客

#### 1.怎么才能实现快速搭建博客的呢？

其实很简单就是拿来主义。首先你要知道有哪些工具可以搭建博客；然后你可通过搜索引擎搜索官方文档，动动手指就可以本地运行起来。但是运行起来的只是个 demo ,你的要求肯定不仅限于此。

#### 2.怎样搭建一个功能强大的博客呢？

继续使用搜索引擎搜索博客主题，然后嵌入自己的内容。一款优秀的博客框架，当然有很多开发者的支持。那么肯定很多的主题（Theme），拿来直接用就好了。

#### 3.博客已搭建起来了，怎么进行个性化改造了？

现在就可以回到本源了，需要什么功能，再去官方文档查阅。然后通过官网的说明再加上自己的一些理解，再在网络中看看他人是如何使用，然后进行个性改造。

## 二、VuePress 简介

VuePress 由两部分组成：第一部分是一个极简静态网站生成器，它包含由 Vue 驱动的主题系统和插件 API，另一个部分是为书写技术文档而优化的默认主题，它的诞生初衷是为了支持 Vue 及其子项目的文档需求。

每一个由 VuePress 生成的页面都带有预渲染好的 HTML，也因此具有非常好的加载性能和搜索引擎优化（SEO）。同时，一旦页面被加载，Vue 将接管这些静态内容，并将其转换成一个完整的单页应用（SPA），其他的页面则会只在用户浏览到的时候才按需加载。

## 三、实战

### 3.1.博客快速搭建

#### 3.1.1.本地博客搭建命令

a.npm 博客搭建

```bash
npm install @vuepress-reco/theme-cli -g #插件安装
theme-cli init wangzg-blog #项目初始化
cd wangzg-blog 
npm install #安装依赖
npm run dev #项目运行
npm run build #项目构建
```

b.yarn 博客搭建

```bash
npm  install -g cnpm --registry=https://registry.npm.taobao.org #安装淘宝镜像
cnpm install -g yarn #安装yarn
yarn global add @vuepress-reco/theme-cli #插件安装
theme-cli init wangzg-blog # init #项目初始化
cd wangzg-blog 
yarn install #安装依赖
yarn dev #项目运行
yarn build #项目构建
```

项目运行效果：


#### 3.1.2.代码推送到码云（Gitee）

a.Gitee创建项目


找到wangzg-blog\docs\.vuepress\config.js 添加一行代码

```bash
 base: '/vuepress-demo/', #设置站点根路径
```

b.推送的代码到Gitee

```bash
git clone https://gitee.com/huaairen/vuepress-demo.git #克隆空项目到本地
cp wangzg-blog\public  vuepress-demo #项目public是打包后的资源，复制打包的资源到vuepress-demo下
cd vuepress-demo  
git status #git 状态
git add . #添加当前目录所有文件
git commit -m "init blog" #提交文件
git push #推送代码
history #git操作历史
```

c.设置Gitee Pages

进入 Gitee 的 [vuepress-demo](https://gitee.com/huaairen/vuepress-demo) 仓库，选择"服务"-->"Gitee Pages"


不需要填写任何内容，点击"启动"就行。


最终在线访问：<https://huaairen.gitee.io/vuepress-demo/> 

### 3.2.官方文档教程

VuePress 的官方教程其实特别详细，喜欢从 0 搭建博客的小伙伴可以选择官网教程。

```bash
cd myblog
npm init -y 
npm install -D vuepress #本地依赖安装
mkdir docs #新建一个 docs 文件夹，此目录保存markdown文章
npm run docs:dev #启动项目
npm run docs:build #打包项目
```

最终项目的目录结构如下图：

```
.
├── docs
│   ├── .vuepress (可选的)
│   │   ├── components (可选的)
│   │   ├── theme (可选的)
│   │   │   └── Layout.vue
│   │   ├── public (可选的)
│   │   ├── styles (可选的)
│   │   │   ├── index.styl
│   │   │   └── palette.styl
│   │   ├── templates (可选的, 谨慎配置)
│   │   │   ├── dev.html
│   │   │   └── ssr.html
│   │   ├── config.js (可选的)
│   │   └── enhanceApp.js (可选的)
│   │ 
│   ├── README.md
│   ├── guide
│   │   └── README.md
│   └── config.md
│ 
└── package.json
```

更多详细内容可参考官方文档。<https://vuepress.vuejs.org/zh/guide/getting-started.html> 

## 四、最后

前端技术的飞速发展，博客搭建变得更加的简单。现在只需要在 Github/Gitee/Coding 的代码托管网站注册账号，创建代码仓库，然后通过这些平台发布自己的静态博客网站。

博客可以记录生活的点滴；可以交更多朋友；也是互联网时代自己的一个标签。

## 参考：

1.vuepress 快速上手：<https://vuepress.vuejs.org/zh/guide/getting-started.html> 

2.vuepress-theme ：<https://github.com/topics/vuepress-theme> 

3.awesome-vuepress ：<https://github.com/meteorlxy/awesome-vuepress> 

4.vuepress博客主题—vuepress-theme-reco ： <https://juejin.im/post/5c80de10f265da2dcd7a0e5e> 

5.vuepress-theme-blog ： <https://vuepress-theme-blog.ulivz.com/> 

6.VuePress 快速踩坑 ： <https://juejin.im/entry/5ae178ebf265da0b84552035> 