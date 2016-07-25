//
//  ExtendInfo.m
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ExtendInfo.h"
#import "WeiboCamera.h"


NSString *const kExtendInfoWeiboCamera = @"weibo_camera";


@interface ExtendInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ExtendInfo

@synthesize weiboCamera = _weiboCamera;


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
            self.weiboCamera = [WeiboCamera modelObjectWithDictionary:[dict objectForKey:kExtendInfoWeiboCamera]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.weiboCamera dictionaryRepresentation] forKey:kExtendInfoWeiboCamera];

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

    self.weiboCamera = [aDecoder decodeObjectForKey:kExtendInfoWeiboCamera];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_weiboCamera forKey:kExtendInfoWeiboCamera];
}

- (id)copyWithZone:(NSZone *)zone
{
    ExtendInfo *copy = [[ExtendInfo alloc] init];
    
    if (copy) {

        copy.weiboCamera = [self.weiboCamera copyWithZone:zone];
    }
    
    return copy;
}


@end
