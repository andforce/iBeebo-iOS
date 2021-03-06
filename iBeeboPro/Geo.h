//
//  Geo.h
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Geo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *width;
@property (nonatomic, assign) BOOL croped;
@property (nonatomic, strong) NSString *height;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
