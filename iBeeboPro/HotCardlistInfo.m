//
//  HotCardlistInfo.m
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HotCardlistInfo.h"


NSString *const kHotCardlistInfoCanShared = @"can_shared";
NSString *const kHotCardlistInfoSinceId = @"since_id";
NSString *const kHotCardlistInfoShowStyle = @"show_style";
NSString *const kHotCardlistInfoTitleTop = @"title_top";
NSString *const kHotCardlistInfoVP = @"v_p";
NSString *const kHotCardlistInfoContainerid = @"containerid";
NSString *const kHotCardlistInfoCardlistTitle = @"cardlist_title";
NSString *const kHotCardlistInfoTotal = @"total";
NSString *const kHotCardlistInfoDesc = @"desc";
NSString *const kHotCardlistInfoStatisticsFrom = @"statistics_from";


@interface HotCardlistInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotCardlistInfo

@synthesize canShared = _canShared;
@synthesize sinceId = _sinceId;
@synthesize showStyle = _showStyle;
@synthesize titleTop = _titleTop;
@synthesize vP = _vP;
@synthesize containerid = _containerid;
@synthesize cardlistTitle = _cardlistTitle;
@synthesize total = _total;
@synthesize desc = _desc;
@synthesize statisticsFrom = _statisticsFrom;


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
            self.canShared = [[self objectOrNilForKey:kHotCardlistInfoCanShared fromDictionary:dict] doubleValue];
            self.sinceId = [[self objectOrNilForKey:kHotCardlistInfoSinceId fromDictionary:dict] doubleValue];
            self.showStyle = [[self objectOrNilForKey:kHotCardlistInfoShowStyle fromDictionary:dict] doubleValue];
            self.titleTop = [self objectOrNilForKey:kHotCardlistInfoTitleTop fromDictionary:dict];
            self.vP = [self objectOrNilForKey:kHotCardlistInfoVP fromDictionary:dict];
            self.containerid = [self objectOrNilForKey:kHotCardlistInfoContainerid fromDictionary:dict];
            self.cardlistTitle = [self objectOrNilForKey:kHotCardlistInfoCardlistTitle fromDictionary:dict];
            self.total = [[self objectOrNilForKey:kHotCardlistInfoTotal fromDictionary:dict] doubleValue];
            self.desc = [self objectOrNilForKey:kHotCardlistInfoDesc fromDictionary:dict];
            self.statisticsFrom = [self objectOrNilForKey:kHotCardlistInfoStatisticsFrom fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.canShared] forKey:kHotCardlistInfoCanShared];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sinceId] forKey:kHotCardlistInfoSinceId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.showStyle] forKey:kHotCardlistInfoShowStyle];
    [mutableDict setValue:self.titleTop forKey:kHotCardlistInfoTitleTop];
    [mutableDict setValue:self.vP forKey:kHotCardlistInfoVP];
    [mutableDict setValue:self.containerid forKey:kHotCardlistInfoContainerid];
    [mutableDict setValue:self.cardlistTitle forKey:kHotCardlistInfoCardlistTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kHotCardlistInfoTotal];
    [mutableDict setValue:self.desc forKey:kHotCardlistInfoDesc];
    [mutableDict setValue:self.statisticsFrom forKey:kHotCardlistInfoStatisticsFrom];

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

    self.canShared = [aDecoder decodeDoubleForKey:kHotCardlistInfoCanShared];
    self.sinceId = [aDecoder decodeDoubleForKey:kHotCardlistInfoSinceId];
    self.showStyle = [aDecoder decodeDoubleForKey:kHotCardlistInfoShowStyle];
    self.titleTop = [aDecoder decodeObjectForKey:kHotCardlistInfoTitleTop];
    self.vP = [aDecoder decodeObjectForKey:kHotCardlistInfoVP];
    self.containerid = [aDecoder decodeObjectForKey:kHotCardlistInfoContainerid];
    self.cardlistTitle = [aDecoder decodeObjectForKey:kHotCardlistInfoCardlistTitle];
    self.total = [aDecoder decodeDoubleForKey:kHotCardlistInfoTotal];
    self.desc = [aDecoder decodeObjectForKey:kHotCardlistInfoDesc];
    self.statisticsFrom = [aDecoder decodeObjectForKey:kHotCardlistInfoStatisticsFrom];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_canShared forKey:kHotCardlistInfoCanShared];
    [aCoder encodeDouble:_sinceId forKey:kHotCardlistInfoSinceId];
    [aCoder encodeDouble:_showStyle forKey:kHotCardlistInfoShowStyle];
    [aCoder encodeObject:_titleTop forKey:kHotCardlistInfoTitleTop];
    [aCoder encodeObject:_vP forKey:kHotCardlistInfoVP];
    [aCoder encodeObject:_containerid forKey:kHotCardlistInfoContainerid];
    [aCoder encodeObject:_cardlistTitle forKey:kHotCardlistInfoCardlistTitle];
    [aCoder encodeDouble:_total forKey:kHotCardlistInfoTotal];
    [aCoder encodeObject:_desc forKey:kHotCardlistInfoDesc];
    [aCoder encodeObject:_statisticsFrom forKey:kHotCardlistInfoStatisticsFrom];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotCardlistInfo *copy = [[HotCardlistInfo alloc] init];
    
    if (copy) {

        copy.canShared = self.canShared;
        copy.sinceId = self.sinceId;
        copy.showStyle = self.showStyle;
        copy.titleTop = [self.titleTop copyWithZone:zone];
        copy.vP = [self.vP copyWithZone:zone];
        copy.containerid = [self.containerid copyWithZone:zone];
        copy.cardlistTitle = [self.cardlistTitle copyWithZone:zone];
        copy.total = self.total;
        copy.desc = [self.desc copyWithZone:zone];
        copy.statisticsFrom = [self.statisticsFrom copyWithZone:zone];
    }
    
    return copy;
}


@end
