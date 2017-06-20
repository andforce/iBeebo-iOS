//
//  AtMeVisible.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "AtMeVisible.h"


NSString *const kAtMeVisibleListId = @"list_id";
NSString *const kAtMeVisibleType = @"type";


@interface AtMeVisible ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AtMeVisible

@synthesize listId = _listId;
@synthesize type = _type;


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
            self.listId = [[self objectOrNilForKey:kAtMeVisibleListId fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kAtMeVisibleType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listId] forKey:kAtMeVisibleListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kAtMeVisibleType];

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

    self.listId = [aDecoder decodeDoubleForKey:kAtMeVisibleListId];
    self.type = [aDecoder decodeDoubleForKey:kAtMeVisibleType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_listId forKey:kAtMeVisibleListId];
    [aCoder encodeDouble:_type forKey:kAtMeVisibleType];
}

- (id)copyWithZone:(NSZone *)zone
{
    AtMeVisible *copy = [[AtMeVisible alloc] init];
    
    if (copy) {

        copy.listId = self.listId;
        copy.type = self.type;
    }
    
    return copy;
}


@end
