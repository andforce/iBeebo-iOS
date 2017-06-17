//
//  MediaInfo.h
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MediaInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *streamUrl;
@property (nonatomic, assign) double gotoProperty;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
