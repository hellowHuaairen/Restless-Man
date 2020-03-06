# 万能抓包工具 Fiddler

## 一、Fiddler 简介
> Fiddler 是一个使用 C# 编写的 http 抓包工具。它使用灵活，功能强大，支持众多的 http 调试任务，是 web、移动应用的开发调试利器。

我很早之前的一篇文章 [Fiddler抓取数据，20行代码赚500块](https://mp.weixin.qq.com/s?__biz=MzI0MDM3NDMxNQ==&mid=2247484270&idx=1&sn=f6effec570b831fc449a85cfa0400659&chksm=e91a842ade6d0d3cbe089d6cff0f1823818f96faf276084b87ce7db079f71fb76e4de88fdf28&token=571222747&lang=zh_CN#rd)，凑巧帮那位朋友解决了他的需求。隔了这么久又有人找我抓公众号数据。今天就分享一下我是如何使用 Fiddler 工具的。

## 二、实战

### 2.1 工具安装
**Fiddler下载地址** ：https://www.telerik.com/fiddler
访问链接，进入网站首页，如下图
![](https://imgkr.cn-bj.ufileos.com/ee6cd6a7-c4ab-444e-ab7b-ee2b6444196f.png)

点击下载，然后会跳到一个问卷页面，填写信息可以下载了。双击下载好的安装程序，点击“下一步”就可安装。

### 2.2 PC 端请求抓取

**查看请求**
打开 `Fiddler` 工具，显示效果如下图：
![](https://imgkr.cn-bj.ufileos.com/b01333af-ef7f-4777-b88e-1c0541314cea.png)

**两个设置**

1. 打开 `fiddler`，点击工具菜单`Tools->optins..->HTTPS` 页签，修改如下内容：
<img src="https://imgkr.cn-bj.ufileos.com/84b2a2ce-a591-40e1-9fad-faf9a8db2e0e.png" style="width:70%"/>
这里主要勾选 `Decrypt HTTPS traffic`这个选项，并选择 `...from all processes` 即可。并点击右侧的 `Actions`，导出证书到桌面。
<img src="https://imgkr.cn-bj.ufileos.com/5ac70b3b-8ffe-4c83-a3d1-3a2a0bb91932.png" style="width:50%"/>

2. 打开浏览器 `Internet 选项->连接->局域网设置`，弹出如下页面，这里主要添加一下本地代理的IP地址和端口。
<img src="https://imgkr.cn-bj.ufileos.com/0431feff-4ba2-4118-9351-f7b0a566a207.png" style="width:50%"/>
注：windows 好像不需要这一步设置。

**过滤请求**
选中 `Fiddler` 中一条记录，右键 `Filter Now`，然后选择 `Hide 'xxx'`即可进行过滤。
![](https://imgkr.cn-bj.ufileos.com/d89deeda-5f93-4b16-b606-d031b99bb212.png)

如下图右键过滤的请求，就可以自动取消过滤。
![](https://imgkr.cn-bj.ufileos.com/31f96684-2625-408c-acb0-bfc823cbef93.png)

### 2.3 手机客户端请求抓取

**fiddler 配置**
打开 `fiddler`，点击工具菜单`Tools->optins..->Connections` 页签，勾选 `Allow remote computers to conect` 即可，意思是允许接收来自远程客户端的连接。
<img src="https://imgkr.cn-bj.ufileos.com/28eca237-ef9b-4982-aeb3-09da8552b1e2.png" style="width:70%"/>

**手机配置**
1. 查看服务IP地址
在`cmd` 窗口输入 `ipconfig /all` 查看网络信息，获取当前电脑的IP地址，如下图：
<img src="https://imgkr.cn-bj.ufileos.com/82c8cc8c-95a5-4272-8513-0b8e163ca54f.png" style="width:70%"/>

2. 安装证书
在手机浏览器访问 192.168.1.105:8888，手机上下载 `Fiddler` 证书，如下图：
![](https://imgkr.cn-bj.ufileos.com/c5beab13-feb5-4943-8e0c-91de96f4841d.jpg)
苹果手机信任证书，`设置->通用->描述文件`中，选中证书，添加信任即可。

3. `wifi` 配置代理
打开手机 `wifi` 设置，进入配置代理，这里主要添加 `服务器`、`端口`这两个信息，点击保存即可。如下图
<img src="https://imgkr.cn-bj.ufileos.com/fac7860f-0c58-4047-bb2d-2c475f862900.jpg" style="width:50%"/>
注意：
- 确保手机和电脑是在同一个局域网，服务器即是运行 `Fiddler` 工具的那台电脑的IP地址。
- 端口是上面设置 `Fiddler`工具，`Tools->optins..->Connections` 页签中可看到，默认值为`8888`。

**数据抓取**
在手机上做任何操作，电脑端的 `Fiddler`都显示对应操作的请求，如下图：
![](https://imgkr.cn-bj.ufileos.com/70a2e9d3-ad17-4f0d-9cb9-66d7083aa499.png)

### 2.4  Fiddler 自定义规则
上面哪些配置都是基础，接下来才是重头戏。`Fiddler`的强大之处在于，它可以修改请求参数，响应数据，根据需要自定义规则。`OnBeforeRequest` 和 `OnBeforeResponse` 最常用的两个方法。点击`Fiddler` 菜单 `Rules->Customize Rules...`就可以打开脚本工具了，这里的脚本支持常用的 `js` 语法。

**OnBeforeRequest**

意思是在请求之前可以做的事情。这里实现的功能是将网站请求头信息写入本地文件。代码如下：
```javascript
if (oSession.uriContains("mobile/wx/product/"))
  { 
    var fso;  
    var file;
    fileName = fileName + "_" + ucp;
    fileName = fileName.replace(/\*/g,"");
    var filePath="C:\\mntListen\\" + fileName  + ".txt";
    fso = new ActiveXObject("Scripting.FileSystemObject");
    file = fso.OpenTextFile(filePath,2 ,true, false);
    file.writeLine(" " + oSession.oRequest.headers);
    file.close();
 }
```
注：磁盘对应位置如果没有文件路径，需要提交手动创建。

**OnBeforeResponse**

意思是在报文响应前可以做的事情。这里我的需求是对网站过滤，修改它的响应报文。
```javascript
if (oSession.uriContains("mobile/wx/detail/v2"))        
{ 
    var body = oSession.GetResponseBodyAsString();
    body = body.replace(/INVALID/g,"VALID");
    body = body.replace(/title/g,"title1");
    body = body.replace(/name/g,"title");
    oSession.utilSetResponseBody(body);
    file.close();
}
```
上面的这段代码的意思是，当响应 url 链接包含 `mobile/wx/detail/v2`，进行内容替换。

**查看 Fiddler 手册**
打开 `Fiddler` 工具，右侧有常用对象的使用方法，可快速查阅。
![](https://imgkr.cn-bj.ufileos.com/5cc47e4f-f307-4397-b12b-f8dc48266ffa.png)

## 三、最后
花了差不多两天时间，终于帮那位朋友解决了他的问题，还是挺有成就感的！中间也有想放弃的时候，最终和朋友的多次沟通，彻底理解需求后，才大功告成。最后我得出一个结论:在做项目开发时，首先需要理解客户需求，才能针对需求寻找解决方案。如果你也在使用 `Fiddler` 工具的遇到问题，我们一起讨论哈！

## 参考
- fiddler抓包详解 ：https://www.jianshu.com/p/1c57d8d1ad99



