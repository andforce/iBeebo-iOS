//
//  MeWeiboProfilePage.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MeWeiboProfilePage.h"
#import "MeCardGroup.h"


NSString *const kMeWeiboProfilePageOpenurl = @"openurl";
NSString *const kMeWeiboProfilePageCardGroup = @"card_group";
NSString *const kMeWeiboProfilePageCardType = @"card_type";
NSString *const kMeWeiboProfilePageItemid = @"itemid";


@interface MeWeiboProfilePage ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MeWeiboProfilePage

@synthesize openurl = _openurl;
@synthesize cardGroup = _cardGroup;
@synthesize cardType = _cardType;
@synthesize itemid = _itemid;


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
            self.openurl = [self objectOrNilForKey:kMeWeiboProfilePageOpenurl fromDictionary:dict];
    NSObject *receivedMeCardGroup = [dict objectForKey:kMeWeiboProfilePageCardGroup];
    NSMutableArray *parsedMeCardGroup = [NSMutableArray array];
    if ([receivedMeCardGroup isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMeCardGroup) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMeCardGroup addObject:[MeCardGroup modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMeCardGroup isKindOfClass:[NSDictionary class]]) {
       [parsedMeCardGroup addObject:[MeCardGroup modelObjectWithDictionary:(NSDictionary *)receivedMeCardGroup]];
    }

    self.cardGroup = [NSArray arrayWithArray:parsedMeCardGroup];
            self.cardType = [[self objectOrNilForKey:kMeWeiboProfilePageCardType fromDictionary:dict] doubleValue];
            self.itemid = [self objectOrNilForKey:kMeWeiboProfilePageItemid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.openurl forKey:kMeWeiboProfilePageOpenurl];
    NSMutableArray *tempArrayForCardGroup = [NSMutableArray array];
    for (NSObject *subArrayObject in self.cardGroup) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCardGroup addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCardGroup addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCardGroup] forKey:kMeWeiboProfilePageCardGroup];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cardType] forKey:kMeWeiboProfilePageCardType];
    [mutableDict setValue:self.itemid forKey:kMeWeiboProfilePageItemid];

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

    self.openurl = [aDecoder decodeObjectForKey:kMeWeiboProfilePageOpenurl];
    self.cardGroup = [aDecoder decodeObjectForKey:kMeWeiboProfilePageCardGroup];
    self.cardType = [aDecoder decodeDoubleForKey:kMeWeiboProfilePageCardType];
    self.itemid = [aDecoder decodeObjectForKey:kMeWeiboProfilePageItemid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_openurl forKey:kMeWeiboProfilePageOpenurl];
    [aCoder encodeObject:_cardGroup forKey:kMeWeiboProfilePageCardGroup];
    [aCoder encodeDouble:_cardType forKey:kMeWeiboProfilePageCardType];
    [aCoder encodeObject:_itemid forKey:kMeWeiboProfilePageItemid];
}

- (id)copyWithZone:(NSZone *)zone
{
    MeWeiboProfilePage *copy = [[MeWeiboProfilePage alloc] init];
    
    if (copy) {

        copy.openurl = [self.openurl copyWithZone:zone];
        copy.cardGroup = [self.cardGroup copyWithZone:zone];
        copy.cardType = self.cardType;
        copy.itemid = [self.itemid copyWithZone:zone];
    }
    
    return copy;
}


@end
