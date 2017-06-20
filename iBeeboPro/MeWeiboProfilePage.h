//
//  MeWeiboProfilePage.h
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MeWeiboProfilePage : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *openurl;
@property (nonatomic, strong) NSArray *cardGroup;
@property (nonatomic, assign) double cardType;
@property (nonatomic, strong) NSString *itemid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
