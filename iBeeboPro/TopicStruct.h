//
//  TopicStruct.h
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface TopicStruct : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *topicTitle;
@property (nonatomic, strong) NSString *topicUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
