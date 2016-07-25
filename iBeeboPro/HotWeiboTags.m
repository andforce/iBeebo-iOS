//
//  HotWeiboTags.m
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "HotWeiboTags.h"


NSString *const kHotWeiboTagsTagName = @"tag_name";
NSString *const kHotWeiboTagsTagWeight = @"tag_weight";
NSString *const kHotWeiboTagsFromCateid = @"from_cateid";
NSString *const kHotWeiboTagsTagHidden = @"tag_hidden";
NSString *const kHotWeiboTagsUrlTypePic = @"url_type_pic";
NSString *const kHotWeiboTagsContainerid = @"containerid";
NSString *const kHotWeiboTagsTagType = @"tag_type";
NSString *const kHotWeiboTagsTagScheme = @"tag_scheme";


@interface HotWeiboTags ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotWeiboTags

@synthesize tagName = _tagName;
@synthesize tagWeight = _tagWeight;
@synthesize fromCateid = _fromCateid;
@synthesize tagHidden = _tagHidden;
@synthesize urlTypePic = _urlTypePic;
@synthesize containerid = _containerid;
@synthesize tagType = _tagType;
@synthesize tagScheme = _tagScheme;


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
            self.tagName = [self objectOrNilForKey:kHotWeiboTagsTagName fromDictionary:dict];
            self.tagWeight = [[self objectOrNilForKey:kHotWeiboTagsTagWeight fromDictionary:dict] doubleValue];
            self.fromCateid = [self objectOrNilForKey:kHotWeiboTagsFromCateid fromDictionary:dict];
            self.tagHidden = [[self objectOrNilForKey:kHotWeiboTagsTagHidden fromDictionary:dict] doubleValue];
            self.urlTypePic = [self objectOrNilForKey:kHotWeiboTagsUrlTypePic fromDictionary:dict];
            self.containerid = [self objectOrNilForKey:kHotWeiboTagsContainerid fromDictionary:dict];
            self.tagType = [[self objectOrNilForKey:kHotWeiboTagsTagType fromDictionary:dict] doubleValue];
            self.tagScheme = [self objectOrNilForKey:kHotWeiboTagsTagScheme fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.tagName forKey:kHotWeiboTagsTagName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tagWeight] forKey:kHotWeiboTagsTagWeight];
    [mutableDict setValue:self.fromCateid forKey:kHotWeiboTagsFromCateid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tagHidden] forKey:kHotWeiboTagsTagHidden];
    [mutableDict setValue:self.urlTypePic forKey:kHotWeiboTagsUrlTypePic];
    [mutableDict setValue:self.containerid forKey:kHotWeiboTagsContainerid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tagType] forKey:kHotWeiboTagsTagType];
    [mutableDict setValue:self.tagScheme forKey:kHotWeiboTagsTagScheme];

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

    self.tagName = [aDecoder decodeObjectForKey:kHotWeiboTagsTagName];
    self.tagWeight = [aDecoder decodeDoubleForKey:kHotWeiboTagsTagWeight];
    self.fromCateid = [aDecoder decodeObjectForKey:kHotWeiboTagsFromCateid];
    self.tagHidden = [aDecoder decodeDoubleForKey:kHotWeiboTagsTagHidden];
    self.urlTypePic = [aDecoder decodeObjectForKey:kHotWeiboTagsUrlTypePic];
    self.containerid = [aDecoder decodeObjectForKey:kHotWeiboTagsContainerid];
    self.tagType = [aDecoder decodeDoubleForKey:kHotWeiboTagsTagType];
    self.tagScheme = [aDecoder decodeObjectForKey:kHotWeiboTagsTagScheme];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tagName forKey:kHotWeiboTagsTagName];
    [aCoder encodeDouble:_tagWeight forKey:kHotWeiboTagsTagWeight];
    [aCoder encodeObject:_fromCateid forKey:kHotWeiboTagsFromCateid];
    [aCoder encodeDouble:_tagHidden forKey:kHotWeiboTagsTagHidden];
    [aCoder encodeObject:_urlTypePic forKey:kHotWeiboTagsUrlTypePic];
    [aCoder encodeObject:_containerid forKey:kHotWeiboTagsContainerid];
    [aCoder encodeDouble:_tagType forKey:kHotWeiboTagsTagType];
    [aCoder encodeObject:_tagScheme forKey:kHotWeiboTagsTagScheme];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotWeiboTags *copy = [[HotWeiboTags alloc] init];
    
    if (copy) {

        copy.tagName = [self.tagName copyWithZone:zone];
        copy.tagWeight = self.tagWeight;
        copy.fromCateid = [self.fromCateid copyWithZone:zone];
        copy.tagHidden = self.tagHidden;
        copy.urlTypePic = [self.urlTypePic copyWithZone:zone];
        copy.containerid = [self.containerid copyWithZone:zone];
        copy.tagType = self.tagType;
        copy.tagScheme = [self.tagScheme copyWithZone:zone];
    }
    
    return copy;
}


@end
