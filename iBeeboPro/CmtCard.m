//
//  CmtCard.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CmtCard.h"


NSString *const kCmtCardPageDesc = @"page_desc";
NSString *const kCmtCardPageTitle = @"page_title";
NSString *const kCmtCardPageId = @"page_id";
NSString *const kCmtCardPageUrl = @"page_url";
NSString *const kCmtCardPagePic = @"page_pic";


@interface CmtCard ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CmtCard

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
            self.pageDesc = [self objectOrNilForKey:kCmtCardPageDesc fromDictionary:dict];
            self.pageTitle = [self objectOrNilForKey:kCmtCardPageTitle fromDictionary:dict];
            self.pageId = [[self objectOrNilForKey:kCmtCardPageId fromDictionary:dict] doubleValue];
            self.pageUrl = [self objectOrNilForKey:kCmtCardPageUrl fromDictionary:dict];
            self.pagePic = [self objectOrNilForKey:kCmtCardPagePic fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pageDesc forKey:kCmtCardPageDesc];
    [mutableDict setValue:self.pageTitle forKey:kCmtCardPageTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageId] forKey:kCmtCardPageId];
    [mutableDict setValue:self.pageUrl forKey:kCmtCardPageUrl];
    [mutableDict setValue:self.pagePic forKey:kCmtCardPagePic];

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

    self.pageDesc = [aDecoder decodeObjectForKey:kCmtCardPageDesc];
    self.pageTitle = [aDecoder decodeObjectForKey:kCmtCardPageTitle];
    self.pageId = [aDecoder decodeDoubleForKey:kCmtCardPageId];
    self.pageUrl = [aDecoder decodeObjectForKey:kCmtCardPageUrl];
    self.pagePic = [aDecoder decodeObjectForKey:kCmtCardPagePic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageDesc forKey:kCmtCardPageDesc];
    [aCoder encodeObject:_pageTitle forKey:kCmtCardPageTitle];
    [aCoder encodeDouble:_pageId forKey:kCmtCardPageId];
    [aCoder encodeObject:_pageUrl forKey:kCmtCardPageUrl];
    [aCoder encodeObject:_pagePic forKey:kCmtCardPagePic];
}

- (id)copyWithZone:(NSZone *)zone
{
    CmtCard *copy = [[CmtCard alloc] init];
    
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
