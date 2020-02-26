## Jekyll  + Github Pages 搭建个人免费博客 

今天亲手通过 Jekyll  搭建了一套免费博客，搭建步骤其实超级简单。你不需要购买域名，也不需要购买服务器，就可以轻松拥有你自己的博客。

**Jekyll** 的核心是一个文本转换引擎。它的方便之处在于支持多种文本标记语言： Markdown，Textile，HTML， 然后 Jekyll 就会帮你加入你选择主题的样式的布局中。最终生成你自己的静态博客网站。 

### 博客搭建步骤

### 1.安装环境

#### 1.安装Ruby

官网地址：<https://rubyinstaller.org/downloads/> 

根据自己的需要下载不同版本，直接点击“下一步”就可轻松安装成功。

#### 2.安装RubyGems

官网地址：<https://rubygems.org/pages/download> 

据自己的需要下载不同版本。解压压缩文件到本地。在 CMD 命令窗口执行如下命令：

```bash
cd D:\下载\rubygems-3.0.6\rubygems-3.0.6	#切换文件目录
ruby setup.rb       #安装rubygems
ruby -v     #查看rubygems版本号
```

#### 3.安装Jekyll

以上两个步骤操作完成后，在 CMD 窗口执行如下命令安装Jekyll：

```bash
 gem install jekyll   #安装jekyll
 jekyll -v    #查看jekyll版本号
```

### 2.本地搭建博客

#### 1.项目启动

```bash
jekyll new restlessManBlog   #新建博客restlessManBlog
cd restlessManBlog     #切换目录到restlessManBlog
jekyll server      #启动项目
```

项目启动日志如下：

![1570805259036](C:\Users\ADMINI~1\AppData\Local\Temp\1570805259036.png)

在浏览器访问：<http://localhost:4000/> 

#### 2.添加 MarkDown 文档

在项目根目录下的 _posts 目录创建 markdown 文档。这里注意 md 文档命名要添加 “yyyy-mm-dd”的前缀。

例如：2019-10-11-5分钟搭建博客.md

### 3.部署代码到 Github

#### 1.创建 Github 账号

注：这里我使用的 Github 托管静态博客的，你也可以选择把代码托管到 **码云** 或者其他平台上。 

没有 Github 账号的朋友可以注册一个账号，有账号的朋友可跳过。

#### 2.创建代码仓库

创建一个名称为 ‘账号名称.github.io’。例如：我的账号名是helloRestlessMan，仓库名就是 helloRestlessMan.github.io

#### 3.部署代码到Github

在我们创建的博客的目录找到 _site 目录，将 _site 目录下的所有文件都提交到Github上。

![1570806513654](C:\Users\ADMINI~1\AppData\Local\Temp\1570806513654.png)

操作步骤：

```bash
git clone https://github.com/helloRestlessMan/helloRestlessMan.github.io.git  #克隆远程代码到本地
拷贝_site 文件到 helloRestlessMan.github.io   
cd helloRestlessMan.github.io 
git add .   #git 命令添加所有文件
git commit -m "创建 Jekyll 个人博客"   #git 提交文件
git push    #git 推送代码到远程
```

#### 4.部署代码到码云（Gitee）

创建与账号名相同的仓库，如下图：

![1570885792467](C:\Users\ADMINI~1\AppData\Local\Temp\1570885792467.png)

提交代码到 Gitee 上，再开启  Gitee Pages 服务即可。

![1570885853725](C:\Users\ADMINI~1\AppData\Local\Temp\1570885853725.png)

最后就可以访问了。<http://huaairen.gitee.io/> 

#### 5.访问自己的博客网站

效果如下图：

![1570806814739](C:\Users\ADMINI~1\AppData\Local\Temp\1570806814739.png)

#### 6.切换主题

我这里下载的主题是 mundana-jekyll-theme

主题下载地址：<http://jekyllthemes.org/themes/mundana-jekyll-theme/> 

注：可能存在兼容性问题

```bash
cd mundana-jekyll-theme
bundle install    #安装依赖
bundle exec jekyll serve   #运行项目
```

我的博客地址：<https://hellorestlessman.github.io/> 

项目运行效果：

![1570813605749](C:\Users\ADMINI~1\AppData\Local\Temp\1570813605749.png)

## 丰富的主题自由选择

这里推荐两款 Jekyll 主题的网站：

1.官方主题网站：<http://jekyllthemes.org/> 

2.Github 上他人的博客模板：<https://github.com/jekyll/jekyll/wiki/Sites> 

### 参考资料

1.使用 github + jekyll 搭建个人博客 https://www.cnblogs.com/wangfupeng1988/p/5702324.html

2.Github+Jekyll 搭建个人博客 <https://blog.csdn.net/White_Idiot/article/details/69397224> 

3.Jekyll主题收藏 <https://blog.csdn.net/garfielder007/article/details/82875394> 

4.Gitee + Jekyll 搭建博客 <https://gitee.com/ckjcode/ckjcode> 



