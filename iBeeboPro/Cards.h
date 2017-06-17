//
//  Cards.h
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PicInfo;

@interface Cards : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *pagePic;
@property (nonatomic, strong) NSString *typeIcon;
@property (nonatomic, strong) PicInfo *picInfo;
@property (nonatomic, strong) NSString *content2;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *pageUrl;
@property (nonatomic, strong) NSString *content1;
@property (nonatomic, strong) NSString *pageTitle;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
