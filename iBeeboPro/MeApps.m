//
//  MeApps.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MeApps.h"


NSString *const kMeAppsTitle = @"title";
NSString *const kMeAppsCount = @"count";
NSString *const kMeAppsIcon = @"icon";
NSString *const kMeAppsScheme = @"scheme";


@interface MeApps ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MeApps

@synthesize title = _title;
@synthesize count = _count;
@synthesize icon = _icon;
@synthesize scheme = _scheme;


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
            self.title = [self objectOrNilForKey:kMeAppsTitle fromDictionary:dict];
            self.count = [[self objectOrNilForKey:kMeAppsCount fromDictionary:dict] doubleValue];
            self.icon = [self objectOrNilForKey:kMeAppsIcon fromDictionary:dict];
            self.scheme = [self objectOrNilForKey:kMeAppsScheme fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kMeAppsTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kMeAppsCount];
    [mutableDict setValue:self.icon forKey:kMeAppsIcon];
    [mutableDict setValue:self.scheme forKey:kMeAppsScheme];

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

    self.title = [aDecoder decodeObjectForKey:kMeAppsTitle];
    self.count = [aDecoder decodeDoubleForKey:kMeAppsCount];
    self.icon = [aDecoder decodeObjectForKey:kMeAppsIcon];
    self.scheme = [aDecoder decodeObjectForKey:kMeAppsScheme];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kMeAppsTitle];
    [aCoder encodeDouble:_count forKey:kMeAppsCount];
    [aCoder encodeObject:_icon forKey:kMeAppsIcon];
    [aCoder encodeObject:_scheme forKey:kMeAppsScheme];
}

- (id)copyWithZone:(NSZone *)zone
{
    MeApps *copy = [[MeApps alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.count = self.count;
        copy.icon = [self.icon copyWithZone:zone];
        copy.scheme = [self.scheme copyWithZone:zone];
    }
    
    return copy;
}


@end
