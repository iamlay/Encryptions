//
//  JavaViewController.m
//  Encryption
//
//  Created by 雷传营 on 16/1/10.
//  Copyright © 2016年 leichuanying. All rights reserved.
//

#import "JavaViewController.h"
#import "DES3Util.h"
#import "RSAUtil.h"
#import "AFNetworking.h"
@interface JavaViewController ()
@property(nonatomic, strong)UILabel     *originLabel;//原始数据标题
@property(nonatomic, strong)UITextField *originTexfield;//原始数据
@property(nonatomic, strong)UILabel     *encryLabelTitle;//加密标题
@property(nonatomic, strong)UILabel     *dencryLabelTitle;//解密标题
@property(nonatomic, strong)UITextView  *encryWithPublicKeyTextview;//加密后密文
@property(nonatomic, strong)UITextView  *dencryWithPriviteKeyTextview;//解密后密文
@property(nonatomic, strong)UIButton    *encryWithPublicKeyBtn;//加密按钮
@property(nonatomic, strong)UIButton    *dencryWithPriviteKeyBtn;//解密按钮
@property(nonatomic, strong)UILabel     *randomLabel;//随机l字符串


@end

@implementation JavaViewController
-(void)viewDidLoad
{
    self.navigationItem.title = @"RSA加密+Java后台";
    self.view.backgroundColor = [UIColor yellowColor];
    [self layoutView];
    
    
    
    
}

-(void)layoutView
{
    //创建输入源
    self.originLabel.text = @"原始数据:";
    self.originTexfield.placeholder  =  @"请输入原始数据";
    //创建title
    self.dencryLabelTitle.text  = @"解密数据:";
    self.encryLabelTitle.text= @"加密数据";
    self.encryWithPublicKeyTextview.text = @"用随机生成8位key ，加密数据";
    self.dencryWithPriviteKeyTextview.text = @"点击生成随机8位key btn后，生成密文，点击解密数据btn解密:";
    //创建button
    [self.encryWithPublicKeyBtn  setTitle:@"生成密文" forState:UIControlStateNormal];
    [self.dencryWithPriviteKeyBtn setTitle:@"解密密文" forState:UIControlStateNormal];
    //随机字符串label
    self.randomLabel.text = @"随机密码";
    
}



//原始数据懒加载
-(UILabel *)originLabel
{
    if (!_originLabel)
    {
        _originLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 80, 100, 30)];
        _originLabel.font = [UIFont systemFontOfSize:13];
        [self.view addSubview:_originLabel];
    }
    
    return _originLabel;
}


//初始数据UITextField输入
-(UITextField *)originTexfield
{
    if (!_originTexfield)
    {
        _originTexfield = [[UITextField alloc]initWithFrame:CGRectMake(120, 80, 200, 30)];
        _originTexfield .font  = [UIFont systemFontOfSize:13];
        _originTexfield .borderStyle  = UITextBorderStyleRoundedRect;
        [self.view addSubview:_originTexfield];
    }
    return _originTexfield ;
}

//加密标题
-(UILabel *)encryLabelTitle
{
    if (!_encryLabelTitle)
    {
        _encryLabelTitle  = [[UILabel alloc]initWithFrame:CGRectMake(10, 120, 100, 30)];
        _encryLabelTitle.font = [UIFont systemFontOfSize:13];
        [self.view addSubview:_encryLabelTitle];
        
    }
    return  _encryLabelTitle;
}


//解密标题
-(UILabel *)dencryLabelTitle
{
    if (!_dencryLabelTitle)
    {
        _dencryLabelTitle  = [[UILabel alloc]initWithFrame:CGRectMake(10, 320, 100, 30)];
        _dencryLabelTitle.font  = [UIFont systemFontOfSize:13];
        [self.view addSubview:_dencryLabelTitle];
    }
    
    return _dencryLabelTitle;
}




//加密密文显示UITextView
-(UITextView *)encryWithPublicKeyTextview
{
    if (!_encryWithPublicKeyTextview)
    {
        _encryWithPublicKeyTextview= [[UITextView alloc]initWithFrame:CGRectMake(10, 160, kMainScreenWidth-20, 150)];
        _encryWithPublicKeyTextview.font = [UIFont systemFontOfSize:13];
        _encryWithPublicKeyTextview.backgroundColor = [UIColor cyanColor];
        [self.view addSubview:_encryWithPublicKeyTextview];
    }
    
    
    return _encryWithPublicKeyTextview;
}


//加密密文显示UITextView
-(UITextView *)dencryWithPriviteKeyTextview
{
    if (!_dencryWithPriviteKeyTextview)
    {
        _dencryWithPriviteKeyTextview = [[UITextView alloc]initWithFrame:CGRectMake(10, 350, kMainScreenWidth-20, 150)];
        _dencryWithPriviteKeyTextview.font = [UIFont systemFontOfSize:13];
        _dencryWithPriviteKeyTextview.backgroundColor = [UIColor cyanColor];
        [self.view addSubview:_dencryWithPriviteKeyTextview];
    }
    return _dencryWithPriviteKeyTextview;
}

//加密数据btn
-(UIButton *)encryWithPublicKeyBtn
{
    if (!_encryWithPublicKeyBtn)
    {
        _encryWithPublicKeyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _encryWithPublicKeyBtn .frame = CGRectMake((kMainScreenWidth-100)/2-150, kMainScreenHeight-100, 150, 30);
        _encryWithPublicKeyBtn .backgroundColor = [UIColor redColor];
        [_encryWithPublicKeyBtn  addTarget:self action:@selector(encryWithPublicKey) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_encryWithPublicKeyBtn];
    }
    
    return _encryWithPublicKeyBtn;
    
    
}

//解密数据btn
-(UIButton *)dencryWithPriviteKeyBtn
{
    if (!_dencryWithPriviteKeyBtn)
    {
        _dencryWithPriviteKeyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _dencryWithPriviteKeyBtn.frame = CGRectMake((kMainScreenWidth-100)/2+100, kMainScreenHeight-100, 150, 30);
        _dencryWithPriviteKeyBtn.backgroundColor = [UIColor redColor];
        [_dencryWithPriviteKeyBtn addTarget:self action:@selector(decryWithPriviteKey) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_dencryWithPriviteKeyBtn];
    }
    
    return _dencryWithPriviteKeyBtn;
}


//公钥加密数据
-(void)encryWithPublicKey
{
    //生成一个随机的8位字符串，作为des加密数据的key,对数据进行des加密，对加密后的数据用公钥再进行一次rsa加密
    
    _encryWithPublicKeyTextview.text = [RSAUtil encryptString: _originTexfield.text publicKey:RSA_Public_key];
    //_encryWithPublicKeyTextview.text = [RSA encryptString: _originTexfield.text privateKey:RSA_Privite_key];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer =[AFJSONResponseSerializer serializer];
    
    NSString * timeStamp = [EncryptUtils getSysTimeStamp];
    NSString * originKey = [NSString stringWithFormat:@"%@%@",timeStamp,ENCRYPT_KEY];
    NSString * encryptKey = [EncryptUtils md5:originKey];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:timeStamp,@"time",encryptKey,@"md5", _encryWithPublicKeyTextview.text,@"content", _encryWithPublicKeyTextview.text,@"ciphertext",nil];
    [manager POST:@"http://192.168.1.127:8080/DesAndRsaDemo/rsa/testRsa.do"  parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"123");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}


//私钥解密数据
-(void)decryWithPriviteKey
{
    
    // _dencryWithPriviteKeyTextview.text = [RSA decryptString:RSA_Test_secret privateKey:RSA_Privite_key];
    _dencryWithPriviteKeyTextview.text = [RSAUtil decryptString:RSA_Test_secret publicKey:RSA_Public_key];
    
}


@end
