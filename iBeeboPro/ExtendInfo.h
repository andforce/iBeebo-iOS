//
//  ExtendInfo.h
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeiboCamera;

@interface ExtendInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) WeiboCamera *weiboCamera;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
