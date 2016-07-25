//
//  ViewController.m
//  iBeeboPro
//
//  Created by 迪远 王 on 16/7/24.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import "ViewController.h"
#import "UIStoryboard+Extensions.h"
#import "CookiesManager.h"
#import "WeiboMainTabBarController.h"

@interface ViewController ()<UIWebViewDelegate>{
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _loginWebView.delegate = self;
    
    [_loginWebView setScalesPageToFit:YES];
    _loginWebView.dataDetectorTypes = UIDataDetectorTypeNone;
    _loginWebView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    _loginWebView.delegate = self;
    _loginWebView.backgroundColor = [UIColor whiteColor];
    
    [_loginWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://passport.weibo.cn/signin/login?entry=mweibo&res=wel&wm=3349&r=http://m.weibo.cn/"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"shouldStartLoadWithRequest > %@", request.URL);
    if ([request.URL.absoluteString isEqualToString:@"http://m.weibo.cn/"]) {
        
        return YES;
    }
    return YES;
}


-(void)webViewDidStartLoad:(UIWebView *)webView{
    NSURL * url = webView.request.URL;
    NSLog(@"webViewDidStartLoad > %@ ", url);

}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSURL * url = webView.request.URL;
    NSLog(@"webViewDidFinishLoad > %@", url);
    if ([url.absoluteString isEqualToString:@"http://m.weibo.cn/"]) {
        [CookiesManager saveCookies];
        [[UIStoryboard mainStoryboard] changeRootViewController:[WeiboMainTabBarController class]];
    }

}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}

@end
