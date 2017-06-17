//
//  CardGroup.m
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CardGroup.h"
#import "Mblog.h"


NSString *const kCardGroupText = @"text";
NSString *const kCardGroupCardType = @"card_type";
NSString *const kCardGroupMblog = @"mblog";
NSString *const kCardGroupScheme = @"scheme";
NSString *const kCardGroupModType = @"mod_type";


@interface CardGroup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CardGroup

@synthesize text = _text;
@synthesize cardType = _cardType;
@synthesize mblog = _mblog;
@synthesize scheme = _scheme;
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
            self.text = [self objectOrNilForKey:kCardGroupText fromDictionary:dict];
            self.cardType = [[self objectOrNilForKey:kCardGroupCardType fromDictionary:dict] doubleValue];
            self.mblog = [Mblog modelObjectWithDictionary:[dict objectForKey:kCardGroupMblog]];
            self.scheme = [self objectOrNilForKey:kCardGroupScheme fromDictionary:dict];
            self.modType = [self objectOrNilForKey:kCardGroupModType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.text forKey:kCardGroupText];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cardType] forKey:kCardGroupCardType];
    [mutableDict setValue:[self.mblog dictionaryRepresentation] forKey:kCardGroupMblog];
    [mutableDict setValue:self.scheme forKey:kCardGroupScheme];
    [mutableDict setValue:self.modType forKey:kCardGroupModType];

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

    self.text = [aDecoder decodeObjectForKey:kCardGroupText];
    self.cardType = [aDecoder decodeDoubleForKey:kCardGroupCardType];
    self.mblog = [aDecoder decodeObjectForKey:kCardGroupMblog];
    self.scheme = [aDecoder decodeObjectForKey:kCardGroupScheme];
    self.modType = [aDecoder decodeObjectForKey:kCardGroupModType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_text forKey:kCardGroupText];
    [aCoder encodeDouble:_cardType forKey:kCardGroupCardType];
    [aCoder encodeObject:_mblog forKey:kCardGroupMblog];
    [aCoder encodeObject:_scheme forKey:kCardGroupScheme];
    [aCoder encodeObject:_modType forKey:kCardGroupModType];
}

- (id)copyWithZone:(NSZone *)zone
{
    CardGroup *copy = [[CardGroup alloc] init];
    
    if (copy) {

        copy.text = [self.text copyWithZone:zone];
        copy.cardType = self.cardType;
        copy.mblog = [self.mblog copyWithZone:zone];
        copy.scheme = [self.scheme copyWithZone:zone];
        copy.modType = [self.modType copyWithZone:zone];
    }
    
    return copy;
}


@end
