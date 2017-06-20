//
//  LkCard.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LkCard.h"


NSString *const kLkCardPageDesc = @"page_desc";
NSString *const kLkCardPageTitle = @"page_title";
NSString *const kLkCardPageId = @"page_id";
NSString *const kLkCardPageUrl = @"page_url";
NSString *const kLkCardPagePic = @"page_pic";


@interface LkCard ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LkCard

@synthesize pageDesc = _pageDesc;
@synthesize pageTitle = _pageTitle;
@synthesize pageId = _pageId;
@synthesize pageUrl = _pageUrl;
@synthesize pagePic = _pagePic;


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
            self.pageDesc = [self objectOrNilForKey:kLkCardPageDesc fromDictionary:dict];
            self.pageTitle = [self objectOrNilForKey:kLkCardPageTitle fromDictionary:dict];
            self.pageId = [[self objectOrNilForKey:kLkCardPageId fromDictionary:dict] doubleValue];
            self.pageUrl = [self objectOrNilForKey:kLkCardPageUrl fromDictionary:dict];
            self.pagePic = [self objectOrNilForKey:kLkCardPagePic fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pageDesc forKey:kLkCardPageDesc];
    [mutableDict setValue:self.pageTitle forKey:kLkCardPageTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageId] forKey:kLkCardPageId];
    [mutableDict setValue:self.pageUrl forKey:kLkCardPageUrl];
    [mutableDict setValue:self.pagePic forKey:kLkCardPagePic];

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

    self.pageDesc = [aDecoder decodeObjectForKey:kLkCardPageDesc];
    self.pageTitle = [aDecoder decodeObjectForKey:kLkCardPageTitle];
    self.pageId = [aDecoder decodeDoubleForKey:kLkCardPageId];
    self.pageUrl = [aDecoder decodeObjectForKey:kLkCardPageUrl];
    self.pagePic = [aDecoder decodeObjectForKey:kLkCardPagePic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageDesc forKey:kLkCardPageDesc];
    [aCoder encodeObject:_pageTitle forKey:kLkCardPageTitle];
    [aCoder encodeDouble:_pageId forKey:kLkCardPageId];
    [aCoder encodeObject:_pageUrl forKey:kLkCardPageUrl];
    [aCoder encodeObject:_pagePic forKey:kLkCardPagePic];
}

- (id)copyWithZone:(NSZone *)zone
{
    LkCard *copy = [[LkCard alloc] init];
    
    if (copy) {

        copy.pageDesc = [self.pageDesc copyWithZone:zone];
        copy.pageTitle = [self.pageTitle copyWithZone:zone];
        copy.pageId = self.pageId;
        copy.pageUrl = [self.pageUrl copyWithZone:zone];
        copy.pagePic = [self.pagePic copyWithZone:zone];
    }
    
    return copy;
}


@end
