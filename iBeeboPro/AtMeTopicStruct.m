//
//  AtMeTopicStruct.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "AtMeTopicStruct.h"


NSString *const kAtMeTopicStructIsInvalid = @"is_invalid";
NSString *const kAtMeTopicStructTopicTitle = @"topic_title";
NSString *const kAtMeTopicStructTopicUrl = @"topic_url";


@interface AtMeTopicStruct ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AtMeTopicStruct

@synthesize isInvalid = _isInvalid;
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
            self.isInvalid = [[self objectOrNilForKey:kAtMeTopicStructIsInvalid fromDictionary:dict] doubleValue];
            self.topicTitle = [self objectOrNilForKey:kAtMeTopicStructTopicTitle fromDictionary:dict];
            self.topicUrl = [self objectOrNilForKey:kAtMeTopicStructTopicUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isInvalid] forKey:kAtMeTopicStructIsInvalid];
    [mutableDict setValue:self.topicTitle forKey:kAtMeTopicStructTopicTitle];
    [mutableDict setValue:self.topicUrl forKey:kAtMeTopicStructTopicUrl];

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

    self.isInvalid = [aDecoder decodeDoubleForKey:kAtMeTopicStructIsInvalid];
    self.topicTitle = [aDecoder decodeObjectForKey:kAtMeTopicStructTopicTitle];
    self.topicUrl = [aDecoder decodeObjectForKey:kAtMeTopicStructTopicUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_isInvalid forKey:kAtMeTopicStructIsInvalid];
    [aCoder encodeObject:_topicTitle forKey:kAtMeTopicStructTopicTitle];
    [aCoder encodeObject:_topicUrl forKey:kAtMeTopicStructTopicUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    AtMeTopicStruct *copy = [[AtMeTopicStruct alloc] init];
    
    if (copy) {

        copy.isInvalid = self.isInvalid;
        copy.topicTitle = [self.topicTitle copyWithZone:zone];
        copy.topicUrl = [self.topicUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
