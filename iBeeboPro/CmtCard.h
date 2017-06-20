//
//  CmtCard.h
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CmtCard : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *pageDesc;
@property (nonatomic, strong) NSString *pageTitle;
@property (nonatomic, assign) double pageId;
@property (nonatomic, strong) NSString *pageUrl;
@property (nonatomic, strong) NSString *pagePic;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
