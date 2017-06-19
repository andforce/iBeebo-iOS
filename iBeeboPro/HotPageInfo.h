//
//  HotPageInfo.h
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HotMediaInfo, HotPagePic;

@interface HotPageInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *pageTitle;
@property (nonatomic, strong) HotMediaInfo *mediaInfo;
@property (nonatomic, strong) NSString *content2;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *content1;
@property (nonatomic, strong) NSString *pageUrl;
@property (nonatomic, strong) HotPagePic *pagePic;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
