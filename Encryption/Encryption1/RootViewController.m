//
//  RootViewController.m
//  Encryption
//
//  Created by 雷传营 on 16/1/10.
//  Copyright © 2016年 leichuanying. All rights reserved.
//

#import "RootViewController.h"
#import "RSAViewController.h"
#import "DESViewController.h"
#import "JavaViewController.h"
#import "MD5Viewcontroller.h"
#import "AESViewController.h"
@interface RootViewController ()
@property(nonatomic, strong)UIButton    *DESButton;//加密按钮
@property(nonatomic, strong)UIButton    *RSAButton;//解密按钮
@property(nonatomic, strong)UIButton    *JavaButton;//解密按//
@property(nonatomic, strong)UIButton    *MD5Button;
@property(nonatomic, strong)UIButton    *AESButton;
@end

@implementation RootViewController

-(void)viewDidLoad
{
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title= @"各种类型加密";
    [self.DESButton  setTitle:@"DES加密" forState:UIControlStateNormal];
    [self.RSAButton  setTitle:@"RSA加密" forState:UIControlStateNormal];
    [self.JavaButton  setTitle:@"RSA &Java server" forState:UIControlStateNormal];
    [self.MD5Button setTitle:@"MD5加密" forState:UIControlStateNormal];
    [self.AESButton setTitle:@"AES加密" forState:UIControlStateNormal];
    [self setNavBackArrow];
    
}











//DES加密数据btn
-(UIButton *)DESButton
{
    if (!_DESButton)
    {
        _DESButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _DESButton .frame = CGRectMake((kMainScreenWidth-100)/2-150, 100, 100, 30);
        _DESButton .backgroundColor = [UIColor blueColor];
        [_DESButton  addTarget:self action:@selector(DESdetailVC) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_DESButton];
    }
    
    return _DESButton;
    
    
}

//RSA加密数据btn
-(UIButton *)RSAButton
{
    if (!_RSAButton)
    {
        _RSAButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _RSAButton.frame = CGRectMake((kMainScreenWidth-100)/2-150, 150, 100, 30);
        _RSAButton.backgroundColor = [UIColor blueColor];
        [_RSAButton addTarget:self action:@selector(RSAdetailVC) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_RSAButton];
    }
    return _RSAButton;
}


//RSA加密数据btn
-(UIButton *)JavaButton
{
    if (!_JavaButton)
    {
        _JavaButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _JavaButton.frame = CGRectMake((kMainScreenWidth-100)/2-150, 200, 150, 30);
        _JavaButton.backgroundColor = [UIColor blueColor];
        [_JavaButton addTarget:self action:@selector(JAVAdetailVC) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_JavaButton];
    }
    return _JavaButton;
}

//MD5加密数据btn
-(UIButton *)MD5Button
{
    if (!_MD5Button)
    {
        _MD5Button = [UIButton buttonWithType:UIButtonTypeCustom];
        _MD5Button.frame = CGRectMake((kMainScreenWidth-100)/2-150, 250, 150, 30);
        _MD5Button.backgroundColor = [UIColor blueColor];
        [_MD5Button addTarget:self action:@selector(MD5detailVC) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_MD5Button];;
    }
    return _MD5Button;
    
    
}

-(UIButton *)AESButton
{
    if (!_AESButton)
    {
        _AESButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _AESButton.frame = CGRectMake((kMainScreenWidth-100)/2-150, 300, 150, 30);
        _AESButton.backgroundColor = [UIColor blueColor];
        [_AESButton addTarget:self action:@selector(AESdetailVC) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_AESButton];;
    }
    return _AESButton;
    
    
}


//DES加密数据
-(void)DESdetailVC
{
    
    
    DESViewController *DESVC= [[DESViewController alloc]init];
    [self.navigationController pushViewController:DESVC animated:YES];
    
}


//RSA加密数据
-(void)RSAdetailVC
{
    RSAViewController *RSAVC = [[RSAViewController alloc] init];
    [self.navigationController pushViewController:RSAVC animated:YES];
}

//JAJA加密数据
-(void)JAVAdetailVC
{
    JavaViewController *JAVAVC= [[JavaViewController alloc]init];
    [self.navigationController pushViewController:JAVAVC animated:YES];
    
}


//MD5加密数据
-(void)MD5detailVC
{
    MD5ViewController *md5VC= [[MD5ViewController alloc]init];
    [self.navigationController pushViewController:md5VC animated:YES];
    
    
}


//AES加密数据
-(void)AESdetailVC
{
    AESViewController *AESVC= [[AESViewController alloc]init];
    [self.navigationController pushViewController:AESVC animated:YES];
    
    
}

@end
