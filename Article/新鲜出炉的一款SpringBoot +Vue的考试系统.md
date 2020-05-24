## 一、考试系统简介
新鲜出炉的一款SpringBoot +Vue的考试系统，支持多种题型：选择题、多选题、判断题、填空题、综合题以及数学公式。支持在线考试，教师在线批改试卷。
## 二、项目架构
**后端技术栈**
- SpringBoot: SpringBoot是由Pivotal团队提供的全新框架，其设计目的是用来简化Spring应用的创建、运行、调试、部署等。
- Mybatis: 一个持久层的框架,与数据库进行交互,将数据持久化到关系型数据库中
- Shiro: 一个功能强大且易于使用的Java安全框架，进行身份验证，授权，加密和会话管理，可用于保护任何应用程序- 从命令行应用程序，移动应用程序到大型的Web应用和企业应用。
- mysql: 一个轻量级关系型数据库管理系统，由瑞典MySQL AB公司开发，目前属于Oracle公司。
- redis: 一个完全开源免费的，遵守BSD协议，是一个高性能的key-value数据库。

**前端技术**
- Vue: 一套用于构建用户界面的渐进式框架。 与其它大型框架不同的是，Vue 被设计为可以自底向上逐层应用。
- Vuex: 一个专为Vue.js 应用程序开发的状态管理模式。 它采用集中式存储管理应用的所有组件的状态，并以相应的规则保证状态以一种可预测的方式发生变化。
- Element-UI: 一套为开发者、设计师和产品经理准备的基于Vue 2.0 的桌面端组件库。
- vue-router: Vue.js 官方的路由管理器。
- axios: 一个基于Promise 的HTTP 库，可以用在浏览器和node.js 中。

**项目说明**</br>
考试系统整体为前后端分离项目，作者又在这基础上，将端拆分成两个管理员后端和学生考试后端，后端的代码在一起。前端也做了类似的拆分，所以其实是两个后端项目，两个前端项目。本篇先讲一下学生考试端的环境搭建。主要包括：学员在线做课程试题、在线考试、错题本功能记录、考试记录、个人中心。

**后端项目地址**</br>
后端项目地址:https://gitee.com/zhuimengshaonian/wisdom-education
- 管理员后台: education-admin-api
- 学生考试后台: education-student-api

**前端项目地址**</br>
- 管理员前端: https://gitee.com/zhuimengshaonian/wisdom-education-admin-front
- 学生考试前端: https://gitee.com/zhuimengshaonian/wisdom-education-front
## 三、实战
### 3.1 后端服务
**下载项目**</br>
```bash
git clone https://gitee.com/zhuimengshaonian/wisdom-education.git
```
**初始化数据库**</br>
创建数据库`education`,执行数据库脚本。这里数据库脚本在项目的`db`目录下。
```
init-data.sql  #初始化数据
init-region.sql #初始化system_region
init-table.sql  #初始化表结构
```
注意:`system_log`表少一个字段`request_url`,类型为`varchar(100)`。
**修改配置**</br>
阅读项目配置文件可知，项目使用的`prod`的配置文件，所以我们直接看`application-prod.yml`文件即可。
这里主要关注数据库连接，再添加一下`redis`的配置。
```properties
server:
  port: 8001  #服务器端口
  servlet:
    context-path: /
#spring jdbc配置
spring:
#redis相关配置
  redis:
    jedis:
      pool:
        max-active: 8
        max-wait: 30
        max-idle: 8
        min-idle: 0
    port: 6379
    host: localhost
    password: 123456
#数据库连接
  datasource:
    url: jdbc:mysql://localhost:3306/education?serverTimezone=GMT%2B8&useSSL=true&useUnicode=true&characterEncoding=utf8
    username: root
    password: 123456
    driver-class-name: com.mysql.cj.jdbc.Driver
```

**运行Application**</br>
运行`EducationStudentApiApplication`类，即可本地启动后端服务。
![](https://imgkr.cn-bj.ufileos.com/3016f473-878b-45f8-b945-bb870e66ef1d.png)

### 3.2 前端服务
**下载项目**</br>
```bash
git clone https://gitee.com/zhuimengshaonian/wisdom-education-front.git
```
**修改配置**</br>
用开发工具打开前端项目,这里我用的`VSCode`，打开`config/index.js`,这里主要修改一下`proxyTable`的内容:
```js
proxyTable: {
      '/proxyApi': {
          target: 'http://localhost:8001',
            changeOrigin: true,
            pathRewrite: {
            '/proxyApi': 'http://localhost:8001'
          }
      }
    }
```
**运行项目**</br>
在命令行窗口，或者`VSCode`的`终端`执行下面命令就可以本地运行项目。
```bash
npm install #安装依赖
npm run dev #开发环境启动，默认http://localhost:8080/
```
要在服务端部署项目，执行下面打包命令，然后使用`web`容器部署即可。
```bash
npm run build #项目打包
npm run build --report #项目打包并输出分析报告
```
### 3.3 运行效果
浏览器访问`http://localhost:8080`,默认用户密码: student 123456,就可以直接登录了。
运行效果:
![](https://imgkr.cn-bj.ufileos.com/14c79c11-478e-4d20-bc09-d17f3efff257.png)

## 四、最后
项目具备了考试系统基本功能，本篇讲了学生考试部分的前后端的搭建。另外比较重要的一部分就是管理员前端项目，本人不是专业搞前端的，还没搞定管理员前端项目，尝试过程中也遇到了很多问题，FAQ做个记录。遇到问题其实也不可怕，合理利用搜索引擎 + 开启大脑思考功能，我相信问题一定可以解决的。下篇将考试系统的管理员部分的前后端搭建。

## FAQ
- 1.npm install 报错：Error: Can't find Python executable "python", you can set the PYTHON env variable。<br/> 
解决版方法：执行 npm install -g windows-build-tools命令
- 2.npm install报错：MSBUILD : error MSB4132: 无法识别工具版本“2.0”。可用的工具版本为 "4.0"。<br/> 
解决方法：https://blog.csdn.net/sunxiaoju/article/details/102567548
- 3.Windows下安装前端项目，node-sass报错。<br/> 
解决方法：npm install node-sass@4.12.0 --save
- 4.Vue packages version mismatch:vue@2.5.16, vue-template-compiler@2.5.2。<br/> 
解决办法：保持版本一致：npm install vue@2.5.2 --save
- 5.How to fix ReferenceError: primordials is not defined in node。<br/> 
解决方法：npm -g install gulp-cli
