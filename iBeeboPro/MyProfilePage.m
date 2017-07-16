//
//  MyProfilePage.m
//
//  Created by   on 2017/7/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MyProfilePage.h"
#import "MyProfileCardGroup.h"


NSString *const kMyProfilePageOpenurl = @"openurl";
NSString *const kMyProfilePageCardGroup = @"card_group";
NSString *const kMyProfilePageCardType = @"card_type";
NSString *const kMyProfilePageItemid = @"itemid";


@interface MyProfilePage ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MyProfilePage

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
            self.openurl = [self objectOrNilForKey:kMyProfilePageOpenurl fromDictionary:dict];
    NSObject *receivedMyProfileCardGroup = [dict objectForKey:kMyProfilePageCardGroup];
    NSMutableArray *parsedMyProfileCardGroup = [NSMutableArray array];
    if ([receivedMyProfileCardGroup isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMyProfileCardGroup) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMyProfileCardGroup addObject:[MyProfileCardGroup modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMyProfileCardGroup isKindOfClass:[NSDictionary class]]) {
       [parsedMyProfileCardGroup addObject:[MyProfileCardGroup modelObjectWithDictionary:(NSDictionary *)receivedMyProfileCardGroup]];
    }

    self.cardGroup = [NSArray arrayWithArray:parsedMyProfileCardGroup];
            self.cardType = [[self objectOrNilForKey:kMyProfilePageCardType fromDictionary:dict] doubleValue];
            self.itemid = [self objectOrNilForKey:kMyProfilePageItemid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.openurl forKey:kMyProfilePageOpenurl];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCardGroup] forKey:kMyProfilePageCardGroup];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cardType] forKey:kMyProfilePageCardType];
    [mutableDict setValue:self.itemid forKey:kMyProfilePageItemid];

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

    self.openurl = [aDecoder decodeObjectForKey:kMyProfilePageOpenurl];
    self.cardGroup = [aDecoder decodeObjectForKey:kMyProfilePageCardGroup];
    self.cardType = [aDecoder decodeDoubleForKey:kMyProfilePageCardType];
    self.itemid = [aDecoder decodeObjectForKey:kMyProfilePageItemid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_openurl forKey:kMyProfilePageOpenurl];
    [aCoder encodeObject:_cardGroup forKey:kMyProfilePageCardGroup];
    [aCoder encodeDouble:_cardType forKey:kMyProfilePageCardType];
    [aCoder encodeObject:_itemid forKey:kMyProfilePageItemid];
}

- (id)copyWithZone:(NSZone *)zone
{
    MyProfilePage *copy = [[MyProfilePage alloc] init];
    
    if (copy) {

        copy.openurl = [self.openurl copyWithZone:zone];
        copy.cardGroup = [self.cardGroup copyWithZone:zone];
        copy.cardType = self.cardType;
        copy.itemid = [self.itemid copyWithZone:zone];
    }
    
    return copy;
}


@end
