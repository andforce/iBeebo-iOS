//
//  AtMeCard.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "AtMeCard.h"


NSString *const kAtMeCardPageDesc = @"page_desc";
NSString *const kAtMeCardPageTitle = @"page_title";
NSString *const kAtMeCardPageId = @"page_id";
NSString *const kAtMeCardPageUrl = @"page_url";
NSString *const kAtMeCardPagePic = @"page_pic";


@interface AtMeCard ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AtMeCard

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
            self.pageDesc = [self objectOrNilForKey:kAtMeCardPageDesc fromDictionary:dict];
            self.pageTitle = [self objectOrNilForKey:kAtMeCardPageTitle fromDictionary:dict];
            self.pageId = [[self objectOrNilForKey:kAtMeCardPageId fromDictionary:dict] doubleValue];
            self.pageUrl = [self objectOrNilForKey:kAtMeCardPageUrl fromDictionary:dict];
            self.pagePic = [self objectOrNilForKey:kAtMeCardPagePic fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pageDesc forKey:kAtMeCardPageDesc];
    [mutableDict setValue:self.pageTitle forKey:kAtMeCardPageTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageId] forKey:kAtMeCardPageId];
    [mutableDict setValue:self.pageUrl forKey:kAtMeCardPageUrl];
    [mutableDict setValue:self.pagePic forKey:kAtMeCardPagePic];

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

    self.pageDesc = [aDecoder decodeObjectForKey:kAtMeCardPageDesc];
    self.pageTitle = [aDecoder decodeObjectForKey:kAtMeCardPageTitle];
    self.pageId = [aDecoder decodeDoubleForKey:kAtMeCardPageId];
    self.pageUrl = [aDecoder decodeObjectForKey:kAtMeCardPageUrl];
    self.pagePic = [aDecoder decodeObjectForKey:kAtMeCardPagePic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageDesc forKey:kAtMeCardPageDesc];
    [aCoder encodeObject:_pageTitle forKey:kAtMeCardPageTitle];
    [aCoder encodeDouble:_pageId forKey:kAtMeCardPageId];
    [aCoder encodeObject:_pageUrl forKey:kAtMeCardPageUrl];
    [aCoder encodeObject:_pagePic forKey:kAtMeCardPagePic];
}

- (id)copyWithZone:(NSZone *)zone
{
    AtMeCard *copy = [[AtMeCard alloc] init];
    
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
