//
// Created by 迪远 王 on 2017/7/9.
// Copyright (c) 2017 andforce. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PicLargeMiddleSmall : NSObject

@property (nullable, nonatomic, readonly, copy) NSString *large;
@property (nullable, nonatomic, readonly, copy) NSString *middle;
@property (nullable, nonatomic, readonly, copy) NSString *small;

-(instancetype) initWithUrl:(NSString *)url;
@end