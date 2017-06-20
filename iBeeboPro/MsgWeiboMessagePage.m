//
//  MsgWeiboMessagePage.m
//
//  Created by   on 2017/6/20
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MsgWeiboMessagePage.h"
#import "MsgCardGroup.h"


NSString *const kMsgWeiboMessagePageCardGroup = @"card_group";
NSString *const kMsgWeiboMessagePageLoadMore = @"loadMore";
NSString *const kMsgWeiboMessagePageModType = @"mod_type";
NSString *const kMsgWeiboMessagePageNextCursor = @"next_cursor";
NSString *const kMsgWeiboMessagePagePreviousCursor = @"previous_cursor";
NSString *const kMsgWeiboMessagePagePage = @"page";
NSString *const kMsgWeiboMessagePageMaxPage = @"maxPage";
NSString *const kMsgWeiboMessagePageUrl = @"url";


@interface MsgWeiboMessagePage ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MsgWeiboMessagePage

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
    NSObject *receivedMsgCardGroup = [dict objectForKey:kMsgWeiboMessagePageCardGroup];
    NSMutableArray *parsedMsgCardGroup = [NSMutableArray array];
    if ([receivedMsgCardGroup isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMsgCardGroup) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMsgCardGroup addObject:[MsgCardGroup modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMsgCardGroup isKindOfClass:[NSDictionary class]]) {
       [parsedMsgCardGroup addObject:[MsgCardGroup modelObjectWithDictionary:(NSDictionary *)receivedMsgCardGroup]];
    }

    self.cardGroup = [NSArray arrayWithArray:parsedMsgCardGroup];
            self.loadMore = [[self objectOrNilForKey:kMsgWeiboMessagePageLoadMore fromDictionary:dict] boolValue];
            self.modType = [self objectOrNilForKey:kMsgWeiboMessagePageModType fromDictionary:dict];
            self.nextCursor = [self objectOrNilForKey:kMsgWeiboMessagePageNextCursor fromDictionary:dict];
            self.previousCursor = [self objectOrNilForKey:kMsgWeiboMessagePagePreviousCursor fromDictionary:dict];
            self.page = [[self objectOrNilForKey:kMsgWeiboMessagePagePage fromDictionary:dict] doubleValue];
            self.maxPage = [[self objectOrNilForKey:kMsgWeiboMessagePageMaxPage fromDictionary:dict] doubleValue];
            self.url = [self objectOrNilForKey:kMsgWeiboMessagePageUrl fromDictionary:dict];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCardGroup] forKey:kMsgWeiboMessagePageCardGroup];
    [mutableDict setValue:[NSNumber numberWithBool:self.loadMore] forKey:kMsgWeiboMessagePageLoadMore];
    [mutableDict setValue:self.modType forKey:kMsgWeiboMessagePageModType];
    [mutableDict setValue:self.nextCursor forKey:kMsgWeiboMessagePageNextCursor];
    [mutableDict setValue:self.previousCursor forKey:kMsgWeiboMessagePagePreviousCursor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kMsgWeiboMessagePagePage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxPage] forKey:kMsgWeiboMessagePageMaxPage];
    [mutableDict setValue:self.url forKey:kMsgWeiboMessagePageUrl];

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

    self.cardGroup = [aDecoder decodeObjectForKey:kMsgWeiboMessagePageCardGroup];
    self.loadMore = [aDecoder decodeBoolForKey:kMsgWeiboMessagePageLoadMore];
    self.modType = [aDecoder decodeObjectForKey:kMsgWeiboMessagePageModType];
    self.nextCursor = [aDecoder decodeObjectForKey:kMsgWeiboMessagePageNextCursor];
    self.previousCursor = [aDecoder decodeObjectForKey:kMsgWeiboMessagePagePreviousCursor];
    self.page = [aDecoder decodeDoubleForKey:kMsgWeiboMessagePagePage];
    self.maxPage = [aDecoder decodeDoubleForKey:kMsgWeiboMessagePageMaxPage];
    self.url = [aDecoder decodeObjectForKey:kMsgWeiboMessagePageUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_cardGroup forKey:kMsgWeiboMessagePageCardGroup];
    [aCoder encodeBool:_loadMore forKey:kMsgWeiboMessagePageLoadMore];
    [aCoder encodeObject:_modType forKey:kMsgWeiboMessagePageModType];
    [aCoder encodeObject:_nextCursor forKey:kMsgWeiboMessagePageNextCursor];
    [aCoder encodeObject:_previousCursor forKey:kMsgWeiboMessagePagePreviousCursor];
    [aCoder encodeDouble:_page forKey:kMsgWeiboMessagePagePage];
    [aCoder encodeDouble:_maxPage forKey:kMsgWeiboMessagePageMaxPage];
    [aCoder encodeObject:_url forKey:kMsgWeiboMessagePageUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    MsgWeiboMessagePage *copy = [[MsgWeiboMessagePage alloc] init];
    
    if (copy) {

        copy.cardGroup = [self.cardGroup copyWithZone:zone];
        copy.loadMore = self.loadMore;
        copy.modType = [self.modType copyWithZone:zone];
        copy.nextCursor = [self.nextCursor copyWithZone:zone];
        copy.previousCursor = [self.previousCursor copyWithZone:zone];
        copy.page = self.page;
        copy.maxPage = self.maxPage;
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
