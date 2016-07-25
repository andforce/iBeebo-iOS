//
//  CookieManager.h
//  iBeeboPro
//
//  Created by 迪远 王 on 16/7/24.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CookiesManager : NSObject

+(void) saveCookies;

+(NSString *) cookiesString;

+(NSArray *) cookiesArray;

@end
