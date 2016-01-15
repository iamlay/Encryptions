//
//  AESViewController.m
//  Encryption
//
//  Created by 雷传营 on 16/1/15.
//  Copyright © 2016年 leichuanying. All rights reserved.
//

#import "AESViewController.h"
#import "AES.h"
@interface AESViewController ()
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

@implementation AESViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title = @"AES加密";
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
        _encryWithPublicKeyBtn .frame = CGRectMake((kMainScreenWidth-100)/2-150, kMainScreenHeight-150, 150, 30);
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
        _dencryWithPriviteKeyBtn.frame = CGRectMake((kMainScreenWidth-100)/2+100, kMainScreenHeight-150, 150, 30);
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
    _randomLabel.text = [self shuffledAlphabet];
    _encryWithPublicKeyTextview.text = [AES encrypt:_originTexfield.text password:_randomLabel.text];
    
}


//私钥解密数据
-(void)decryWithPriviteKey
{
    _dencryWithPriviteKeyTextview.text = [AES decrypt:_encryWithPublicKeyTextview.text password:_randomLabel.text];
    
}


//随机生成8位字符串
-(UILabel *)randomLabel
{
    if (!_randomLabel)
    {
        _randomLabel= [[UILabel alloc]initWithFrame:CGRectMake(150, 120, 100, 30)];
        _randomLabel.font = [UIFont systemFontOfSize:13];
        [self.view addSubview:_randomLabel];
    }
    return _randomLabel;
}




//生成八位随机字符串
- (NSString *)shuffledAlphabet {
    NSString *alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
    // Get the characters into a C array for efficient shuffling
    NSUInteger numberOfCharacters = [alphabet length];
    unichar *characters = calloc(numberOfCharacters, sizeof(unichar));
    [alphabet getCharacters:characters range:NSMakeRange(0, numberOfCharacters)];
    
    // Perform a Fisher-Yates shuffle
    for (NSUInteger i = 0; i < numberOfCharacters; ++i) {
        NSUInteger j = (arc4random_uniform((float)numberOfCharacters - i) + i);
        unichar c = characters[i];
        characters[i] = characters[j];
        characters[j] = c;
    }
    
    // Turn the result back into a string
    NSString *result = [NSString stringWithCharacters:characters length:8];
    free(characters);
    return result;
}


@end
