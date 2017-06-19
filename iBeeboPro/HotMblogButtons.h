//
//  HotMblogButtons.h
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HotActionlog;

@interface HotMblogButtons : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) HotActionlog *actionlog;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
