# Encryptions
=======================
 
 
[我的博客](http://blog.sina.com.cn/s/articlelist_5042266328_0_1.html "悬停显示")
最近做了一个移动项目，是有服务器和客户端类型的项目，客户端是要登录才行的，服务器也会返回数据，服务器是用Java开发的，客户端要同时支持多平台（Android、iOS），在处理iOS的数据加密的时候遇到了一些问题。起初采取的方案是DES加密，老大说DES加密是对称的，网络抓包加上反编译可能会被破解，故采取RSA方式加密。RSA加密时需要公钥和私钥，客户端保存公钥加密数据，服务器保存私钥解密数据。（iOS端公钥加密私钥解密、java端公钥加密私钥解密，java端私钥加密公钥解密都容易做到，iOS不能私钥加密公钥解密，只能用于验签）。

##问题

###问题1：iOS端公钥加密的数据用Java端私钥解密。


###问题2：服务器返回数据也要加密（由于iOS做不到用私钥加密公钥解密，只能私钥加密公钥验签），所以这种方案也有问题。



##ios端进行DES加密、解密时非常方便
```Objective-C
1、引入头文件 #import "DES3Util.h"
2、加密时调用类方法  +(NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key;
3、解密时调用类方法  +(NSString *)decryptUseDES:(NSString *)cipherText key:(NSString *)key;
```

 ![](http://s11.sinaimg.cn/large/005vePOggy6YsmPh0XU6a&690)  ![](http://s4.sinaimg.cn/large/005vePOggy6YsmPyg9Bf3&690) 

![](http://s5.sinaimg.cn/large/005vePOggy6YsmPBSQYf4&690)  ![](http://s13.sinaimg.cn/large/005vePOggy6YsmPFNYo8c&690) 
![](https://github.com/Flying-Einstein/Encryptions/blob/master/Encryption/11.png)
