//
//  H5icon.h
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface H5icon : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *other;
@property (nonatomic, strong) NSString *main;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
