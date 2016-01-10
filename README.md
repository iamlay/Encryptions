# Encryptions
this project is for many kinds of encryption
=======================
 ![](http://s12.sinaimg.cn/large/005vePOgzy6XQ9wm2Jtbb&690)  
 
[我的博客](http://blog.sina.com.cn/s/articlelist_5042266328_0_1.html "悬停显示")
最近做了一个移动项目，是有服务器和客户端类型的项目，客户端是要登录才行的，登录的密码要用DES加密，服务器是用Java开发的，客户端要同时支持多平台（Android、iOS），在处理iOS的DES加密的时候遇到了一些问题，起初怎么调都调不成和Android端生成的密文相同。最终一个忽然的想法让我找到了问题的所在，现在将代码总结一下，以备自己以后查阅。

##ios端进行加密、解密时非常方便
```Objective-C
1、引入头文件 #import "DES3Util.h"
2、加密时调用类方法  +(NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key;
3、解密时调用类方法  +(NSString *)decryptUseDES:(NSString *)cipherText key:(NSString *)key;
```

