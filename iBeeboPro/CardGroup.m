//
//  CardGroup.m
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CardGroup.h"
#import "Mblog.h"


NSString *const kCardGroupMblog = @"mblog";
NSString *const kCardGroupCardType = @"card_type";


@interface CardGroup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CardGroup

@synthesize mblog = _mblog;
@synthesize cardType = _cardType;


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
            self.mblog = [Mblog modelObjectWithDictionary:[dict objectForKey:kCardGroupMblog]];
            self.cardType = [[self objectOrNilForKey:kCardGroupCardType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.mblog dictionaryRepresentation] forKey:kCardGroupMblog];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cardType] forKey:kCardGroupCardType];

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

    self.mblog = [aDecoder decodeObjectForKey:kCardGroupMblog];
    self.cardType = [aDecoder decodeDoubleForKey:kCardGroupCardType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_mblog forKey:kCardGroupMblog];
    [aCoder encodeDouble:_cardType forKey:kCardGroupCardType];
}

- (id)copyWithZone:(NSZone *)zone
{
    CardGroup *copy = [[CardGroup alloc] init];
    
    if (copy) {

        copy.mblog = [self.mblog copyWithZone:zone];
        copy.cardType = self.cardType;
    }
    
    return copy;
}


@end
