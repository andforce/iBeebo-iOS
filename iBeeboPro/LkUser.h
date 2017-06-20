//
//  LkUser.h
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LkH5icon;

@interface LkUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double mbtype;
@property (nonatomic, strong) LkH5icon *h5icon;
@property (nonatomic, strong) NSString *profileImageUrl;
@property (nonatomic, assign) double userIdentifier;
@property (nonatomic, strong) NSString *profileUrl;
@property (nonatomic, assign) BOOL verified;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, assign) double verifiedType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
