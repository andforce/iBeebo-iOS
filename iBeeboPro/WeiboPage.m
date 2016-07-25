//
//  WeiboPage.m
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "WeiboPage.h"
#import "CardGroup.h"


NSString *const kWeiboPageUrl = @"url";
NSString *const kWeiboPageLoadMore = @"loadMore";
NSString *const kWeiboPageModType = @"mod_type";
NSString *const kWeiboPageNextCursor = @"next_cursor";
NSString *const kWeiboPagePreviousCursor = @"previous_cursor";
NSString *const kWeiboPagePage = @"page";
NSString *const kWeiboPageMaxPage = @"maxPage";
NSString *const kWeiboPageCardGroup = @"card_group";


@interface WeiboPage ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation WeiboPage

@synthesize url = _url;
@synthesize loadMore = _loadMore;
@synthesize modType = _modType;
@synthesize nextCursor = _nextCursor;
@synthesize previousCursor = _previousCursor;
@synthesize page = _page;
@synthesize maxPage = _maxPage;
@synthesize cardGroup = _cardGroup;


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
            self.url = [self objectOrNilForKey:kWeiboPageUrl fromDictionary:dict];
            self.loadMore = [[self objectOrNilForKey:kWeiboPageLoadMore fromDictionary:dict] boolValue];
            self.modType = [self objectOrNilForKey:kWeiboPageModType fromDictionary:dict];
            self.nextCursor = [[self objectOrNilForKey:kWeiboPageNextCursor fromDictionary:dict] doubleValue];
            self.previousCursor = [[self objectOrNilForKey:kWeiboPagePreviousCursor fromDictionary:dict] doubleValue];
            self.page = [[self objectOrNilForKey:kWeiboPagePage fromDictionary:dict] doubleValue];
            self.maxPage = [[self objectOrNilForKey:kWeiboPageMaxPage fromDictionary:dict] doubleValue];
    NSObject *receivedCardGroup = [dict objectForKey:kWeiboPageCardGroup];
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

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.url forKey:kWeiboPageUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.loadMore] forKey:kWeiboPageLoadMore];
    [mutableDict setValue:self.modType forKey:kWeiboPageModType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.nextCursor] forKey:kWeiboPageNextCursor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.previousCursor] forKey:kWeiboPagePreviousCursor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kWeiboPagePage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxPage] forKey:kWeiboPageMaxPage];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCardGroup] forKey:kWeiboPageCardGroup];

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

    self.url = [aDecoder decodeObjectForKey:kWeiboPageUrl];
    self.loadMore = [aDecoder decodeBoolForKey:kWeiboPageLoadMore];
    self.modType = [aDecoder decodeObjectForKey:kWeiboPageModType];
    self.nextCursor = [aDecoder decodeDoubleForKey:kWeiboPageNextCursor];
    self.previousCursor = [aDecoder decodeDoubleForKey:kWeiboPagePreviousCursor];
    self.page = [aDecoder decodeDoubleForKey:kWeiboPagePage];
    self.maxPage = [aDecoder decodeDoubleForKey:kWeiboPageMaxPage];
    self.cardGroup = [aDecoder decodeObjectForKey:kWeiboPageCardGroup];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_url forKey:kWeiboPageUrl];
    [aCoder encodeBool:_loadMore forKey:kWeiboPageLoadMore];
    [aCoder encodeObject:_modType forKey:kWeiboPageModType];
    [aCoder encodeDouble:_nextCursor forKey:kWeiboPageNextCursor];
    [aCoder encodeDouble:_previousCursor forKey:kWeiboPagePreviousCursor];
    [aCoder encodeDouble:_page forKey:kWeiboPagePage];
    [aCoder encodeDouble:_maxPage forKey:kWeiboPageMaxPage];
    [aCoder encodeObject:_cardGroup forKey:kWeiboPageCardGroup];
}

- (id)copyWithZone:(NSZone *)zone
{
    WeiboPage *copy = [[WeiboPage alloc] init];
    
    if (copy) {

        copy.url = [self.url copyWithZone:zone];
        copy.loadMore = self.loadMore;
        copy.modType = [self.modType copyWithZone:zone];
        copy.nextCursor = self.nextCursor;
        copy.previousCursor = self.previousCursor;
        copy.page = self.page;
        copy.maxPage = self.maxPage;
        copy.cardGroup = [self.cardGroup copyWithZone:zone];
    }
    
    return copy;
}


@end
