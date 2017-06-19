//
//  HotActionlog.h
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HotActionlog : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *cardid;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *uicode;
@property (nonatomic, strong) NSString *ext;
@property (nonatomic, strong) NSString *actCode;
@property (nonatomic, strong) NSString *fid;
@property (nonatomic, strong) NSString *oid;
@property (nonatomic, strong) NSString *lfid;
@property (nonatomic, strong) NSString *actType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
