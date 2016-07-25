//
//  PageInfo.h
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Actionlog;

@interface PageInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *pageDesc;
@property (nonatomic, strong) NSString *pageId;
@property (nonatomic, strong) Actionlog *actionlog;
@property (nonatomic, strong) NSString *content1;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *objectType;
@property (nonatomic, strong) NSString *tips;
@property (nonatomic, strong) NSString *content2;
@property (nonatomic, strong) NSString *pageTitle;
@property (nonatomic, strong) NSString *pageUrl;
@property (nonatomic, strong) NSString *objectId;
@property (nonatomic, strong) NSString *pagePic;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
