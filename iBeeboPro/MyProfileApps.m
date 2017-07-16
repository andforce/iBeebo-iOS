//
//  MyProfileApps.m
//
//  Created by   on 2017/7/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MyProfileApps.h"


NSString *const kMyProfileAppsTitle = @"title";
NSString *const kMyProfileAppsCount = @"count";
NSString *const kMyProfileAppsIcon = @"icon";
NSString *const kMyProfileAppsScheme = @"scheme";


@interface MyProfileApps ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MyProfileApps

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
            self.title = [self objectOrNilForKey:kMyProfileAppsTitle fromDictionary:dict];
            self.count = [[self objectOrNilForKey:kMyProfileAppsCount fromDictionary:dict] doubleValue];
            self.icon = [self objectOrNilForKey:kMyProfileAppsIcon fromDictionary:dict];
            self.scheme = [self objectOrNilForKey:kMyProfileAppsScheme fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kMyProfileAppsTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kMyProfileAppsCount];
    [mutableDict setValue:self.icon forKey:kMyProfileAppsIcon];
    [mutableDict setValue:self.scheme forKey:kMyProfileAppsScheme];

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

    self.title = [aDecoder decodeObjectForKey:kMyProfileAppsTitle];
    self.count = [aDecoder decodeDoubleForKey:kMyProfileAppsCount];
    self.icon = [aDecoder decodeObjectForKey:kMyProfileAppsIcon];
    self.scheme = [aDecoder decodeObjectForKey:kMyProfileAppsScheme];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kMyProfileAppsTitle];
    [aCoder encodeDouble:_count forKey:kMyProfileAppsCount];
    [aCoder encodeObject:_icon forKey:kMyProfileAppsIcon];
    [aCoder encodeObject:_scheme forKey:kMyProfileAppsScheme];
}

- (id)copyWithZone:(NSZone *)zone
{
    MyProfileApps *copy = [[MyProfileApps alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.count = self.count;
        copy.icon = [self.icon copyWithZone:zone];
        copy.scheme = [self.scheme copyWithZone:zone];
    }
    
    return copy;
}


@end
