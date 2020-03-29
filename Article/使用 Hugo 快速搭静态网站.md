## 一、简介
`Hugo` 是Go语言实现的一款静态网站生成器。它简单、易用、高效、易扩展、快速部署。相比较其他静态网站生成器，它的优点有这几点：
 - 项目构建特别快，
 - 主题目录与站点目录结构一样
 - 配置文件为`*.toml` 格式，语法常简单易懂，没有缩进的要求
 
## 二、快速搭建
### 2.1 安装 Hugo
下载地址：https://github.com/gohugoio/hugo/releases <br/>
根据自己的操作系统下载不同的版本。并将 `hugo` 添加到环境变量。

### 2.2 生成站点

执行下面这些命令就可以创建自己的站点了。
```
cd d:/myWebSite  #切换目录
hugo new site website-demo #创建站点
```
站点目录结构如下:
```
+------------
│  config.toml
├─archetypes
│      default.md
├─content
├─data
├─layouts
├─static
└─themes
```
### 2.3本地运行

#### 2.3.1 创建文章
1.创建一个 `about.md` 文件，命令行执行 
```
hugo new aboutme.md
```
项目根目录 `content` 文件夹下会生成 `aboutme.md`文件，用文本编辑打开文件，编辑保存即可。内容如下：
```
---
title: "Aboutme"
date: 2020-03-28T23:36:36+08:00
draft: true
---
大家好，我叫不安分的猿人！
```
2.创建一篇 `firstArticle.md`,执行下面命令会在项目根目录`post` 文件夹下生成 `firstArticle.md`文件。
```
hugo new post/firstArticle.md
```
#### 2.3.2 添加主题
执行下面命令，就可以下载主题到本地，运行项目就可以查看自己的静态网站了。
```
cd themes
git clone https://github.com/spf13/hyde.git
```
#### 2.3.3 运行项目
执行如下命令，就可以本地运行站点了。
```
hugo server --theme=hyde --buildDrafts
```
效果如下图：
![](https://imgkr.cn-bj.ufileos.com/40d4dc22-1f69-4117-af9b-6097f3998e80.png)
是不是超级简单，3分钟就可以构建自己的站点。有的伙伴可能会问这样的网站也太low了，谁会用？其实上面将的这些内容只是让搭建感受一下最原始的方式搭建自己的站点，接下来就讲讲高阶一些的方法。

## 三、切换主题
官方网站有很多主题，任由我们的选择。官方网站地址：https://themes.gohugo.io/<br/>
也可以直接在`Github`下载主题，地址：https://github.com/gohugoio/hugoThemes<br/>
大体上主题可以分为三类：
- 个人博客：https://themes.gohugo.io/hugo-theme-dream/
- 商业网站：https://themes.gohugo.io/resto-hugo/
- 在线简历：https://themes.gohugo.io/theme/hugo-devresume-theme/

**快速体验**

1. 使用 `git clone url` 下载相应的题，注意最好将主题下载到 `themes` 目录。 
2. 找到主题下的 `exampleSite` 目录，复制目录下的`config.toml`文件内容到站点根目录的`config.toml`中。
3. 找到主题下的 `exampleSite` 目录，复制 `content`目录下的所有内容到站点根目录 `content`文件夹。
4. 执行 `hugo server` 就可以运行了。<br/>

运行效果如下图：
![](https://imgkr.cn-bj.ufileos.com/6783cbb0-59db-46c8-bb3a-36f45378ff89.png)
有了主题就是能好看一下哈，如果你还不满意这样的显示效果，那么就开启自定设计之路吧。每个主题都有 `layouts` 目录，这里就是一些静态模板，上手改就对了。模板的内容如下：

```html
{{ $paginator := .Paginate (where .Data.Pages "Section" "in" .Site.Params.mainSections) }}
{{ range $paginator.Pages }}
<article class="article article-type-post" itemscope="" itemprop="blogPost">
    <div class="article-inner">
        {{ if and (isset .Params "banner") (not (eq .Params.banner "")) }}
        <a href="{{ .Permalink }}" itemprop="url">
            <img src="{{ .Params.banner | absURL }}" class="article-banner">
        {{ end }}
        </a>
        {{ partial "article_header" . }}
        <div class="article-entry" itemprop="articleBody">
            <p>
                {{ .Description | default .Summary }}
            </p>
            <p class="article-more-link">
                <a href="{{ .Permalink }}">
                    {{with .Site.Data.l10n.articles.read_more}}{{.}}{{end}}
                </a>
            </p>
        </div>
        {{ partial "article_footer" . }}
    </div>
</article>
{{ end }}
{{ partial "pagination" . }}
```

## 四、服务器部署

### 4.1 Github 配置自动打包
**创建分支source**

`source` 分支提交项目源码，将打包好的项目通过 `CI` 工具自动提交的 `master` 分支，使用`Github Pages` 部署我们的静态项目。注:需要基于 `Github` 创建静态项目，需创建仓库名为 `username.github.io` 的仓库。

**创建文件.travis.yml**

在项目根目录创建 `.travis.yml` 文件，这是`CI` 工具的配置文件，内容如下：
```xml
dist: bionic
language: python # 默认是ruby
python: 3.7

install:
  # nuo主题需要extended版本的hugo，其他主题可以用最新的普通版本就行
  - wget https://github.com/gohugoio/hugo/releases/download/v0.58.3/hugo_extended_0.58.3_Linux-64bit.deb
  - sudo dpkg -i hugo*.deb
script:
  - hugo

# 构建完成后会自动更新Github Pages
deploy:
  provider: pages
  skip-cleanup: true
  local-dir: public
  target-branch: master
  github-token: $GITHUB_TOKEN
  keep-history: true
  on:
    branch: source
```
文件内容很明确:指定代码构建的工具为`python3.7`，安装最新的`hugo` 工具，代码构建是基于 `source` 分支构建的，将构建好的项目提交到 `master` 分支。这里注意 `github-token: $GITHUB_TOKEN`这行内容，需要手动创建一个 `Personal access tokens`，<br/>
连接地址: https://github.com/settings/tokens/new<br/>如下图:
![](https://imgkr.cn-bj.ufileos.com/e19693bf-f37c-4012-9ba7-8e1529c77310.png)
点击生成之后，复制生成的 Token（注意：关闭页面后就找不到了），留作下一步Travis CI设置用。

**Travis CI配置**

通过`Github`账号授权登录 `Travis CI`，https://travis-ci.org/<br/>
添加需要自动构建的项目，如下图:
![](https://imgkr.cn-bj.ufileos.com/12a9a4ed-50ec-4c12-9cf1-be3d0e298cf7.png)
点击后面的settings，在 Environment Variables 中添加NAME填 GITHUB_TOKEN，VALUE填上一步生成的 Token
![](https://imgkr.cn-bj.ufileos.com/32542dfb-3e83-469c-83c9-473536159e58.png)

**提交代码**
接下来在 `source` 分支提交代码，打包后的项目就会自动提交到 `master` 分支，使用 `Github Pages` 就可以实现自动部署我们的项目了。
![](https://imgkr.cn-bj.ufileos.com/6ea895d3-2dab-4135-b569-02ddf93533a6.png)
我搭建的博客地址:https://hellorestlessman.github.io/
### 4.2 docker 部署
如果你有自己的服务，那么也可以部署项目到自己的服务，最好的方式是在自己的服务器上跑一个像`Jenkins` 的自动化构建工具，当提交代码后，自动打包，打包完成后自动部署。服务器安装 `Jenkins` 有很多方式，这里就不细说了。我就大概将一下服务器上如何部署前端项目。<br/>
这里以 `Docker` 容器为例，服务器安装好 `Docker` 后，执行如下命令即可部署前端项目:
```bash
docker run --name nginx_test1 -d -p 3000:80 -v /usr/web/html/:/usr/share/nginx/html nginx #指定宿主机静态资源路径
docker run --name nginx_test2 -d -p 80:80 -v /nginx/html:/usr/share/nginx/html -v /nginx/conf/nginx.conf:/etc/nginx/nginx.conf  nginx #指定宿主机静态资源，挂在外部配置文件
```
这里注意，先临时启动一个`nginx`容器，获取一下 `nginx.conf`，执行如下命令：
```bash
docker run -d -p 8088:80 --name nginx_tmp nginx
docker cp nginx_tmp:/etc/nginx/nginx.conf /nginx/conf/nginx.conf
```

## 五、 最后
一句话 `Hugo`很优秀，如果你也正好需要建网站，可以考虑一下 `Hugo`。本文讲了很多东西都不是很详细，代码自动构建工具 `Travis CI`、`Jenkins` 值得深入一下。 `Docker` 基本操作有兴趣的伙伴也可以学习一下。每一项技能或者知识，如果能把这些知识点串联起来，就可以完成不可思议的事情。哈哈开个玩笑，下期再见！