//
//  HotWeiboTags.h
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HotWeiboTags : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *tagName;
@property (nonatomic, assign) double tagWeight;
@property (nonatomic, strong) NSString *fromCateid;
@property (nonatomic, assign) double tagHidden;
@property (nonatomic, strong) NSString *urlTypePic;
@property (nonatomic, strong) NSString *containerid;
@property (nonatomic, assign) double tagType;
@property (nonatomic, strong) NSString *tagScheme;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
