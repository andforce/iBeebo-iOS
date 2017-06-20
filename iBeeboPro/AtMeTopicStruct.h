//
//  AtMeTopicStruct.h
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AtMeTopicStruct : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double isInvalid;
@property (nonatomic, strong) NSString *topicTitle;
@property (nonatomic, strong) NSString *topicUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
