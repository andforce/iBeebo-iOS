//
//  AtMeAtMePage.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "AtMeAtMePage.h"
#import "AtMeCardGroup.h"


NSString *const kAtMeAtMePageNextCursor = @"next_cursor";
NSString *const kAtMeAtMePagePreviousCursor = @"previous_cursor";
NSString *const kAtMeAtMePageCardGroup = @"card_group";
NSString *const kAtMeAtMePageModType = @"mod_type";


@interface AtMeAtMePage ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AtMeAtMePage

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
            self.nextCursor = [self objectOrNilForKey:kAtMeAtMePageNextCursor fromDictionary:dict];
            self.previousCursor = [self objectOrNilForKey:kAtMeAtMePagePreviousCursor fromDictionary:dict];
    NSObject *receivedAtMeCardGroup = [dict objectForKey:kAtMeAtMePageCardGroup];
    NSMutableArray *parsedAtMeCardGroup = [NSMutableArray array];
    if ([receivedAtMeCardGroup isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAtMeCardGroup) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAtMeCardGroup addObject:[AtMeCardGroup modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAtMeCardGroup isKindOfClass:[NSDictionary class]]) {
       [parsedAtMeCardGroup addObject:[AtMeCardGroup modelObjectWithDictionary:(NSDictionary *)receivedAtMeCardGroup]];
    }

    self.cardGroup = [NSArray arrayWithArray:parsedAtMeCardGroup];
            self.modType = [self objectOrNilForKey:kAtMeAtMePageModType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.nextCursor forKey:kAtMeAtMePageNextCursor];
    [mutableDict setValue:self.previousCursor forKey:kAtMeAtMePagePreviousCursor];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCardGroup] forKey:kAtMeAtMePageCardGroup];
    [mutableDict setValue:self.modType forKey:kAtMeAtMePageModType];

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

    self.nextCursor = [aDecoder decodeObjectForKey:kAtMeAtMePageNextCursor];
    self.previousCursor = [aDecoder decodeObjectForKey:kAtMeAtMePagePreviousCursor];
    self.cardGroup = [aDecoder decodeObjectForKey:kAtMeAtMePageCardGroup];
    self.modType = [aDecoder decodeObjectForKey:kAtMeAtMePageModType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_nextCursor forKey:kAtMeAtMePageNextCursor];
    [aCoder encodeObject:_previousCursor forKey:kAtMeAtMePagePreviousCursor];
    [aCoder encodeObject:_cardGroup forKey:kAtMeAtMePageCardGroup];
    [aCoder encodeObject:_modType forKey:kAtMeAtMePageModType];
}

- (id)copyWithZone:(NSZone *)zone
{
    AtMeAtMePage *copy = [[AtMeAtMePage alloc] init];
    
    if (copy) {

        copy.nextCursor = [self.nextCursor copyWithZone:zone];
        copy.previousCursor = [self.previousCursor copyWithZone:zone];
        copy.cardGroup = [self.cardGroup copyWithZone:zone];
        copy.modType = [self.modType copyWithZone:zone];
    }
    
    return copy;
}


@end
