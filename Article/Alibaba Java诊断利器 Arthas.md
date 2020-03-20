

## 一、简介
`Arthas` 是 `Alibaba` 开源的 `Java` 诊断工具，它帮助 `Java` 程序员解决很多问题。作为一个 `Java` 开发人员，你是不是也遇到过下面的问题，让人束手无策！

- 这个类是在哪个 jar 包？为什么会我本地测试都正常，生产环境上却报各种 Exception？
- 我改的代码为什么没生效？难道我没有 commit 代码，分支搞错了？又或者是缓存的原因？
- 遇到线上问题无法 debug ？难道只能通过添加日志分析问题？这样定位线上问题确实很费劲。
- 线上遇到某个数据处理有问题，备份数据到本地，却无法重现！

> `Arthas` 提供了一个全局视角来查看系统的运行状况，可以监控到JVM的实时运行状态，可以快速定位应用的热点，生成火焰图。Arthas支持JDK 6+，支持Linux/Mac/Winodws，采用命令行交互模式，同时提供丰富的 Tab 自动补全功能，进一步方便进行问题的定位和诊断。

## 二、使用
### 2.1 运行 `arthas`

 **下载**
 
 这里下载 `arthas-3.xx-bin.zip` 安装包，本地解压后，上传服务器即可。文件夹包含下列文件：
 ```
+ arthas-3.1.6-bin
│  arthas-agent.jar
│  arthas-boot.jar
│  arthas-client.jar
│  arthas-core.jar
│  arthas-demo.jar
│  arthas-spy.jar
│  as-service.bat
│  as.bat
│  as.sh
│  install-local.sh
└─async-profiler
        libasyncProfiler-linux-x64.so
        libasyncProfiler-mac-x64.so
 ```
 下载地址：https://github.com/alibaba/arthas/releases
 
 **运行**
 
 运行 `arthas` 有两种方式：
 1. 运行 `bash` 文件
 ```bash
 chmod +x as.sh
 ./as.sh
 ```
 2.运行 `jar` 包
 ```bash
 java -jar arthas-boot.jar  #启动`arthas`
 java -jar arthas-boot.jar -h #查看帮助文档
 ```
 运行效果如下图：
 ![](https://imgkr.cn-bj.ufileos.com/920c0d69-5dc3-440f-88b1-94e4abd7c1c7.png)


### 2.2 快速入门
#### 2.2.1 入门
通过上面的命令，我们已经启动了 `arthas`，那我们通过下面的几个命令快速领略一下他的风采吧！
1. 查看数据面板 `dashboard`
输入dashboard，按回车/enter，会展示当前进程的信息，按ctrl+c可以中断执行。
![](https://imgkr.cn-bj.ufileos.com/8814f2c5-27ac-4e74-8867-36b63f917f1f.png)


2. 查看进程 `thread` 命令
从上面的图片可以看出，有个线程id为1，我们执行 `thread 1 | grep 'main'` 可查看线程的堆栈信息。
![](https://imgkr.cn-bj.ufileos.com/887efdde-e470-4afd-92f2-247a084af11d.png)

3. 反编译 `jad` 命令
我们看到有个叫 `demo.MathGame` 的类，那我们就来看下它的源码，执行 `jad demo.MathGame`,内容如下：
![](https://imgkr.cn-bj.ufileos.com/6f2841cb-cc6a-4c75-8c36-3d4468ffaa46.png)

4. 监控命令 `watch`
通过 `jad` 命令我们反编译了代码，那么我们监控一下 `primeFactors` 方法的返回值的情况，执行 `watch demo.MathGame primeFactors returnObj`，如下图：
![](https://imgkr.cn-bj.ufileos.com/20a138a3-fb16-488b-9b13-80f29eb63e3d.png)

5. 退出
使用 `quit` 或者`exit`命令就可以退出。Attach 到目标进程上的 arthas 还会继续运行，端口会保持开放，下次连接时可以直接连接上。如果想完全退出 arthas，可以执行stop命令。

#### 2.2.2 进阶

这里我大概列举了一下jvm相关的常用功能。
```
sc -d demo.MathGame #打印类的详细信息
sc -d -f demo.MathGame #打印出类的Field信息
sm -d java.lang.String toString #展示每个方法的详细信息
jad demo.MathGame main #反编译指定函数
jad org.apache.log4j.Logger #多个 ClassLoader 都加载了这个类时，反编译时需指定ClassLoader
mc -d /tmp/output /tmp/ClassA.java /tmp/ClassB.java #编译.java文件生成.class到指定目录
redefine /tmp/Test.class #加载外部的.class文件
dump java.lang.String #加载类的 bytecode 到特定目录
classloader l/t/a #查看classloader的继承树，urls，类加载信息
trace demo.MathGame run #方法内部调用路径，并输出方法路径上的每个节点上耗时
stack demo.MathGame primeFactors #输出当前方法被调用的调用路径
tt -t demo.MathGame primeFactors #记录下指定方法每次调用的入参和返回信息，并对不同的时间下调用观测
profiler start/getSamples/status #使用async-profiler对应用采样，生成火焰图
options json-format #查看或设置Arthas全局开关
```
更多内容阅读官方文档，有详细说明。

**arthas** 也支持常用的 `Linux` 命令：
- help: 查看命令帮助信息
- cat: 打印文件内容，和linux里的cat命令类似
- grep: 匹配查找，和linux里的grep命令类似
- tee: 复制标准输入到标准输出和指定的文件，和linux里的tee命令类似
- pwd: 返回当前的工作目录，和linux命令类似
- cls: 清空当前屏幕区域
- session: 查看当前会话的信息
- reset: 重置增强类，将被 Arthas 增强过的类全部还原，Arthas 服务端关闭时会重置所有增强过的类
- version: 输出当前目标 Java 进程所加载的 Arthas 版本号
- history: 打印命令历史
- quit: 退出当前 Arthas 客户端，其他 Arthas 客户端不受影响
- stop: 关闭 Arthas 服务端，所有 Arthas 客户端全部退出
- keymap: Arthas 快捷键列表及自定义快捷键



### 2.3常见问题
1. Linux 环境无法启动 `Arthas`
确保服务器已安装 `Jdk` ,因为`Arthas`工具依赖 `Jdk`。
2. Error: telnet is not installed. Try to use java -jar arthas-boot.jar
由于没有安装 telnet，所以无法运行 as.sh，使用 `yum install telnet` 安装即可。

## 三、最后
工具特别强大，如果你也正在被生产环境的一些问题所困扰，不妨使用一下 `Arthas`。最后的最后，我给大家提供一张快速掌握 `Arthas` 的脑图，需要的话在我公众号后台回复 `Arthas`，即可获取。

## 参考文档

- 官方文档：https://alibaba.github.io/arthas/
- Arthas Java 线上问题定位：https://cloud.tencent.com/developer/article/1534894
