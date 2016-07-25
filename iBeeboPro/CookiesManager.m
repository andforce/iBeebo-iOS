//
//  CookieManager.m
//  iBeeboPro
//
//  Created by 迪远 王 on 16/7/24.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import "CookiesManager.h"
#include "iconv.h"

@implementation CookiesManager

+(void)saveCookies{
    NSArray<NSHTTPCookie *> *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:cookies];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"cookies"];
}

+(NSString *) cookiesString{
    NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:@"cookies"];
    
    NSString * cookiesString = @"";
    
    if([cookiesdata length]) {
        
        
        NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
        NSHTTPCookie *cookie;
        int i = 0;
        for (cookie in cookies) {
            if (i == cookies.count -1) {
                cookiesString = [cookiesString stringByAppendingString:[NSString stringWithFormat:@"%@=%@", cookie.name, cookie.value]];
                
            } else{
                cookiesString = [cookiesString stringByAppendingString:[NSString stringWithFormat:@"%@=%@; ", cookie.name, cookie.value]];
            }
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
        }
    }
    
    return cookiesString;
}

+(NSArray *) cookiesArray{
    NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:@"cookies"];
    
    if([cookiesdata length]) {
        NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
        return cookies;
    } else{
        return nil;
    }
}

@end
