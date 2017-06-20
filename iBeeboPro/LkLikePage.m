//
//  LkLikePage.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LkLikePage.h"
#import "LkCardGroup.h"


NSString *const kLkLikePageNextCursor = @"next_cursor";
NSString *const kLkLikePagePreviousCursor = @"previous_cursor";
NSString *const kLkLikePageCardGroup = @"card_group";
NSString *const kLkLikePageModType = @"mod_type";


@interface LkLikePage ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LkLikePage

@synthesize nextCursor = _nextCursor;
@synthesize previousCursor = _previousCursor;
@synthesize cardGroup = _cardGroup;
@synthesize modType = _modType;


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
            self.nextCursor = [self objectOrNilForKey:kLkLikePageNextCursor fromDictionary:dict];
            self.previousCursor = [self objectOrNilForKey:kLkLikePagePreviousCursor fromDictionary:dict];
    NSObject *receivedLkCardGroup = [dict objectForKey:kLkLikePageCardGroup];
    NSMutableArray *parsedLkCardGroup = [NSMutableArray array];
    if ([receivedLkCardGroup isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLkCardGroup) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLkCardGroup addObject:[LkCardGroup modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLkCardGroup isKindOfClass:[NSDictionary class]]) {
       [parsedLkCardGroup addObject:[LkCardGroup modelObjectWithDictionary:(NSDictionary *)receivedLkCardGroup]];
    }

    self.cardGroup = [NSArray arrayWithArray:parsedLkCardGroup];
            self.modType = [self objectOrNilForKey:kLkLikePageModType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.nextCursor forKey:kLkLikePageNextCursor];
    [mutableDict setValue:self.previousCursor forKey:kLkLikePagePreviousCursor];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCardGroup] forKey:kLkLikePageCardGroup];
    [mutableDict setValue:self.modType forKey:kLkLikePageModType];

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

    self.nextCursor = [aDecoder decodeObjectForKey:kLkLikePageNextCursor];
    self.previousCursor = [aDecoder decodeObjectForKey:kLkLikePagePreviousCursor];
    self.cardGroup = [aDecoder decodeObjectForKey:kLkLikePageCardGroup];
    self.modType = [aDecoder decodeObjectForKey:kLkLikePageModType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_nextCursor forKey:kLkLikePageNextCursor];
    [aCoder encodeObject:_previousCursor forKey:kLkLikePagePreviousCursor];
    [aCoder encodeObject:_cardGroup forKey:kLkLikePageCardGroup];
    [aCoder encodeObject:_modType forKey:kLkLikePageModType];
}

- (id)copyWithZone:(NSZone *)zone
{
    LkLikePage *copy = [[LkLikePage alloc] init];
    
    if (copy) {

        copy.nextCursor = [self.nextCursor copyWithZone:zone];
        copy.previousCursor = [self.previousCursor copyWithZone:zone];
        copy.cardGroup = [self.cardGroup copyWithZone:zone];
        copy.modType = [self.modType copyWithZone:zone];
    }
    
    return copy;
}


@end
