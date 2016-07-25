//
//  UrlStruct.m
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "UrlStruct.h"


NSString *const kUrlStructResult = @"result";
NSString *const kUrlStructNeedSaveObj = @"need_save_obj";
NSString *const kUrlStructPosition = @"position";
NSString *const kUrlStructOriUrl = @"ori_url";
NSString *const kUrlStructUrlType = @"url_type";
NSString *const kUrlStructUrlTitle = @"url_title";
NSString *const kUrlStructUrlTypePic = @"url_type_pic";
NSString *const kUrlStructLog = @"log";
NSString *const kUrlStructShortUrl = @"short_url";


@interface UrlStruct ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UrlStruct

@synthesize result = _result;
@synthesize needSaveObj = _needSaveObj;
@synthesize position = _position;
@synthesize oriUrl = _oriUrl;
@synthesize urlType = _urlType;
@synthesize urlTitle = _urlTitle;
@synthesize urlTypePic = _urlTypePic;
@synthesize log = _log;
@synthesize shortUrl = _shortUrl;


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
            self.result = [[self objectOrNilForKey:kUrlStructResult fromDictionary:dict] boolValue];
            self.needSaveObj = [[self objectOrNilForKey:kUrlStructNeedSaveObj fromDictionary:dict] doubleValue];
            self.position = [[self objectOrNilForKey:kUrlStructPosition fromDictionary:dict] doubleValue];
            self.oriUrl = [self objectOrNilForKey:kUrlStructOriUrl fromDictionary:dict];
            self.urlType = [[self objectOrNilForKey:kUrlStructUrlType fromDictionary:dict] doubleValue];
            self.urlTitle = [self objectOrNilForKey:kUrlStructUrlTitle fromDictionary:dict];
            self.urlTypePic = [self objectOrNilForKey:kUrlStructUrlTypePic fromDictionary:dict];
            self.log = [self objectOrNilForKey:kUrlStructLog fromDictionary:dict];
            self.shortUrl = [self objectOrNilForKey:kUrlStructShortUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.result] forKey:kUrlStructResult];
    [mutableDict setValue:[NSNumber numberWithDouble:self.needSaveObj] forKey:kUrlStructNeedSaveObj];
    [mutableDict setValue:[NSNumber numberWithDouble:self.position] forKey:kUrlStructPosition];
    [mutableDict setValue:self.oriUrl forKey:kUrlStructOriUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.urlType] forKey:kUrlStructUrlType];
    [mutableDict setValue:self.urlTitle forKey:kUrlStructUrlTitle];
    [mutableDict setValue:self.urlTypePic forKey:kUrlStructUrlTypePic];
    [mutableDict setValue:self.log forKey:kUrlStructLog];
    [mutableDict setValue:self.shortUrl forKey:kUrlStructShortUrl];

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

    self.result = [aDecoder decodeBoolForKey:kUrlStructResult];
    self.needSaveObj = [aDecoder decodeDoubleForKey:kUrlStructNeedSaveObj];
    self.position = [aDecoder decodeDoubleForKey:kUrlStructPosition];
    self.oriUrl = [aDecoder decodeObjectForKey:kUrlStructOriUrl];
    self.urlType = [aDecoder decodeDoubleForKey:kUrlStructUrlType];
    self.urlTitle = [aDecoder decodeObjectForKey:kUrlStructUrlTitle];
    self.urlTypePic = [aDecoder decodeObjectForKey:kUrlStructUrlTypePic];
    self.log = [aDecoder decodeObjectForKey:kUrlStructLog];
    self.shortUrl = [aDecoder decodeObjectForKey:kUrlStructShortUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_result forKey:kUrlStructResult];
    [aCoder encodeDouble:_needSaveObj forKey:kUrlStructNeedSaveObj];
    [aCoder encodeDouble:_position forKey:kUrlStructPosition];
    [aCoder encodeObject:_oriUrl forKey:kUrlStructOriUrl];
    [aCoder encodeDouble:_urlType forKey:kUrlStructUrlType];
    [aCoder encodeObject:_urlTitle forKey:kUrlStructUrlTitle];
    [aCoder encodeObject:_urlTypePic forKey:kUrlStructUrlTypePic];
    [aCoder encodeObject:_log forKey:kUrlStructLog];
    [aCoder encodeObject:_shortUrl forKey:kUrlStructShortUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    UrlStruct *copy = [[UrlStruct alloc] init];
    
    if (copy) {

        copy.result = self.result;
        copy.needSaveObj = self.needSaveObj;
        copy.position = self.position;
        copy.oriUrl = [self.oriUrl copyWithZone:zone];
        copy.urlType = self.urlType;
        copy.urlTitle = [self.urlTitle copyWithZone:zone];
        copy.urlTypePic = [self.urlTypePic copyWithZone:zone];
        copy.log = [self.log copyWithZone:zone];
        copy.shortUrl = [self.shortUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
