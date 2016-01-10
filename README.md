# Encryptions
=======================
 
 
[我的博客](http://blog.sina.com.cn/s/articlelist_5042266328_0_1.html "悬停显示")
最近做了一个移动项目，是有服务器和客户端类型的项目，客户端是要登录才行的，服务器也会返回数据，服务器是用Java开发的，客户端要同时支持多平台（Android、iOS），在处理iOS的数据加密的时候遇到了一些问题。起初采取的方案是DES加密，老大说DES加密是对称的，网络抓包加上反编译可能会被破解，故采取RSA方式加密。RSA加密时需要公钥和私钥，客户端保存公钥加密数据，服务器保存私钥解密数据。（iOS端公钥加密私钥解密、java端公钥加密私钥解密，java端私钥加密公钥解密都容易做到，iOS不能私钥加密公钥解密，只能用于验签）。

###问题

####问题1：iOS端公钥加密的数据用Java端私钥解密。

iOS无论使用系统自带的sdk函数，用mac产生的或者使用java的jdk产生的公钥和私钥，进行加密解密自己都可以使用。不过ios加密，java解密，或者反过来就不能用了。要么是无法创建报告个-9809或-50的错误，要么解出来是乱码。ios系统函数种只有用公钥加密，私钥解密的方式。而公钥加密每次结果都不同。网上这种案例比比皆是，但是ios私钥加密的方式死活找不到。最后研究了下openssl，使用openssl库才解决了这个问题。使用openssl既可以使用公钥加密，也可以使用私钥进行加密，而且与java的加解密的结果相同。
ios与java加解密配置要相同，x.509、PCKS#8/RSA_PKCS1_PADDING等等。


####问题2：服务器返回数据也要加密，老大打算用java私钥加密,ios用公钥解密（由于iOS做不到用私钥加密公钥解密，只能私钥加密公钥验签），所以这种方案也有问题。

通过看一些大牛的介绍，了解了iOS常用的加密方式
1 通过简单的URLENCODE ＋ BASE64编码防止数据明文传输
2 对普通请求、返回数据，生成MD5校验（MD5中加入动态密钥），进行数据完整性（简单防篡改，安全性较低，优点：快速）校验。 
3 对于重要数据，使用RSA进行数字签名，起到防篡改作用。
4 对于比较敏感的数据，如用户信息（登陆、注册等），客户端发送使用RSA加密，服务器返回使用DES(AES)加密。
原因：客户端发送之所以使用RSA加密，是因为RSA解密需要知道服务器私钥，而服务器私钥一般盗取难度较大；如果使用DES的话，可以通过破解客户端获取密钥，安全性较低。而服务器返回之所以使用DES，是因为不管使用DES还是RSA，密钥（或私钥）都存储在客户端，都存在被破解的风险，因此，需要采用动态密钥，而RSA的密钥生成比较复杂，不太适合动态密钥，并且RSA速度相对较慢，所以选用DES）
所以此次加密，我们选择了第四种加密方式

##加密方式

####ios端进行DES加密、解密时非常方便
```Objective-C
1、引入头文件 #import "DES3Util.h"
2、加密时调用类方法  +(NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key;
3、解密时调用类方法  +(NSString *)decryptUseDES:(NSString *)cipherText key:(NSString *)key;
```

 ![](http://s11.sinaimg.cn/large/005vePOggy6YsmPh0XU6a&690)  ![](http://s4.sinaimg.cn/large/005vePOggy6YsmPyg9Bf3&690) 

![](http://s5.sinaimg.cn/large/005vePOggy6YsmPBSQYf4&690)  ![](http://s13.sinaimg.cn/large/005vePOggy6YsmPFNYo8c&690) 
![](https://github.com/Flying-Einstein/Encryptions/blob/master/Encryption/11.png)
