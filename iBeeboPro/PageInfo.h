//
//  PageInfo.h
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Author, PicInfo, MediaInfo;

@interface PageInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *pageDesc;
@property (nonatomic, strong) Author *author;
@property (nonatomic, strong) NSString *content1;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *objectType;
@property (nonatomic, strong) NSString *pageUrl;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *pageTitle;
@property (nonatomic, strong) NSString *content2;
@property (nonatomic, strong) PicInfo *picInfo;
@property (nonatomic, strong) MediaInfo *mediaInfo;
@property (nonatomic, strong) NSString *pagePic;
@property (nonatomic, strong) NSArray *cards;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
