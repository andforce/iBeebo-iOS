//
//  AtMeUrlStruct.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "AtMeUrlStruct.h"
#import "AtMeActionlog.h"


NSString *const kAtMeUrlStructResult = @"result";
NSString *const kAtMeUrlStructNeedSaveObj = @"need_save_obj";
NSString *const kAtMeUrlStructPosition = @"position";
NSString *const kAtMeUrlStructOriUrl = @"ori_url";
NSString *const kAtMeUrlStructUrlType = @"url_type";
NSString *const kAtMeUrlStructUrlTitle = @"url_title";
NSString *const kAtMeUrlStructUrlTypePic = @"url_type_pic";
NSString *const kAtMeUrlStructPageId = @"page_id";
NSString *const kAtMeUrlStructLog = @"log";
NSString *const kAtMeUrlStructShortUrl = @"short_url";
NSString *const kAtMeUrlStructActionlog = @"actionlog";


@interface AtMeUrlStruct ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AtMeUrlStruct

@synthesize result = _result;
@synthesize needSaveObj = _needSaveObj;
@synthesize position = _position;
@synthesize oriUrl = _oriUrl;
@synthesize urlType = _urlType;
@synthesize urlTitle = _urlTitle;
@synthesize urlTypePic = _urlTypePic;
@synthesize pageId = _pageId;
@synthesize log = _log;
@synthesize shortUrl = _shortUrl;
@synthesize actionlog = _actionlog;


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
            self.result = [[self objectOrNilForKey:kAtMeUrlStructResult fromDictionary:dict] boolValue];
            self.needSaveObj = [[self objectOrNilForKey:kAtMeUrlStructNeedSaveObj fromDictionary:dict] doubleValue];
            self.position = [[self objectOrNilForKey:kAtMeUrlStructPosition fromDictionary:dict] doubleValue];
            self.oriUrl = [self objectOrNilForKey:kAtMeUrlStructOriUrl fromDictionary:dict];
            self.urlType = [[self objectOrNilForKey:kAtMeUrlStructUrlType fromDictionary:dict] doubleValue];
            self.urlTitle = [self objectOrNilForKey:kAtMeUrlStructUrlTitle fromDictionary:dict];
            self.urlTypePic = [self objectOrNilForKey:kAtMeUrlStructUrlTypePic fromDictionary:dict];
            self.pageId = [self objectOrNilForKey:kAtMeUrlStructPageId fromDictionary:dict];
            self.log = [self objectOrNilForKey:kAtMeUrlStructLog fromDictionary:dict];
            self.shortUrl = [self objectOrNilForKey:kAtMeUrlStructShortUrl fromDictionary:dict];
            self.actionlog = [AtMeActionlog modelObjectWithDictionary:[dict objectForKey:kAtMeUrlStructActionlog]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.result] forKey:kAtMeUrlStructResult];
    [mutableDict setValue:[NSNumber numberWithDouble:self.needSaveObj] forKey:kAtMeUrlStructNeedSaveObj];
    [mutableDict setValue:[NSNumber numberWithDouble:self.position] forKey:kAtMeUrlStructPosition];
    [mutableDict setValue:self.oriUrl forKey:kAtMeUrlStructOriUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.urlType] forKey:kAtMeUrlStructUrlType];
    [mutableDict setValue:self.urlTitle forKey:kAtMeUrlStructUrlTitle];
    [mutableDict setValue:self.urlTypePic forKey:kAtMeUrlStructUrlTypePic];
    [mutableDict setValue:self.pageId forKey:kAtMeUrlStructPageId];
    [mutableDict setValue:self.log forKey:kAtMeUrlStructLog];
    [mutableDict setValue:self.shortUrl forKey:kAtMeUrlStructShortUrl];
    [mutableDict setValue:[self.actionlog dictionaryRepresentation] forKey:kAtMeUrlStructActionlog];

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

    self.result = [aDecoder decodeBoolForKey:kAtMeUrlStructResult];
    self.needSaveObj = [aDecoder decodeDoubleForKey:kAtMeUrlStructNeedSaveObj];
    self.position = [aDecoder decodeDoubleForKey:kAtMeUrlStructPosition];
    self.oriUrl = [aDecoder decodeObjectForKey:kAtMeUrlStructOriUrl];
    self.urlType = [aDecoder decodeDoubleForKey:kAtMeUrlStructUrlType];
    self.urlTitle = [aDecoder decodeObjectForKey:kAtMeUrlStructUrlTitle];
    self.urlTypePic = [aDecoder decodeObjectForKey:kAtMeUrlStructUrlTypePic];
    self.pageId = [aDecoder decodeObjectForKey:kAtMeUrlStructPageId];
    self.log = [aDecoder decodeObjectForKey:kAtMeUrlStructLog];
    self.shortUrl = [aDecoder decodeObjectForKey:kAtMeUrlStructShortUrl];
    self.actionlog = [aDecoder decodeObjectForKey:kAtMeUrlStructActionlog];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_result forKey:kAtMeUrlStructResult];
    [aCoder encodeDouble:_needSaveObj forKey:kAtMeUrlStructNeedSaveObj];
    [aCoder encodeDouble:_position forKey:kAtMeUrlStructPosition];
    [aCoder encodeObject:_oriUrl forKey:kAtMeUrlStructOriUrl];
    [aCoder encodeDouble:_urlType forKey:kAtMeUrlStructUrlType];
    [aCoder encodeObject:_urlTitle forKey:kAtMeUrlStructUrlTitle];
    [aCoder encodeObject:_urlTypePic forKey:kAtMeUrlStructUrlTypePic];
    [aCoder encodeObject:_pageId forKey:kAtMeUrlStructPageId];
    [aCoder encodeObject:_log forKey:kAtMeUrlStructLog];
    [aCoder encodeObject:_shortUrl forKey:kAtMeUrlStructShortUrl];
    [aCoder encodeObject:_actionlog forKey:kAtMeUrlStructActionlog];
}

- (id)copyWithZone:(NSZone *)zone
{
    AtMeUrlStruct *copy = [[AtMeUrlStruct alloc] init];
    
    if (copy) {

        copy.result = self.result;
        copy.needSaveObj = self.needSaveObj;
        copy.position = self.position;
        copy.oriUrl = [self.oriUrl copyWithZone:zone];
        copy.urlType = self.urlType;
        copy.urlTitle = [self.urlTitle copyWithZone:zone];
        copy.urlTypePic = [self.urlTypePic copyWithZone:zone];
        copy.pageId = [self.pageId copyWithZone:zone];
        copy.log = [self.log copyWithZone:zone];
        copy.shortUrl = [self.shortUrl copyWithZone:zone];
        copy.actionlog = [self.actionlog copyWithZone:zone];
    }
    
    return copy;
}


@end
