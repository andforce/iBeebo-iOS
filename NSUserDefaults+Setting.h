//
//  NSUserDefaults+Setting.h
//
//  Created by 迪远 王 on 16/4/2.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kSIGNATURE @"setting_signature"
#define kTOP_THREAD @"setting_top_thread"

@interface NSUserDefaults (Setting)

- (void)setSignature:(BOOL)enable;

- (void)setTopThreadPost:(BOOL)show;

- (BOOL)isSignatureEnabled;

- (BOOL)isTopThreadPostCanShow;

@end
