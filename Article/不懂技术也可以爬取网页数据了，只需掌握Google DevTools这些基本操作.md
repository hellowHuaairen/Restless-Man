不懂技术也可以爬取网页数据了，只要掌握Google DevTools的使用

## 概述

Chrome开发者工具（简称DevTools）是一组网页制作和调试的工具，内嵌于Google Chrome浏览器中。DevTools使开发者更加深入的了解浏览器内部以及他们编写的应用。通过使用DevTools，可以更加高效的定位页面布局问题，设置JavaScript断点并且更好的理解代码优化。

## 访问 DevTools

访问DevTools，首先用Chrome打开一个web页面或web 应用，也可以通过下面的方式：

- 在浏览器窗口的右上方选择Chrome菜单, 然后选择工具 > 开发者工具。
- 在页面上任意元素上右键，然后选择审查元素。

DevTools窗口会在Chrome浏览器的底部打开。

也可使用快捷键来快速的打开DevTools:

- 使用 `Ctrl` + `Shift` + `I` 
- F12

![](https://ae01.alicdn.com/kf/HTB1XV3OeEGF3KVjSZFo762mpFXak.png)

*DevTools现已经支持内置颜色选择器..*

DevTools目前主要包括以下八个主要功能组：

- Elements
- Resources
- Network
- Sources
- Timeline
- Profiles
- Audits
- Console

你可以通过 `Ctrl`+`[` 和 `Ctrl`+`]` 快捷键在不同面板之间进行切换。

## 使用Console

JavaScript 控制台主要为开发者在测试web页面和应用的过程中提供两方面的功能：

- 在开发过程中，记录代码诊断信息。
- 作为shell提示窗口用来和页面文档以及DevTools进行交互。

你可以利用Console API提供的方法来记录诊断信息，例如`console.log()`或`console.profile()`。

你可以利用命令行API提供的方法直接在控制台中计算表达式。例如，利用`$()`选择元素或者调用`profile()`来启动CPU性能监控。

![](https://ae01.alicdn.com/kf/HTB1wV3OewmH3KVjSZKz7622OXXaH.png)

## 调试 JavaScript

随着JavaScript程序复杂度的增加，开发者需要更加强大的debug工具来快速的发现问题并高效的修复。DevTools包含了一系列有用的工具让调试javaScript变得更加轻松。

![](https://ae01.alicdn.com/kf/HTB1xOQSeCWD3KVjSZSg763CxVXah.png)

## 提高网络性能

在网络面板中可以看到网络请求资源的实时信息。明确和定位那些比预期更加耗时的请求是优化web页面的关键步骤。

![](https://ae01.alicdn.com/kf/HTB16KcVeBCw3KVjSZFl763JkFXaa.png)

## 监听

监听面板会在页面加载的时候对其进行分析，然后提供优化和建议来降低页面加载时间，并提提高响应灵敏性。进一步查看，我们推荐使用PageSpeed Insights。

![](https://ae01.alicdn.com/kf/HTB1ibQVeBKw3KVjSZFO761rDVXai.png)

## 提高渲染性能

在Timeline面板中，你可以从整体上看到在web页面加载和被使用的过程中时间消耗在哪里了。所有的时间，从加载资源到解析JavaScript,计算样式和重绘都会被标记在时间线上。

![](https://ae01.alicdn.com/kf/HTB1GEoSeCWD3KVjSZSg763CxVXat.png)

## JavaScript & CSS 性能

在分析面板中，你可以分析一个页面或app的执行时间和内存使用情况。该面板帮助你了解资源消耗在哪里，并且帮助你优化代码。目前提供的分析器包括：

- CPU分析器显示页面JavaScript函数的执行时间。
- Heap分析器页面JavaScript对象和相关联的DOM节点的内存分布情况。
- JavaScript分析器显示脚本的执行时间分布。

![](https://ae01.alicdn.com/kf/HTB1SDkYeqWs3KVjSZFx761WUXXaH.png)

## 审查存储

在资源面板中你可以查看被审查页面的资源情况。你可以对与 HTML5 Database, Local Storage, Cookies, AppCache等进行交互操作。

![](https://ae01.alicdn.com/kf/HTB1SDkYeqWs3KVjSZFx761WUXXaH.png)



附：源文档地址：<https://leeon.gitbooks.io/devtools/content/learn_basic/overview.html> 