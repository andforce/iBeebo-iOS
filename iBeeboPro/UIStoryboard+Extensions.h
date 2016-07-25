//
//  UIStoryboard+Extensions.h
//  iBeeboPro
//
//  Created by 迪远 王 on 16/7/24.
//  Copyright © 2016年 andforce. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIStoryboard(Extensions)

+ (UIStoryboard *)mainStoryboard;

- (__kindof UIViewController *)instantiateViewController:(Class)controller;

-(void)changeRootViewController:(Class)controller;
@end
