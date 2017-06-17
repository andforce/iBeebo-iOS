//
//  Author.h
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Author : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *profileImageUrl;
@property (nonatomic, strong) NSString *screenName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
