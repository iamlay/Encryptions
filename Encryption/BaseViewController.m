//
//  BaseViewController.m
//  Encryption
//
//  Created by 雷传营 on 16/1/10.
//  Copyright © 2016年 leichuanying. All rights reserved.
//

#import "BaseViewController.h"
#import "MBProgressHUD.h"
#import "LSHelper.h"
#import "UIView+LSAdditions.h"
@interface BaseViewController () {
    MBProgressHUD *progressView;
    UISwipeGestureRecognizer *swipeLeftGR;
    UILabel *_noDataTitle;
}


@end

@implementation BaseViewController

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _w = self.view.width;
    _h = self.view.height;
    
    self.view.backgroundColor = kColorViewControllerBg;
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    progressView = [[MBProgressHUD alloc] initWithView:self.view];
    progressView.dimBackground = NO;
    [self.view addSubview:progressView];
    
    swipeLeftGR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGR:)];
    [self.view addGestureRecognizer:swipeLeftGR];
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        swipeLeftGR.enabled = NO;
        
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    /*
     //代理置空，否则会闪退
     if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
     self.navigationController.interactivePopGestureRecognizer.delegate = nil;
     }
     */
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    /*
     //开启iOS7的滑动返回效果
     if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
     //只有在二级页面生效
     if ([self.navigationController.viewControllers count] >= 2) {
     self.navigationController.interactivePopGestureRecognizer.delegate = self;
     }else{
     self.navigationController.interactivePopGestureRecognizer.delegate = nil;
     }
     }
     */
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    /*
     if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
     {
     self.navigationController.interactivePopGestureRecognizer.delegate = nil;
     }
     */
}


- (BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark - UIGestureRecongnizerDelegate
- (void)handleSwipeGR:(UIGestureRecognizer*)gestureRecognizer
{
    if (UISwipeGestureRecognizerDirectionLeft)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

/**
 *	@brief 对当前的vc增加是否允许右滑的开关
 *  iOS7以下的系统interactivePopGestureRecognizer属性不存在
 *	@param
 *  flag:右滑手势
 *  popFlag:系统提供的右滑
 */
- (void)switchOfGR:(BOOL)flag
{
    if (!flag)
    {
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
        {
            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        }
        else
        {
            swipeLeftGR.enabled = NO;
        }
    }
    else
    {
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
        {
            self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        }
        else
        {
            swipeLeftGR.enabled= YES;
        }
    }
}

/**
 *	@brief	自定义titlte居中处理
 *
 *	@param 	text 	title
 */
- (void)setNavTitle:(NSString *)title
{
    //注意必须先定义 leftBarButtonItem和rightBarButtonItem的位置
    //注意，此处不使用self.navigationItem.rightBarButtonItems这样形式的用法
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainBoundsWidth, 44)];
    titleView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    titleView.autoresizesSubviews = YES;
    titleView.backgroundColor = [UIColor clearColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kMainBoundsWidth, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];;
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //    titleLabel.lineBreakMode = kLineBreakModeClip;
    titleLabel.autoresizingMask = titleView.autoresizingMask;
    
    //标题宽度
    CGFloat width = [LSHelper widthForLabelWithString:title withFontSize:18 withWidth:kMainBoundsWidth withHeight:44];
    CGFloat maxWidth = 120;
    if(width <= kMainBoundsWidth-2*maxWidth){
        titleLabel.frame = CGRectMake(0, 0, kMainBoundsWidth-maxWidth*2, 44);
        titleView.frame = CGRectMake(maxWidth, 0, kMainBoundsWidth-maxWidth*2, 44);
    }
    else{
        CGRect leftViewbounds = self.navigationItem.leftBarButtonItem.customView.bounds;
        CGRect rightViewbounds = self.navigationItem.rightBarButtonItem.customView.bounds;
        CGRect frame;
        CGFloat maxWidth = leftViewbounds.size.width > rightViewbounds.size.width ? leftViewbounds.size.width : rightViewbounds.size.width;
        maxWidth += 15;//leftview 左右都有间隙，左边是5像素，右边是8像素，加2个像素的阀值 5 ＋ 8 ＋ 2
        frame = titleLabel.frame;
        frame.size.width = kMainBoundsWidth - maxWidth * 2;
        //        frame = CGRectMake(maxWidth, 0, kMainBoundsWidth-maxWidth*2, 44);
        titleLabel.frame = frame;
        
        frame = titleView.frame;
        frame.size.width = kMainBoundsWidth - maxWidth * 2;
        //        frame = CGRectMake(maxWidth, 0, kMainBoundsWidth-maxWidth*2, 44);
        titleView.frame = frame;
    }
    titleLabel.text = title;
    [titleView addSubview:titleLabel];
    self.navigationItem.titleView = titleView;
}

- (NSAttributedString *)converHtml:(NSString *)htmlStr{
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[htmlStr dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    return attributedString;
}

- (void)setNavRightButtonwithImg:(NSString *)normalImg selImg:(NSString *)selImg title:(NSString *)title action:(SEL)action
{
    self.navigationItem.rightBarButtonItem = [self getButtonItemWithImg:normalImg selImg:selImg title:title action:action];
}

- (void)setNavLeftButtonwithImg:(NSString *)normalImg selImg:(NSString *)selImg title:(NSString *)title action:(SEL)action
{
    self.navigationItem.leftBarButtonItem = [self getButtonItemWithImg:normalImg selImg:selImg title:title action:action];
}

// 自定义的返回箭头
- (void)setNavBackArrow {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    [button setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 50, 40);
    if (kIsIOS7) {
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, -35, 0, 0)];
    }else{
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, -25, 0, 0)];
    }
    [button addTarget:self action:@selector(navBackButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)setNavRightButtonEnable:(BOOL)enable
{
    [self.navigationItem.rightBarButtonItem setEnabled:enable];
}

- (void)setNavLeftButtonEnable:(BOOL)enable
{
    [self.navigationItem.leftBarButtonItem setEnabled:enable];
}

#pragma mark - NavButton Clicked
- (void)navGoHomeButtonClicked:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)navBackButtonClicked:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - MG_NavBaseViewController private
- (UIBarButtonItem *)getButtonItemWithImg:(NSString *)norImg selImg:(NSString *)selImg title:(NSString *)title action:(SEL)action
{
    CGSize navbarSize = self.navigationController.navigationBar.bounds.size;
    CGRect frame = CGRectMake(0, 0, navbarSize .height, navbarSize.height - 3);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    if (norImg)
        [button setImage:[UIImage imageNamed:norImg] forState:UIControlStateNormal];
    if (selImg)
        [button setImage:[UIImage imageNamed:selImg] forState:UIControlStateHighlighted];
    if (title) {
        CGSize strSize = CGSizeZero;
        if (kIsIOS7) {
            strSize = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14]}];
        } else {
            strSize = [title sizeWithFont:[UIFont boldSystemFontOfSize:14]];
        }
        [button setTitle:title forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:RGBA(198, 198, 198, 1) forState:UIControlStateHighlighted];
        frame.size.width = MAX(frame.size.width, strSize.width + 20);
    }
    button.frame = frame;
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* tmpBarBtnItem=[[UIBarButtonItem alloc] initWithCustomView:button];
    return tmpBarBtnItem;
}

#pragma mark - ProgressView Event
- (void)showProgressViewWithTitle:(NSString *)title
{
    [self.view bringSubviewToFront:progressView];
    if (title)
        progressView.labelText = title;
    [progressView show:YES];
}

- (void)hideProgressView:(BOOL)animation
{
    [progressView hide:animation];
}

- (void)hideProgressView
{
    [progressView hide:YES];
}


#pragma mark 无数据展示界面

- (void)showNoDataView:(NSString *)title {
    if (!_noDataTitle) {
        _noDataTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, self.view.width, 18)];
        _noDataTitle.textAlignment = NSTextAlignmentCenter;
        _noDataTitle.textColor = kColorGrayText;
        _noDataTitle.text = title;
        _noDataTitle.font = [UIFont systemFontOfSize:15];
        [self.view addSubview:_noDataTitle];
    }
}

- (void)hideNoDataView {
    [_noDataTitle removeFromSuperview];
}
//
//
//-(void)showNoNetWorkView
//{
//    if (!_noNetWorkView) {
//        _noNetWorkView = [LSNoNetWorkView loadFromXib];
//        _noNetWorkView.delegate = self;
//    }
//    if (![LSReachablity shareInstance].getNetWorkStatus) {
//        [_noNetWorkView showInView:self.view style:LSNoNetWorkViewStyle_No_NetWork];
//    }else{
//        [_noNetWorkView showInView:self.view style:LSNoNetWorkViewStyle_Load_Fail];
//    }
//}
//-(void)showNoNetWorkView:(LSNoNetWorkViewStyle)style
//{
//    if (!_noNetWorkView) {
//        _noNetWorkView = [LSNoNetWorkView loadFromXib];
//        _noNetWorkView.delegate = self;
//    }
//}
//-(void)hideNoNetWorkView
//{
//    [_noNetWorkView hide];
//}
//Overide method
#pragma mark LSNoNetWorkViewDelegate
-(void)retryToGetData
{
    
}

// 判断网络
- (BOOL)isNetOK{
    NetworkStatus status = [[Reachability reachabilityWithHostName:@"www.baidu.com"] currentReachabilityStatus];
    if (status == NotReachable) {
        CLog(@"Connected Failed!!");
        return NO;
    }else{
        CLog(@"Connected Successfully!!");
        return YES;
    }
    
    
    
    //    NetworkStatus status = [[Reachability reachabilityWithHostName:@"www.baidu.com"] currentReachabilityStatus];
    //    NetworkStatus statusJavaSever = [[Reachability reachabilityWithHostName:@"www.baidu.com"] currentReachabilityStatus];
    //    NetworkStatus statusPHPSever = [[Reachability reachabilityWithHostName:@"www.baidu.com"] currentReachabilityStatus];
    //    if (status == NotReachable ) {
    //        CLog(@"Connected Failed!!");
    //
    //        return NO;
    //    }else{
    //        CLog(@"Connected Successfully!!");
    //        if (statusJavaSever == NotReachable && statusPHPSever == NotReachable) {
    //            CLog(@"服务器崩溃");
    //            return NO;
    //        }
    //        else
    //        {
    //            return YES;
    //        }
    //        return NO;
    //    }
}

//-(void)showGuideView:(LSGuideType)type
//{
//    UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kMainBoundsWidth, kMainBoundsHeight)];
//    NSString* imageName = nil;
//    switch (type) {
//        case LSGuideType_Arround:
//            imageName = @"bg_guide_arround";
//            break;
//        case LSGuideType_Account:
//            imageName = @"bg_guide_account";
//            break;
//        default:
//            break;
//    }
//    if (is4Inch) {
//        imageName = [NSString stringWithFormat:@"%@4.png",imageName];
//    }else{
//        imageName = [NSString stringWithFormat:@"%@3.png",imageName];
//    }
//    imageView.tag = TAG_GUIDE_VIEW;
//    imageView.image = IMAGE_AT_APPDIR(imageName);
//    imageView.userInteractionEnabled = YES;
//    [[UIApplication sharedApplication].keyWindow addSubview:imageView];
//    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideGuideView)];
//    [imageView addGestureRecognizer:tapGesture];
//}
//
//-(void)hideGuideView
//{
//    [[[UIApplication sharedApplication].keyWindow viewWithTag:TAG_GUIDE_VIEW]removeFromSuperview];
//}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}


@end
