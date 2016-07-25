//
//  CardGroup2.m
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CardGroup2.h"
#import "CardGroup.h"


NSString *const kCardGroup2CardGroup = @"card_group";
NSString *const kCardGroup2LoadMore = @"loadMore";
NSString *const kCardGroup2ModType = @"mod_type";
NSString *const kCardGroup2NextCursor = @"next_cursor";
NSString *const kCardGroup2PreviousCursor = @"previous_cursor";
NSString *const kCardGroup2Page = @"page";
NSString *const kCardGroup2MaxPage = @"maxPage";
NSString *const kCardGroup2Url = @"url";


@interface CardGroup2 ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CardGroup2

@synthesize cardGroup = _cardGroup;
@synthesize loadMore = _loadMore;
@synthesize modType = _modType;
@synthesize nextCursor = _nextCursor;
@synthesize previousCursor = _previousCursor;
@synthesize page = _page;
@synthesize maxPage = _maxPage;
@synthesize url = _url;


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
    NSObject *receivedCardGroup = [dict objectForKey:kCardGroup2CardGroup];
    NSMutableArray *parsedCardGroup = [NSMutableArray array];
    if ([receivedCardGroup isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCardGroup) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCardGroup addObject:[CardGroup modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCardGroup isKindOfClass:[NSDictionary class]]) {
       [parsedCardGroup addObject:[CardGroup modelObjectWithDictionary:(NSDictionary *)receivedCardGroup]];
    }

    self.cardGroup = [NSArray arrayWithArray:parsedCardGroup];
            self.loadMore = [[self objectOrNilForKey:kCardGroup2LoadMore fromDictionary:dict] boolValue];
            self.modType = [self objectOrNilForKey:kCardGroup2ModType fromDictionary:dict];
            self.nextCursor = [[self objectOrNilForKey:kCardGroup2NextCursor fromDictionary:dict] doubleValue];
            self.previousCursor = [[self objectOrNilForKey:kCardGroup2PreviousCursor fromDictionary:dict] doubleValue];
            self.page = [[self objectOrNilForKey:kCardGroup2Page fromDictionary:dict] doubleValue];
            self.maxPage = [[self objectOrNilForKey:kCardGroup2MaxPage fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:kCardGroup2Url fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCardGroup] forKey:kCardGroup2CardGroup];
    [mutableDict setValue:[NSNumber numberWithBool:self.loadMore] forKey:kCardGroup2LoadMore];
    [mutableDict setValue:self.modType forKey:kCardGroup2ModType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.nextCursor] forKey:kCardGroup2NextCursor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.previousCursor] forKey:kCardGroup2PreviousCursor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kCardGroup2Page];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxPage] forKey:kCardGroup2MaxPage];
    [mutableDict setValue:self.url forKey:kCardGroup2Url];

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

    self.cardGroup = [aDecoder decodeObjectForKey:kCardGroup2CardGroup];
    self.loadMore = [aDecoder decodeBoolForKey:kCardGroup2LoadMore];
    self.modType = [aDecoder decodeObjectForKey:kCardGroup2ModType];
    self.nextCursor = [aDecoder decodeDoubleForKey:kCardGroup2NextCursor];
    self.previousCursor = [aDecoder decodeDoubleForKey:kCardGroup2PreviousCursor];
    self.page = [aDecoder decodeDoubleForKey:kCardGroup2Page];
    self.maxPage = [aDecoder decodeDoubleForKey:kCardGroup2MaxPage];
    self.url = [aDecoder decodeObjectForKey:kCardGroup2Url];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_cardGroup forKey:kCardGroup2CardGroup];
    [aCoder encodeBool:_loadMore forKey:kCardGroup2LoadMore];
    [aCoder encodeObject:_modType forKey:kCardGroup2ModType];
    [aCoder encodeDouble:_nextCursor forKey:kCardGroup2NextCursor];
    [aCoder encodeDouble:_previousCursor forKey:kCardGroup2PreviousCursor];
    [aCoder encodeDouble:_page forKey:kCardGroup2Page];
    [aCoder encodeDouble:_maxPage forKey:kCardGroup2MaxPage];
    [aCoder encodeObject:_url forKey:kCardGroup2Url];
}

- (id)copyWithZone:(NSZone *)zone
{
    CardGroup2 *copy = [[CardGroup2 alloc] init];
    
    if (copy) {

        copy.cardGroup = [self.cardGroup copyWithZone:zone];
        copy.loadMore = self.loadMore;
        copy.modType = [self.modType copyWithZone:zone];
        copy.nextCursor = self.nextCursor;
        copy.previousCursor = self.previousCursor;
        copy.page = self.page;
        copy.maxPage = self.maxPage;
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
