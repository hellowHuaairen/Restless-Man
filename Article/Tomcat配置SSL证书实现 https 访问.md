## 一、为什么要配置SSL证书

- `HTTPS` 能有效保护用户隐私，能进行有效的身份校验，并能保证数据的保密性、完整性。
- 交流数据加密，为服务器端与客户端之间的数据传输进行加密。例如微信小程序要求被提供接口的一方要安装 `SSL` 证书。
- 可进行 `SEO` 优化，百度官方公开说明搜索引擎优先 `HTTPS` 网站。
- 避免浏览器弹出`不安全`警告，添加 `SSL` 证书增强网站可信度。

## 二、所有免费的 `SSL` 证书
SSL 证书分为三种类型：域名型SSL证书（DV SSL）、企业型SSL证书（OVSSL）、增强型SSL证书（EVSSL）。
本篇主要介绍下面三个平台，因为大家购买的服务大多是腾讯云或者阿里云的。

1.阿里云DV SSL证书<br>
官网：https://common-buy.aliyun.com/?commodityCode=cas<br>
> 阿里云的证书是有 Symantec 签发，Symantec 公司是 SSL/TLS 证书的领先提供商，为全球一百多万台网络服务器提供安全防护。一个阿云帐户最多签发20张免费证书。

2.腾讯云DV SSL 证书<br>
官网：https://cloud.tencent.com/product/ssl<br>
> 腾讯云DV SSL 域名型证书也是由 Symantec 公司签发。快速便捷部署到腾讯云，也可以下载证书，用于其他云服务提供商。<br>

3.Let's Encrypt <br>
官网: https://letsencrypt.org<br>
> Let's Encrypt是国外一个公共的免费SSL项目，由 Linux 基金会托管，安装部署特别简单，总之得到大家的一致认可。


## 三、Tomcat 安装阿里云 `SSL` 证书
### 申请证书
证书申请地址：https://common-buy.aliyun.com/?commodityCode=cas
证书类型选择：免费版（个人）DV，如下图：
![](https://imgkr.cn-bj.ufileos.com/bd980e9c-bd59-4cf5-8bfd-0a1804631ad6.png)
立即购买后，进入到 `ssl` 证书控制台，选中一个证书，点击 "证书申请"按钮，如下图：
![](https://imgkr.cn-bj.ufileos.com/333c3272-df77-4db4-952e-c87aa3eb6d1c.png)
填写相应的必填信息，按照提示进入操作。
### 下载证书
上面申请24小时内会通过，接下来根据自己的 `web` 容器下载相应的证书，这里我使用的容器为 `Tomcat`,如下图：
![](https://imgkr.cn-bj.ufileos.com/0569e8df-92b9-4425-9587-b2953852b0a4.png)
下载下来的证书包含两个文件：
![](https://imgkr.cn-bj.ufileos.com/44b4f070-0fef-445d-b552-0c0dce898ba7.png)

### Tomcat 配置
1.上传证书文件
上传证书到服务器上，这里目录根据自己可自由设置，我上传的路径为 `tomcat/cert`。
2.修改 `conf/server.xml`
a.修改 `tomcat` 访问端口，将 8080 改为 80，在浏览器访问时不需要添加端口。将 `redirectPort="8443" `的端口改为 443，因为 https 的端口为 443。最终修改内容如下：
```xml
    <!-- A "Connector" represents an endpoint by which requests are received
         and responses are returned. Documentation at :
         Java HTTP Connector: /docs/config/http.html
         Java AJP  Connector: /docs/config/ajp.html
         APR (HTTP/AJP) Connector: /docs/apr.html
         Define a non-SSL/TLS HTTP/1.1 Connector on port 8080
    -->
    <Connector port="80" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="443" />
```
b.添加 `ssl`证书和密码，将 `port` 值改为 443，`keystoreFile` 属性指向服务器的 *.pfx文件,`keystoreType` 的值为 `pfx-password.txt` 的内容，最终修改内容如下：
```xml
<!-- Define an SSL/TLS HTTP/1.1 Connector on port 8443
         This connector uses the NIO implementation. The default
         SSLImplementation will depend on the presence of the APR/native
         library and the useOpenSSL attribute of the
         AprLifecycleListener.
         Either JSSE or OpenSSL style configuration may be used regardless of
         the SSLImplementation selected. JSSE style configuration is used below.
-->
<Connector port="443"
    protocol="org.apache.coyote.http11.Http11Protocol"
    SSLEnabled="true"
    scheme="https"
    secure="true"
    keystoreFile="/xxx/tomcat/cert/restlessman.cn.pfx"
    keystoreType="PKCS12"
    keystorePass="xxxxx"
    clientAuth="false"
    SSLProtocol="TLSv1+TLSv1.1+TLSv1.2"
    ciphers="TLS_RSA_WITH_AES_128_CBC_SHA,TLS_RSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256,TLS_RSA_WITH_AES_128_CBC_SHA256,TLS_RSA_WITH_AES_256_CBC_SHA256"/>
```

3.修改 `conf/web.xml`
在 `conf/web.xml` 添加如下内容，可从 http 跳转到 https

```xml
<login-config>
		<!-- Authorization setting for SSL -->
		<auth-method>CLIENT-CERT</auth-method>
		<realm-name>Client Cert Users-only Area</realm-name>
</login-config>
<security-constraint>
		<!-- Authorization setting for SSL -->
		<web-resource-collection >
				<web-resource-name >SSL</web-resource-name>
				<url-pattern>/*</url-pattern>
		</web-resource-collection>
		<user-data-constraint>
				<transport-guarantee>CONFIDENTIAL</transport-guarantee>
		</user-data-constraint>
</security-constraint>
```
4.重启 Tomcat
重启 `Tomcat` 后，访问 https://xxx.xxx.xxx 即可。如下图：
![](https://imgkr.cn-bj.ufileos.com/05962990-ddde-46c8-8677-908a42d3b4e3.png)

## 四、最后
之前一直比较懒，搭建很多博客网站一直没安装 `ssl` 证书，对于博客而言安全证书意义不大！这次只因一件事，小程序request合法域名必须是 `https` 开头，所以就出现了本篇文章。有讲的不对的地方欢迎指正！


