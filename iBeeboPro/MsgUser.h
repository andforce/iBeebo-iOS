//
//  MsgUser.h
//
//  Created by   on 2017/6/20
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MsgUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double verifiedType;
@property (nonatomic, assign) double userIdentifier;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSString *avatarLarge;
@property (nonatomic, assign) BOOL verified;
@property (nonatomic, strong) NSString *remark;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
