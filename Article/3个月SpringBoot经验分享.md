Vue + SpringCloud前后端分离项目3个月项目实战经验分享

## 1.前后端分离

去年项目组的项目是SpringMVC+Dwz实现的，由于业务增加，这样的一个springMVC项目已经很臃肿，一处出现问题，就导致服务崩溃，太不灵活。今年年初，为了适应公司业务的发展，公司高层决定项目重构，采用前后端分离。今天先分享后端的开发。

前后端的好处显而易见：

1.前端JS可以做很大部分的数据处理工作，对服务器的压力减小到最小。

2.后台错误不会直接反映到前台，错误接秒较为友好。

3.前后台各尽其职可以最大程度的减少开发难度。 

![](https://ae01.alicdn.com/kf/HTB1bAxsa1T2gK0jSZFvq6xnFXXaJ.jpg)

## 2.技术栈

1. SpringBoot :是由 Pivotal 团队提供的全新框架，其设计目的是用来简化新 Spring 应用的初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。
2. SpringCloud：是一系列框架的有序集合。它利用Spring Boot的开发便利性巧妙地简化了分布式系统基础设施的开发，如服务发现注册、配置中心、消息总线、负载均衡、断路器、数据监控等，都可以用Spring Boot的开发风格做到一键启动和部署。
3. Docker：是一个开源的应用容器引擎，让开发者可以打包他们的应用以及依赖包到一个可移植的容器中,然后发布到任何流行的Linux机器上,也可以实现虚拟化,容器是完全使用沙箱机制,相互之间不会有任何接口。
4. Jenkins：一种比较流行的持续集成工具。持续集成是使多种软件的功能集成到一个软件里，或是把软件的各部分组合在一起。 
5. RabbitMQ：是一个开源的消息代理和队列服务器，用来通过普通协议在完全不同的应用之间共享数据，或者简单的将作业排队以便让分布式服务器进行处理。
6. Redis是完全开源免费的，是一个开源的高性能的key-value数据库。

## 3.后端项目总结

1. 项目微服务四个基础服务,其他就是业务服务。

​               Eurake： 主要职责服务的注册和发现。

​               Admin： 负责用户认证，生成用户token。

​               System： 系统基础数据服务。

​               Zuul： 网管服务。

​    2. 独立开发的springBoot项目

​         完成业务功能的同时，项目也内置swagger（一款API文档的框架 ），方便前后台接口调试。

   3. 服务间调用

      我们采用的Feign进行服务间调用，它只需要创建一个接口，并且使用注解的方式去配置，即可完成对服务提供方的接口绑定，大大简化了代码的开发量 。其他方式也有RestTemplate。

   4. 持续集成工具Jenkins

      项目组成员提交代码到GitLab，Jenkins检测有代码更新，会自动打包部署。项目实现部署自动化，减少人工成本。

5. 分布式事务

   LCN分布式事务框架的核心功能是对本地事务的协调控制，框架本身并不创建事务，只是对本地事务做协调控制。

6. SpringBoot项目架构优化

   由于有些服务需要对外提供多个调用接口，我们小组组长对微服务做了一些改进。将一个springBoot项目拆分为三个模块：entity,server,client。entity是实体，server是业务出来逻辑，client是FeignClient。其他服务需要调用本服务的接口，只需要在pom中引用entity,client。就不需要在自己的微服务中定义实体和FeignClient，使服务间调用解耦。

7. 使用RabbitMQ记录日志

   RabbitMQ是实现 AMQP（高级消息队列协议）的消息中间件的一种，项目中主要使用使用RabbitMQ记录日志。

8. 使用Java8新语法

   在springBoot项目开发中使用了一些Java8的新语法，lambda表达式，Steam,Optional,方法引用,日期的处理等。

9. 遇到的坑

​       1.服务间调用无法调用

​        当我们需要调试某个微服务的时候，将我们这个微服务注册到开发测试环境的eurake服务上，但是经常是自动访问不到我们注册的服务。解决方法在FeignClient注解添加url属性，指定服务地址。例如：@FeignClient(name = "test-client", url = "https://api.github.com")

​       2.FeiginClient实现文件上传功能

​        服务提供方的请求需添加consumes 参数， @PostMapping(value = "/uploadFile", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)，服务的消费方在FeignClient需要添加SpringFormEncoder编码器。添加如下代码：

```
@Configuration
    class MultipartSupportConfig {
        @Bean
        public Encoder feignFormEncoder() {
            return new SpringFormEncoder();
        }
    }
```

​         3.指定数据库方言

​          如果不指定数据库方言 ，使用Mybitas Plus自动生成分页查询语句可能回出现问题。

​        4.日期类型时间相差8小时

​           原因是前台传递的是UTC 时间，UTC + 时区差 ＝ 本地时间。所有后台有两种解决方式，使用Java8的LocalDateTime类型，或者使用Date类型，在属性上添加注解@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")。

## 5.结语

最开始项目要重构采用新的架构，前端使用时下流行的Vue,后端使用便捷的SpringBoot，我是很兴奋的。我是做Java开发，后端对于我来说是没有什么问题。但是前端就感觉有点吃力了，因为当时决定前后端分离，我们项目还没有一个前端，感觉很虚。

公司的大力支持，在项目进入开发阶段的前两周，有了三人的前端开发团队，然后我们就进入了疯狂的撸代码阶段。项目组都是年轻人，我们为了一个共同目标，共同奋斗，超越自我。从一开始的不自信，慢慢走向自信。虽然一直加班，但也一直在成长，年轻就该吃点苦头！

一直很忙碌，没时间总结，今天整理一下，文中主要是我个人的一些经历和思考。前后端分离项目中遇到了很多坑，你在项目开发中遇到过那些坑，我们可以一起讨论。