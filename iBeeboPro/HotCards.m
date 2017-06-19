//
//  HotCards.m
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HotCards.h"
#import "HotMblogButtons.h"
#import "HotMblog.h"


NSString *const kHotCardsItemid = @"itemid";
NSString *const kHotCardsScheme = @"scheme";
NSString *const kHotCardsCardType = @"card_type";
NSString *const kHotCardsMblogButtons = @"mblog_buttons";
NSString *const kHotCardsWeiboNeed = @"weibo_need";
NSString *const kHotCardsMblog = @"mblog";
NSString *const kHotCardsShowType = @"show_type";
NSString *const kHotCardsOpenurl = @"openurl";


@interface HotCards ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotCards

@synthesize itemid = _itemid;
@synthesize scheme = _scheme;
@synthesize cardType = _cardType;
@synthesize mblogButtons = _mblogButtons;
@synthesize weiboNeed = _weiboNeed;
@synthesize mblog = _mblog;
@synthesize showType = _showType;
@synthesize openurl = _openurl;


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
            self.itemid = [self objectOrNilForKey:kHotCardsItemid fromDictionary:dict];
            self.scheme = [self objectOrNilForKey:kHotCardsScheme fromDictionary:dict];
            self.cardType = [[self objectOrNilForKey:kHotCardsCardType fromDictionary:dict] doubleValue];
    NSObject *receivedHotMblogButtons = [dict objectForKey:kHotCardsMblogButtons];
    NSMutableArray *parsedHotMblogButtons = [NSMutableArray array];
    if ([receivedHotMblogButtons isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotMblogButtons) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotMblogButtons addObject:[HotMblogButtons modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotMblogButtons isKindOfClass:[NSDictionary class]]) {
       [parsedHotMblogButtons addObject:[HotMblogButtons modelObjectWithDictionary:(NSDictionary *)receivedHotMblogButtons]];
    }

    self.mblogButtons = [NSArray arrayWithArray:parsedHotMblogButtons];
            self.weiboNeed = [self objectOrNilForKey:kHotCardsWeiboNeed fromDictionary:dict];
            self.mblog = [HotMblog modelObjectWithDictionary:[dict objectForKey:kHotCardsMblog]];
            self.showType = [[self objectOrNilForKey:kHotCardsShowType fromDictionary:dict] doubleValue];
            self.openurl = [self objectOrNilForKey:kHotCardsOpenurl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.itemid forKey:kHotCardsItemid];
    [mutableDict setValue:self.scheme forKey:kHotCardsScheme];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cardType] forKey:kHotCardsCardType];
    NSMutableArray *tempArrayForMblogButtons = [NSMutableArray array];
    for (NSObject *subArrayObject in self.mblogButtons) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMblogButtons addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMblogButtons addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMblogButtons] forKey:kHotCardsMblogButtons];
    [mutableDict setValue:self.weiboNeed forKey:kHotCardsWeiboNeed];
    [mutableDict setValue:[self.mblog dictionaryRepresentation] forKey:kHotCardsMblog];
    [mutableDict setValue:[NSNumber numberWithDouble:self.showType] forKey:kHotCardsShowType];
    [mutableDict setValue:self.openurl forKey:kHotCardsOpenurl];

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

    self.itemid = [aDecoder decodeObjectForKey:kHotCardsItemid];
    self.scheme = [aDecoder decodeObjectForKey:kHotCardsScheme];
    self.cardType = [aDecoder decodeDoubleForKey:kHotCardsCardType];
    self.mblogButtons = [aDecoder decodeObjectForKey:kHotCardsMblogButtons];
    self.weiboNeed = [aDecoder decodeObjectForKey:kHotCardsWeiboNeed];
    self.mblog = [aDecoder decodeObjectForKey:kHotCardsMblog];
    self.showType = [aDecoder decodeDoubleForKey:kHotCardsShowType];
    self.openurl = [aDecoder decodeObjectForKey:kHotCardsOpenurl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_itemid forKey:kHotCardsItemid];
    [aCoder encodeObject:_scheme forKey:kHotCardsScheme];
    [aCoder encodeDouble:_cardType forKey:kHotCardsCardType];
    [aCoder encodeObject:_mblogButtons forKey:kHotCardsMblogButtons];
    [aCoder encodeObject:_weiboNeed forKey:kHotCardsWeiboNeed];
    [aCoder encodeObject:_mblog forKey:kHotCardsMblog];
    [aCoder encodeDouble:_showType forKey:kHotCardsShowType];
    [aCoder encodeObject:_openurl forKey:kHotCardsOpenurl];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotCards *copy = [[HotCards alloc] init];
    
    if (copy) {

        copy.itemid = [self.itemid copyWithZone:zone];
        copy.scheme = [self.scheme copyWithZone:zone];
        copy.cardType = self.cardType;
        copy.mblogButtons = [self.mblogButtons copyWithZone:zone];
        copy.weiboNeed = [self.weiboNeed copyWithZone:zone];
        copy.mblog = [self.mblog copyWithZone:zone];
        copy.showType = self.showType;
        copy.openurl = [self.openurl copyWithZone:zone];
    }
    
    return copy;
}


@end
