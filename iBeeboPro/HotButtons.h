//
//  HotButtons.h
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HotActionlog, HotParams;

@interface HotButtons : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) HotActionlog *actionlog;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) HotParams *params;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
