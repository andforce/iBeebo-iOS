//
//  TopicStruct.m
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "TopicStruct.h"


NSString *const kTopicStructTopicTitle = @"topic_title";
NSString *const kTopicStructTopicUrl = @"topic_url";


@interface TopicStruct ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation TopicStruct

@synthesize topicTitle = _topicTitle;
@synthesize topicUrl = _topicUrl;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.topicTitle = [self objectOrNilForKey:kTopicStructTopicTitle fromDictionary:dict];
            self.topicUrl = [self objectOrNilForKey:kTopicStructTopicUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.topicTitle forKey:kTopicStructTopicTitle];
    [mutableDict setValue:self.topicUrl forKey:kTopicStructTopicUrl];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.topicTitle = [aDecoder decodeObjectForKey:kTopicStructTopicTitle];
    self.topicUrl = [aDecoder decodeObjectForKey:kTopicStructTopicUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_topicTitle forKey:kTopicStructTopicTitle];
    [aCoder encodeObject:_topicUrl forKey:kTopicStructTopicUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    TopicStruct *copy = [[TopicStruct alloc] init];
    
    if (copy) {

        copy.topicTitle = [self.topicTitle copyWithZone:zone];
        copy.topicUrl = [self.topicUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
