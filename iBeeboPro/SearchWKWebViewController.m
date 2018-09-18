//
//  SearchWKWebViewController.m
//  iBeeboPro
//
//  Created by 迪远 王 on 2018/9/19.
//  Copyright © 2018年 andforce. All rights reserved.
//

#import "SearchWKWebViewController.h"

#import <WebKit/WebKit.h>

@interface SearchWKWebViewController (){
    WKWebView *_webView;
}

@end

@implementation SearchWKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WKWebViewConfiguration *webViewConfiguration = [[WKWebViewConfiguration alloc] init];
    WKUserContentController *contentController = [[WKUserContentController alloc] init];
    NSString *js = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"search" ofType:@"js"]
                                             encoding:NSUTF8StringEncoding error:nil];
    WKUserScript * userScript = [[WKUserScript alloc] initWithSource:js injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
    [contentController addUserScript:userScript];
    webViewConfiguration.userContentController = contentController;
    
    
    CGFloat safeBottom = 0;
    if (@available(iOS 11.0,*)){
        UIEdgeInsets edgeInsets = [[UIApplication sharedApplication] keyWindow].safeAreaInsets;
        safeBottom = edgeInsets.bottom;
    }
    
    
    CGFloat bottom = safeBottom;// + _bottomView.frame.size.height;
    
    CGRect f = self.view.frame;
    
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    CGRect rectNav = self.navigationController.navigationBar.frame;
    
    _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, f.size.width, f.size.height - rectStatus.size.height - rectNav.size.height - bottom) configuration:webViewConfiguration];
    
    _webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    _webView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_webView];
    
    [self.view sendSubviewToBack:_webView];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://m.weibo.cn/p/searchall?containerid=231583"]];
    [_webView loadRequest:request];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
