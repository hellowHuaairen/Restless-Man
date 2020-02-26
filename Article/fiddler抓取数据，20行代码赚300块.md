Fiddler抓取数据，20行代码赚500块

最近接到一个小单子，这位朋友是看到我在CSDN写过一遍“Fiddler抓取微信公众号数据”的博客， 他也想抓取公众号的数据。那篇博客主要为了帮我媳妇抓取公众用户数据（姓名，联系方式，地址）。有兴趣的朋友可阅读一下。我利用空闲时间帮助这位朋友完成了他需要的功能。最终20行代码赚了500块。

Fiddler抓取微信公众号数据文章地址：<https://blog.csdn.net/huaairen/article/details/79243760> 

## Fiddler工具简介

Fiddler是一个用于HTTP调试的代理服务器应用程序。Fiddler能捕获HTTP和HTTPS流量，并将其记录下来供用户查看。它通过使用自签名证书实现中间人攻击来进行日志记录。

![](https://img1.yantuz.cn/upload/2019/06/5d0506e3caf05.png)

## 需求描述

抓取公众号访问请求连接，并显示用户信息，将抓取到的信息记录到文本文件。要支持PC端和手机端的抓取请求数据。

## 实现步骤

#### 1.安装配置Fiddler

   下载地址：https://pan.baidu.com/s/1XuOLUTvRaM_YtMW9t4FlfQ 提取码: wxgk 

1. 安装Fiddler_5.0.20173.49666_Setup.exe，很简单，打开效果如下图： 

![](https://img-blog.csdn.net/20180202223944047?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvaHVhYWlyZW4=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

2. 生成证书文件FiddlerRoot.cer

 在菜单栏中依次选择 【Tools】->【Options】->【HTTPS】，勾上如下图的选项 

![](https://img-blog.csdn.net/20180202224339587?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvaHVhYWlyZW4=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

 然后点击【Actions】选择导出证书到桌面 

![](https://img-blog.csdn.net/20180202224501713?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvaHVhYWlyZW4=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

注：若导出整数失败，下载证书生成工具fiddlercertmaker.exe即可。

下载链接：https://pan.baidu.com/s/1VJmm8bAqKaxfetEQBlXT9Q  提取码：8ouz

### 2.编写Fiddler代码

在Fiddler主界面，选择菜单【rules 】--- >【customs rules】选项，然后重启一下进入到如图所示的界面 

![](https://img-blog.csdn.net/20180202230047407?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvaHVhYWlyZW4=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

在OnBeforeResponse方法中添加如下代码：

```
if(oSession.url.Contains("lhloyalty.otype.com/?"))
		{
			oSession.utilDecodeResponse();
			var fso;
			var file;
			fso=new ActiveXObject("Scripting.FileSystemObject");

			file=fso.OpenTextFile("d:\\Response.txt",8,true,true);
			if(oSession.url.IndexOf('&timestamp') > -1){
				file.writeLine("https://" + oSession.url.Substring(0,oSession.url.IndexOf('&timestamp')));
			}
			if(oSession.url.IndexOf('getUserPointList') > -1){
				var result = oSession.GetResponseBodyAsString();
				var startIndex = result.indexOf('userName');
				var lastIndex = result.indexOf('userPoint');
				var hanzi = result.substring(startIndex+11, lastIndex -3);
				file.writeLine("用户名称: " + unescape(hanzi.replace(/\\/g, "%")));
				file.writeLine("==========================================================================================================");
	
			}
			file.close();
		}
```

### 3.实现手机远程访问

Fiddler对app进行抓包的配置可参考下面这篇文章，我这里就不啰嗦了！

<https://jingyan.baidu.com/article/4dc40848617b1dc8d846f16d.html?from=singlemessage&isappinstalled=0> 

### 4.结果展示

![](https://img1.yantuz.cn/upload/2019/06/5d050fbd0dc36.png)

## 结语

前段时间通过朋友的介绍我终于开窍了，趁着“年轻”多交一些智商税！我加入了很多付费圈子，听到一个很好的观点“复利”。商业中这个观点体现的淋漓尽致，花一份时间完成的产品，可以卖给千百万个用户，这就实现了复利。我写文章亦是如此，记录总结日常点滴。如果有朋友遇到类似的情况，就可以直接参考了。如果这篇文章帮助到更多的朋友，那么这篇文章就产生了更大的价值，这就是复利。每一个人的时间都是有限的，俗话说8小时内求生存，8小时外求发展；有效的利用自己的时间，让你的时间产生复利效应，你距离实现财务自由也就不远了!

