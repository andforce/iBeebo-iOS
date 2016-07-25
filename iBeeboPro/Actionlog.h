//
//  Actionlog.h
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Actionlog : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *ext;
@property (nonatomic, strong) NSString *oid;
@property (nonatomic, assign) double actCode;
@property (nonatomic, assign) double actType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
