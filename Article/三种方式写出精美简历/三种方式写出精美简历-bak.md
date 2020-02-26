金三银四即将到来，你是否已准备好找工作？专业技能的复习和梳理是少不了的；个人简历当然也是必不可少的，一份精美的简历能让你大大增加面试机会。你是怎样写简历？还在诟病简历一眼看去没有出彩的地方？你还在使用 `Word` 写简历吗？这种方式早已 **Out**了。假如你用的微软 Office 写的简历，人家用的  `WPS` 打开你的简历，格式肯定会错乱。而且很多`Word` 版炫酷样式的简历模板都是收费的。懂一点技术的我们应该通过技术手段写一份免费又精美的简历。简历格式最好是 `pdf` ，不管通过什么工具打开都不会出现格式错乱的问题。

为了让大家不输在面试的起跑线上，为了凸显个人专业技能的特点，为了让面试官眼前一亮。我筛选出最优的三种方式写简历，希望能帮到大家。三种方式如下：

- 写静态 `Html` 代码生成个人简历
-   `Markdown` 写个人简历
- 前端项目写个人简历

适应人群：需要写个人简历的各类人员。





[TOC]

## 文章内容

## 一、三种方式写简历

### 1.静态 `Html` 代码生成简历

#### 1.1准备工作

- 安装  `Python` 开发环境，主要是通过 python 命令将 html 页面转为 pdf 文件。
- 安装  `wkhtmltopdf`  和 `pdfkit` ， html 页面转为 pdf 文件所依赖的插件。
- 掌握 Git 基本指令：克隆代码（git clone），更新代码（git pull），添加代码（git add），提交代码（git push）。
- 掌握 `html`、`css`基本语法，掌握 `html`常用标签的含义。
- 掌握 `Html` 开发工具 `NotePad++`、`VSCode` 。

#### 1.2写简历 `在西安完善这段内容`

**安装 `Python` 开发环境**

[Python下载地址](  https://www.python.org/downloads/release/python-366/  )，本机本机操作系统（32位/64位）下载对应的版本。这里我下载的版本是 `3.6.6` 。

安装程序下载好，点击 `next` 就可以安装成功。

使用快捷键 `Win +R` 打开命令行窗口，输入：`python -v`，如下图表示 `Python` 安装成功。 

 添加截图，

**安装 `wkhtmltopdf`  和 `pdfkit` 插件**

[wkhtmltopdf下载地址]( https://wkhtmltopdf.org/downloads.html )，点击 `next` 直接安装即可。 安装完成后把bin目录中的可执行 `wkhtmltopdf.exe`文件放在模版目录下,例如：`awesome-resume\free` 。

使用快捷键 `Win +R` 打开命令行窗口，在命令执行如下命令，安装 `pdfkit` 插件

```
pip install pdfkit  (or pip3 for python3)
```

**下载项目**

使用下面命令，将项目下载到本地：

```bash
cd D:\projects    #切换到本地目录
git clone https://github.com/resumejob/awesome-resume/   #下载项目
```

**填充内容**

根据个人的喜好，可以通过文本编辑器 `NodePad++` 或者开发工具 `VSCode` 修改 `Html` 页面。

打开 `awesome-resume\free\free_resume.html`  文件，这个文件就是我们要写的简历。

阅读源码可知，找到下面对应区域就可修改相应的内容：

```html
<!-- base-info指基础信息，包括头像，姓名，邮箱，电话，链接等  -->
<!-- 个人简介部分 -->
<!-- 技能列表部分 -->
<!-- 工作经历部分 -->
<!-- 教育经历部分 -->
<!-- 志愿者工作部分 -->
```

根据自己的需要可以对页面的元素进行增删操作。此项目 `README.md` 文件包含了很多写简历常用的例句，我们可以借鉴一下。

**关键内容高亮**

简历主要是对自己的简单介绍，当别人第一眼看到你的简历，就能通过一些高亮内容所吸引，然后继续阅读你的简历。所以不管你没有经验，又或者经验特别丰富，简历需要高亮你的一些技术专长，工作亮点等。

高亮关键内容使用 `<b></b>` 标签。

**添加小图标**

[小图标网址]( https://fontawesome.com/icons )，根据自己的需求可自定义页面的图标。打开小图标网站，选中你需要的图标：

<img src="..\三种方式写出精美简历\images\github.png" style="zoom:80%;" />

使用如下代码添加到你需要的位置：

```html
<i class="fab fa-github"></i>
```

**样式调整**

一般写样式有两种方式：内联样式，外部样式。

内联样式即直接在 `html` 元素上添加样式，例如：

```html
#复制之前的代码块
```

外部样式创建样式文件，定义样式，在需要的 `html`页面引用，例如：

`my.css`文件

```css
#复制之前的代码块
```

`free.html`文件内容

```html
#复制之前的代码块
```

**生成 `Pdf` 文件**

执行如下命令，即可将 `html` 转化为 `pdf`文件。 ` Javascript` 可以使用 [pdfkit](https://github.com/devongovett/pdfkit) 

```bash
cd D:\projects\awesome-resume
python3 convert.py  #html 格式转为 pdf 
```

#### 1.3简历效果

贴上生成简历的截图，并附上我修改简历的个人模板内容链接。

### 2`Markdown` 内容生成简历

#### 2.1准备工作

- 掌握 Git 基本指令：克隆代码（git clone），更新代码（git pull），添加代码（git add），提交代码（git push）。
- 掌握 `Markdown` 基本语法。标题，加粗，段落
- 掌握 `html`、`css`基本语法，因为 `Markdown`编辑器支持 `html`内容。

#### 2.2写简历

**部署开源项目**

本项目是静态项目，所以直接将项目源码托管到 Github、Gitee、Coding 等代码托管平台就行。本片以 `Gitee` 为例导入 Github 开源项目。

1.基于 `DeerResume` 创建自己的项目，选择“从 Github/GitLab 导入仓库”。

<img src="C:\Users\Administrator\Desktop\wangzg\三种方式写出精美简历\images\xinjianxiangmu.png" style="zoom:75%;" />

**掌握 `Markdown` 基本语法**

2.导入 `Github` 开源项目，填写 “Git 仓库 URL”，修改 “仓库名称”，最后点击 “导入”，稍等一会即可导入项目。

![daoruxiangmu](..\三种方式写出精美简历\images\daoruxiangmu.png)

3.部署项目，打开项目详情页面，选择“服务”->“Gitee Pages”，最后点击“启动”，即可部署静态项目到 `Gitee` 上。

![bushuxiangmu](..\三种方式写出精美简历\images\bushuxiangmu.png)

部署成功如下图：

![bushuchenggong](..\三种方式写出精美简历\images\bushuchenggong.png)

直接访问上面生成的“网站地址”，就可以进入简历在线编辑器了。 

**`Markdown`基本语法**

```
1.标题，使用 # 可代表 1-6 标题。例如：### 表示三级标题。
2.内容强调，在强调内容两侧分别加上*或者_。例如：*斜体*，_斜体_  表示斜体；**加粗**，__加粗__  表示内容加粗。
3.使用·、+、或-标记无序列表。
4.图片链接，例如：![](图片url)。
5.代码块，以“```”括起来的内容。
6.区间引用，在段落的每行或者只在第一行使用符号 > 。
```

**线写简历**

[简历参考模板]( https://github.com/geekcompany/ResumeSample )，这些模板包括 Java、C、Php、Android、Web 等。访问 [冷熊简历]( http://cv.ftqq.com/ )，首页效果如下图：

![lengxiong](..\三种方式写出精美简历\images\lengxiong.png)

**生成简历**



**本地写简历**

使用`markdown`工具 Typora写简历后直接导出为pdf。注：我是用的版本：version 0.9.78(beta) 

#### 2.3简历效果

贴上生成简历的截图，markdown文档添加个人图像，参考文章： https://blog.csdn.net/mo_xiaojiang/article/details/79515657 

### 3.前端项目生成简历 

#### 3.1准备工作

- 掌握  Git 基本指令：克隆代码（git clone），更新代码（git pull），添加代码（git add），提交代码（git push）。
- 掌握 `html`、`css`基本语法，掌握 `html`常用标签的含义。

#### 3.2写简历

**下载项目**

使用下面命令，将项目下载到本地：

```bash
cd D:\projects    #切换到本地目录
git clone https://github.com/Ovilia/cv    #下载项目
```

也可以参考开源项目： https://github.com/wannaxiao/vuepress-theme-resume 

**本地运行项目**



**修改内容**



**导出简历**



#### 3.3简历效果

贴上生成简历的截图



## 二、总结





