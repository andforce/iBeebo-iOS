//
//  UrlStruct.h
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface UrlStruct : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL result;
@property (nonatomic, assign) double needSaveObj;
@property (nonatomic, assign) double position;
@property (nonatomic, strong) NSString *oriUrl;
@property (nonatomic, assign) double urlType;
@property (nonatomic, strong) NSString *urlTitle;
@property (nonatomic, strong) NSString *urlTypePic;
@property (nonatomic, strong) NSString *log;
@property (nonatomic, strong) NSString *shortUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
