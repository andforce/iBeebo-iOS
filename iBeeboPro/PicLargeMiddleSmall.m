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

        if ([url containsString:@"orj480"]) {
            _large = url;
            _middle = [url stringByReplacingOccurrencesOfString:@"orj480" withString:@"bmiddle"];
            _small = [url stringByReplacingOccurrencesOfString:@"orj480" withString:@"thumbnail"];
            
        } else if ([url containsString:@"large"]){

            _large = url;
            _middle = [url stringByReplacingOccurrencesOfString:@"large" withString:@"bmiddle"];
            _small = [url stringByReplacingOccurrencesOfString:@"large" withString:@"thumbnail"];

        } else if ([url containsString:@"thumbnail"]){

            _large = [url stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"large"];
            _middle = [url stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
            _small = url;

        } else if ([url containsString:@"bmiddle"]){

            _large = [url stringByReplacingOccurrencesOfString:@"bmiddle" withString:@"large"];
            _middle = url;
            _small = [url stringByReplacingOccurrencesOfString:@"bmiddle" withString:@"thumbnail"];

        }
    }
    return self;
}
@end
