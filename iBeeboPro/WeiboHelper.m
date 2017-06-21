//
//  WeiboHelper.m
//  iBeeboPro
//
//  Created by 迪远 王 on 2017/4/9.
//  Copyright © 2017年 andforce. All rights reserved.
//

#import "WeiboHelper.h"

#import "AFHTTPSessionManager+SimpleAction.h"
#import "WeiboJsonCleanner.h"
#import "HotWeiboPage.h"
#import "AtMeAtMePage.h"

@implementation WeiboHelper{
    AFHTTPSessionManager *_browser;
    WeiboJsonCleanner *_cleanner;
}

-(instancetype)init{
    if (self = [super init]) {
        _browser = [AFHTTPSessionManager manager];
        _browser.responseSerializer = [AFHTTPResponseSerializer serializer];
        _browser.responseSerializer.acceptableContentTypes = [_browser.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        
        _cleanner = [[WeiboJsonCleanner alloc] init];
    }
    return self;
}

-(void)fetchTimeLine:(double)cursor page:(int)page withCallback:(RequestWeiboPageCallback)callback{
    NSNumber *cursorNumber = @(cursor);
    NSString *cursorStr = [cursorNumber stringValue];
    NSString * url = [self buildTimeLineUrl:cursorStr page:page];
    [_browser GETWithURLString:url requestCallback:^(BOOL isSuccess, NSString *html) {
        
        NSString * debugStr = html;
        
        NSData *data = [debugStr dataUsingEncoding:NSUTF8StringEncoding];
        
        NSArray *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        WeiboPage * page = [WeiboPage modelObjectWithDictionary:[dictionary firstObject]];
        
        callback(page);
        
    }];
    
}

- (NSString *) buildTimeLineUrl:(NSString *) cursor page:(int)page{
    if ([cursor isEqualToString:@"-1"]) {
        return @"https://m.weibo.cn/feed/friends?version=v4";
    } else{
        return [NSString stringWithFormat:@"https://m.weibo.cn/feed/friends?version=v4&next_cursor=%@&page=%d", cursor , page];
    }
}


-(void)fetchHot:(double)since_id withCallback:(HotWeiboCallback)callback{

    NSNumber *cursorNumber = @(since_id);
    NSString *cursorStr = [cursorNumber stringValue];

    NSString * url = [NSString stringWithFormat:@"https://m.weibo.cn/api/container/getIndex?containerid=102803&since_id=%@", cursorStr];
    if (since_id < 1) {
        url = @"https://m.weibo.cn/api/container/getIndex?containerid=102803";
    }
    
    [_browser GETWithURLString:url requestCallback:^(BOOL isSuccess, NSString *html) {
        
        NSString * debugStr = html;
        
        NSData *data = [debugStr dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        HotWeiboPage * page = [HotWeiboPage modelObjectWithDictionary:dictionary];
        
        callback(page);
        
    }];
}

- (void)fetchAtMe:(NSString *)subtype wiht:(int)page withCallback:(AtMeCallback)callback {
    //https://m.weibo.cn/msg/atme?author=&type=&subtype=allWB&format=cards&page=2
    NSString * url = [NSString stringWithFormat:@"https://m.weibo.cn/msg/atme?author=&type=&subtype=%@&format=cards&page=%d", subtype, page];

    [_browser GETWithURLString:url requestCallback:^(BOOL isSuccess, NSString *html) {

        NSString * debugStr = html;

        NSData *data = [debugStr dataUsingEncoding:NSUTF8StringEncoding];

        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];

        AtMeAtMePage * page = [AtMeAtMePage modelObjectWithDictionary:dictionary];

        callback(page);

    }];
}


@end
