//
//  HotCardlistInfo.h
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HotCardlistInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double canShared;
@property (nonatomic, assign) double sinceId;
@property (nonatomic, assign) double showStyle;
@property (nonatomic, strong) NSString *titleTop;
@property (nonatomic, strong) NSString *vP;
@property (nonatomic, strong) NSString *containerid;
@property (nonatomic, strong) NSString *cardlistTitle;
@property (nonatomic, assign) double total;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *statisticsFrom;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
