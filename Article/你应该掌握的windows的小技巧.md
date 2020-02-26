你应该掌握的windows小技巧

[TOC]

小科技无处不在！每当看到一款新奇好玩的东西，你一定会感到兴奋。前两天看到一则抖音，讲微信客户端多开的小技巧，确实挺有用的！文章最后是微信多开的操作。单纯的分享微信多开小技巧不是我的风格，于是联想到前年做过一个需求，通过bash命令（linux下的脚本语言）操作数据库，今天我通过（windows）bat命令实现那个需求的简化版。

### bat命令操作数据库

####主要功能

   1. 从命令行获取传入参数

   2. 读取xml配置文件，解析数据库连接信息

   3. 连接数据库，执行sql语句（数据库为mysql）

   4. 将执行的结果输入到文件

#### 逐步拆解

   1. 从命令行获取传入参数：

      在cmd命令行执行：params.bat 1 2 3；

      代码如下：

      ```
      @echo off
      set id=%1
      set name=%2%
      set age=%3
      echo %1 %2 %3
      echo %id% %name% %age%
      Pause
      ```

   2. 读取配置文件propreties.txt，解析数据库连接信息

      配置文件内容：

      ```
      ip:192.168.22.66
      username:wangzg
      passwd:123456
      ```

​      bat文件内容：

  ```
  setlocal enabledelayedexpansion
  set /a ip=a
  set /a username=b
  set /a passwd=c
  for /f "tokens=1-2 delims=:" %%i in (propreties.txt) do (
  set BL1=%%i
  set BL2=%%j
  if "ip"=="!BL1!" (set ip=%%j)
  if "username"=="!BL1!" (set username=%%j)
  if "passwd"=="!BL1!" (set passwd=%%j)
   )
  echo %ip% %username% %passwd%
  ```
   3. 连接数据库，执行sql语句（这里以mysql为例）

      ```
      mysql -uroot -p123456 -h localhost efo -e   " select * from category "
      #mysql -uroot -proot -h localhost xxx库 -e " select * from xxx表 " >> 1.txt
      ```

   4. 将执行的结果输入到文件

      run.bat >> 1.txt 将所有执行信息输出到1.txt中

      ```
      mysql -uroot -proot -h localhost xxx库 -e " select * from xxx表 " >> 1.txt
      ```

      

5. 完整代码

```
@echo off
setlocal enabledelayedexpansion
set id=%1
set name=%2%
set age=%3
echo %1 %2 %3
echo %id% %name% %age%
set /a ip=a
set /a username=b
set /a passwd=c
for /f "tokens=1-2 delims=:" %%i in (propreties.txt) do (
set BL1=%%i
set BL2=%%j
if "ip"=="!BL1!" (set ip=%%j)
if "username"=="!BL1!" (set username=%%j)
if "passwd"=="!BL1!" (set passwd=%%j)
 )
echo %ip% %username% %passwd%
mysql -u%username% -p%passwd% -h %ip% efo -e   " insert person (id,name,age) value (%id%,'%name%',%age%) ">>out.txt
Pause
```

### 结语

当时的我还是满脸的绿色（菜鸟），作为Java搬砖工，写写增删查改我绝对没问题，但让我撸bash(Linux)脚本语言，确实让我很头大。几乎每一行代码都是自己百度查找，并询问大佬的具体用法。20天终于将需求交付了，并得到领导的好评。这件事给我启发很大，做任何事，永远不要给自己设防，因为你的潜力是无限的！遇到困难不是退缩，而是奋勇直前，踏过了心中的那道恐惧，你就变得更加强大！

### 微信客户端多开

1.复制微信的安装路径：

![](http://tva1.sinaimg.cn/large/0060lm7Tly1g3unggbs25j30ag0dadgn.jpg)

2.新建一个webchat.txt文件

文件内容：（这里我默认打开两个客户端）

```
start "" "C:\Program Files (x86)\Tencent\WeChat\WeChat.exe"
start "" "C:\Program Files (x86)\Tencent\WeChat\WeChat.exe"
```

3.将webchat.txt文件的扩展名修改为.bat

4.双击webchat.bat文件即可弹出多个微信登录页面

![](http://tva1.sinaimg.cn/large/0060lm7Tly1g3ungg1ut4j30fo0b4t8u.jpg)

