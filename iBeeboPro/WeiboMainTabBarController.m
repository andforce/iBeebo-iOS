//
//  WeiboMainTabBarController.m
//  iBeeboPro
//
//  Created by 迪远 王 on 16/7/24.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import "WeiboMainTabBarController.h"
#import "AFHTTPSessionManager+SimpleAction.h"
#import "CardGroup2.h"
#import "Mblog.h"

@interface WeiboMainTabBarController (){
    AFHTTPSessionManager *_browser;
}

@end

@implementation WeiboMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    _browser = [AFHTTPSessionManager manager];
    _browser.responseSerializer = [AFHTTPResponseSerializer serializer];
    _browser.responseSerializer.acceptableContentTypes = [_browser.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    
    
    [_browser GETWithURLString:@"http://m.weibo.cn/index/feed?format=cards" requestCallback:^(BOOL isSuccess, NSString *html) {
        NSString * debugStr = html;
        
        NSData *data = [debugStr dataUsingEncoding:NSUTF8StringEncoding];
        
        NSArray *arr2 = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        
        NSArray *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];

        CardGroup2 * cardgroup = [CardGroup2 modelObjectWithDictionary:[dictionary firstObject]];
        
        NSArray *card_type = cardgroup.cardGroup;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
