//
//  AtMeUrlStruct.h
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AtMeActionlog;

@interface AtMeUrlStruct : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL result;
@property (nonatomic, assign) double needSaveObj;
@property (nonatomic, assign) double position;
@property (nonatomic, strong) NSString *oriUrl;
@property (nonatomic, assign) double urlType;
@property (nonatomic, strong) NSString *urlTitle;
@property (nonatomic, strong) NSString *urlTypePic;
@property (nonatomic, strong) NSString *pageId;
@property (nonatomic, strong) NSString *log;
@property (nonatomic, strong) NSString *shortUrl;
@property (nonatomic, strong) AtMeActionlog *actionlog;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
