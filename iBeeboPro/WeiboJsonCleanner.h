//
//  WeiboJsonCleanner.h
//  iBeeboPro
//
//  Created by 迪远 王 on 16/7/30.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeiboJsonCleanner : NSObject

-(NSString *) cleanHtmlTag:(NSString *) src;
@end
