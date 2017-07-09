//
// Created by 迪远 王 on 2017/7/9.
// Copyright (c) 2017 andforce. All rights reserved.
//

#import "PicLargeMiddleSmall.h"


@implementation PicLargeMiddleSmall {

}

- (instancetype)initWithUrl:(NSString *)url {
    self = [super init];
    if (self){

        NSURL * URL =[NSURL URLWithString:url];
//        NSString * schema = [URL scheme];
//        NSString *host = URL.host;
        NSArray *path = url.pathComponents;

        NSString * pattern = @"%@//%@/%@/%@";
        _large = [NSString stringWithFormat:pattern, path[0], path[1], @"large", path[3]];
        _middle = [NSString stringWithFormat:pattern, path[0], path[1], @"bmiddle", path[3]];
        _small = [NSString stringWithFormat:pattern, path[0], path[1], @"thumbnail", path[3]];
    }
    return self;
}
@end
