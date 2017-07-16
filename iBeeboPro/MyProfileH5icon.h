//
//  MyProfileH5icon.h
//
//  Created by   on 2017/7/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MyProfileH5icon : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *other;
@property (nonatomic, strong) NSString *main;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
