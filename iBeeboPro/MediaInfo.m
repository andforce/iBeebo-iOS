//
//  MediaInfo.m
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MediaInfo.h"


NSString *const kMediaInfoStreamUrl = @"stream_url";
NSString *const kMediaInfoGoto = @"goto";


@interface MediaInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MediaInfo

@synthesize streamUrl = _streamUrl;
@synthesize gotoProperty = _gotoProperty;


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
            self.streamUrl = [self objectOrNilForKey:kMediaInfoStreamUrl fromDictionary:dict];
            self.gotoProperty = [[self objectOrNilForKey:kMediaInfoGoto fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.streamUrl forKey:kMediaInfoStreamUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gotoProperty] forKey:kMediaInfoGoto];

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

    self.streamUrl = [aDecoder decodeObjectForKey:kMediaInfoStreamUrl];
    self.gotoProperty = [aDecoder decodeDoubleForKey:kMediaInfoGoto];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_streamUrl forKey:kMediaInfoStreamUrl];
    [aCoder encodeDouble:_gotoProperty forKey:kMediaInfoGoto];
}

- (id)copyWithZone:(NSZone *)zone
{
    MediaInfo *copy = [[MediaInfo alloc] init];
    
    if (copy) {

        copy.streamUrl = [self.streamUrl copyWithZone:zone];
        copy.gotoProperty = self.gotoProperty;
    }
    
    return copy;
}


@end
