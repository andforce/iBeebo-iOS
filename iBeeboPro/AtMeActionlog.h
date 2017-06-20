//
//  AtMeActionlog.h
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AtMeActionlog : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *cardid;
@property (nonatomic, strong) NSString *mid;
@property (nonatomic, strong) NSString *ext;
@property (nonatomic, assign) double actCode;
@property (nonatomic, assign) double uuid;
@property (nonatomic, assign) id fid;
@property (nonatomic, strong) NSString *lcardid;
@property (nonatomic, assign) double actType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
