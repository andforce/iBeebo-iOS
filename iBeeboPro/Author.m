//
//  Author.m
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Author.h"


NSString *const kAuthorProfileImageUrl = @"profile_image_url";
NSString *const kAuthorScreenName = @"screen_name";


@interface Author ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Author

@synthesize profileImageUrl = _profileImageUrl;
@synthesize screenName = _screenName;


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
            self.profileImageUrl = [self objectOrNilForKey:kAuthorProfileImageUrl fromDictionary:dict];
            self.screenName = [self objectOrNilForKey:kAuthorScreenName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.profileImageUrl forKey:kAuthorProfileImageUrl];
    [mutableDict setValue:self.screenName forKey:kAuthorScreenName];

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

    self.profileImageUrl = [aDecoder decodeObjectForKey:kAuthorProfileImageUrl];
    self.screenName = [aDecoder decodeObjectForKey:kAuthorScreenName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_profileImageUrl forKey:kAuthorProfileImageUrl];
    [aCoder encodeObject:_screenName forKey:kAuthorScreenName];
}

- (id)copyWithZone:(NSZone *)zone
{
    Author *copy = [[Author alloc] init];
    
    if (copy) {

        copy.profileImageUrl = [self.profileImageUrl copyWithZone:zone];
        copy.screenName = [self.screenName copyWithZone:zone];
    }
    
    return copy;
}


@end
