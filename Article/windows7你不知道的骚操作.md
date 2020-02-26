一直在用windows，但是这些技巧你可能还没用过

每次复制文件时，都需要手动修改文件名，在文件名称上添加作者；有时我们想将一个目录下同一种格式的文件，文件名改成有规则的名字，我之前也一个一个改过，确实很费劲。今天就解决这两件事情。

## 自定义window下复制文件的命名规则

1. 按Win+R打开运行，输入regedit回车打开注册表编辑器

2. 修改注册表

   1. 找到位置：HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer 

   2. 修改复制文件的命名规则

      查看目录是否有NamingTemplates一项，没有NamingTemplates，新建名称为NamingTemplates的目录。在目录NamingTemplates项右侧新建名为CopyNameTemplate的字符串值，然后对NamingTemplates值进行修改就可以得到自己想要的规则了 。我修改的命名规则是%s-wangzg（注：%s意思是原文件名，-wangzg是我自定义的内容）

![](https://img1.yantuz.cn/upload/2019/06/5d14eb64c804a.png)

3. 查看效果

   ![](https://img1.yantuz.cn/upload/2019/06/5d14eb64cf565.png)

​      那么问题来了，我将文件复制了两次，第二次的文件后面会添加“(2)”这个玩意。我只想保留数字，不要括号，这样能搞定吗？那接着往下看。

4. 批量去除文件中包含的“()”括号

   创建bat脚本，内容如下：

   ```bash
   @Echo Off&SetLocal ENABLEDELAYEDEXPANSION
   
   FOR %%a in (*) do (
   	set "name=%%a"
   	set "name=!name: (=!"
   	set "name=!name:)=!"
   	ren "%%a" "!name!"
   
   )
   ```

   最终的效果是这样的：

   ![](https://img1.yantuz.cn/upload/2019/06/5d14ece88fa83.png)

## 批量修改同类型文件的文件名

1. bat重命名文件

   （注：支持中文需添加代码：chcp 65001）

   ```bash
   @echo off
   REM 声明采用UTF-8编码
   chcp 65001
   ren 新建文本文档-wangzg.txt java开发资料.doc
   ```

2. 批量修改文件名实例

   循环重命名一个文件夹下的所有结尾为xls的文件，前加上wangzg_

   ```bash
   for /f %%i in ('dir /b *.xls') do (ren %%i wangzg_%%i)
   ```

3. 批量修改文件名

   有时我们需要批量修改某种格式下的所有文件，命名按照一定规则。例如：A_000x.jpg

   ```bash
   @echo off 
   rem 启用"延缓环境变量扩充" 
   setlocal EnableDelayedExpansion 
   set a=1 
   rem 循环当前目录下所有图片的文件名，支持带空格的名称 
   for /f "delims=" %%i in ('dir /b *.jpg') do ( 
   rem 如果没有相同的文件名，则继续 
   if not "%%~ni"=="%~n0" ( 
   if !a! LSS 10 (ren "%%i" "A_000!a!.jpg") else ren "%%i" "A_!a!.jpg" 
   rem 设置数值型变量a=a+1 
   set /a a+=1 
   ) 
   ) 
   echo 批量重命名完成！ 
   pause
   ```

   最终效果：

   ![](https://img1.yantuz.cn/upload/2019/06/5d14f26f55606.png)

## 结语

成年人的学习是事件驱动学习。而每个人或多或少都有惰性，但是惰性也是我们进步的动力！避免重复的工作，提高工作效率而寻找工具，就是在抵抗惰性。拒绝穷忙，变蛮干为巧干！

bat命令下载地址：https://pan.baidu.com/s/18RwCz_Tzlfwk1qdWQupPiw 
提取码：qa68 