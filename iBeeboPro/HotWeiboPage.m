//
//  HotWeiboPage.m
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HotWeiboPage.h"
#import "HotCardlistInfo.h"
#import "HotCards.h"


NSString *const kHotWeiboPageOk = @"ok";
NSString *const kHotWeiboPageSeeLevel = @"seeLevel";
NSString *const kHotWeiboPageCardlistInfo = @"cardlistInfo";
NSString *const kHotWeiboPageCards = @"cards";
NSString *const kHotWeiboPageShowAppTips = @"showAppTips";
NSString *const kHotWeiboPageScheme = @"scheme";


@interface HotWeiboPage ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotWeiboPage

@synthesize ok = _ok;
@synthesize seeLevel = _seeLevel;
@synthesize cardlistInfo = _cardlistInfo;
@synthesize cards = _cards;
@synthesize showAppTips = _showAppTips;
@synthesize scheme = _scheme;


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
            self.ok = [[self objectOrNilForKey:kHotWeiboPageOk fromDictionary:dict] doubleValue];
            self.seeLevel = [[self objectOrNilForKey:kHotWeiboPageSeeLevel fromDictionary:dict] doubleValue];
            self.cardlistInfo = [HotCardlistInfo modelObjectWithDictionary:[dict objectForKey:kHotWeiboPageCardlistInfo]];
    NSObject *receivedHotCards = [dict objectForKey:kHotWeiboPageCards];
    NSMutableArray *parsedHotCards = [NSMutableArray array];
    if ([receivedHotCards isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotCards) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotCards addObject:[HotCards modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotCards isKindOfClass:[NSDictionary class]]) {
       [parsedHotCards addObject:[HotCards modelObjectWithDictionary:(NSDictionary *)receivedHotCards]];
    }

    self.cards = [NSArray arrayWithArray:parsedHotCards];
            self.showAppTips = [[self objectOrNilForKey:kHotWeiboPageShowAppTips fromDictionary:dict] doubleValue];
            self.scheme = [self objectOrNilForKey:kHotWeiboPageScheme fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ok] forKey:kHotWeiboPageOk];
    [mutableDict setValue:[NSNumber numberWithDouble:self.seeLevel] forKey:kHotWeiboPageSeeLevel];
    [mutableDict setValue:[self.cardlistInfo dictionaryRepresentation] forKey:kHotWeiboPageCardlistInfo];
    NSMutableArray *tempArrayForCards = [NSMutableArray array];
    for (NSObject *subArrayObject in self.cards) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCards addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCards addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCards] forKey:kHotWeiboPageCards];
    [mutableDict setValue:[NSNumber numberWithDouble:self.showAppTips] forKey:kHotWeiboPageShowAppTips];
    [mutableDict setValue:self.scheme forKey:kHotWeiboPageScheme];

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

    self.ok = [aDecoder decodeDoubleForKey:kHotWeiboPageOk];
    self.seeLevel = [aDecoder decodeDoubleForKey:kHotWeiboPageSeeLevel];
    self.cardlistInfo = [aDecoder decodeObjectForKey:kHotWeiboPageCardlistInfo];
    self.cards = [aDecoder decodeObjectForKey:kHotWeiboPageCards];
    self.showAppTips = [aDecoder decodeDoubleForKey:kHotWeiboPageShowAppTips];
    self.scheme = [aDecoder decodeObjectForKey:kHotWeiboPageScheme];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_ok forKey:kHotWeiboPageOk];
    [aCoder encodeDouble:_seeLevel forKey:kHotWeiboPageSeeLevel];
    [aCoder encodeObject:_cardlistInfo forKey:kHotWeiboPageCardlistInfo];
    [aCoder encodeObject:_cards forKey:kHotWeiboPageCards];
    [aCoder encodeDouble:_showAppTips forKey:kHotWeiboPageShowAppTips];
    [aCoder encodeObject:_scheme forKey:kHotWeiboPageScheme];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotWeiboPage *copy = [[HotWeiboPage alloc] init];
    
    if (copy) {

        copy.ok = self.ok;
        copy.seeLevel = self.seeLevel;
        copy.cardlistInfo = [self.cardlistInfo copyWithZone:zone];
        copy.cards = [self.cards copyWithZone:zone];
        copy.showAppTips = self.showAppTips;
        copy.scheme = [self.scheme copyWithZone:zone];
    }
    
    return copy;
}


@end
