//
//  MD5ViewController.m
//  Encryption
//
//  Created by 雷传营 on 16/1/10.
//  Copyright © 2016年 leichuanying. All rights reserved.
//

#import "MD5ViewController.h"
#import <CommonCrypto/CommonDigest.h>
@interface MD5ViewController ()
@property(nonatomic, strong)UILabel     *originLabel;//原始数据标题
@property(nonatomic, strong)UITextField *originTexfield;//原始数据
@property(nonatomic, strong)UILabel     *encryLabelTitle;//加密标题
@property(nonatomic, strong)UITextView  *encryWithPublicKeyTextview;//加密后密文
@property(nonatomic, strong)UIButton    *encryWithPublicKeyBtn;//加密按钮

@end

@implementation MD5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title = @"MD5加密";
    [self layoutView];
    
}



-(void)layoutView
{
    //创建输入源
    self.originLabel.text = @"原始数据:";
    self.originTexfield.placeholder  =  @"请输入原始数据";
    //创建title
    self.encryLabelTitle.text= @"加密数据";
    //创建button
    [self.encryWithPublicKeyBtn  setTitle:@"生成密文" forState:UIControlStateNormal];
    
    self.encryWithPublicKeyTextview.text = @"MD5加密是单向的，无法解密";
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


//加密数据btn
-(UIButton *)encryWithPublicKeyBtn
{
    if (!_encryWithPublicKeyBtn)
    {
        _encryWithPublicKeyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _encryWithPublicKeyBtn .frame = CGRectMake((kMainScreenWidth-200)/2, kMainScreenHeight-200, 150, 30);
        _encryWithPublicKeyBtn .backgroundColor = [UIColor redColor];
        [_encryWithPublicKeyBtn  addTarget:self action:@selector(encryWithPublicKey) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_encryWithPublicKeyBtn];
    }
    
    return _encryWithPublicKeyBtn;
    
    
}




//公钥加密数据
-(void)encryWithPublicKey
{
    _encryWithPublicKeyTextview.text= [self md5:_originTexfield.text];
}

- (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end
