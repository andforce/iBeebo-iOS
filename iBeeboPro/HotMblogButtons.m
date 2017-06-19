//
//  HotMblogButtons.m
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HotMblogButtons.h"
#import "HotActionlog.h"


NSString *const kHotMblogButtonsActionlog = @"actionlog";
NSString *const kHotMblogButtonsPic = @"pic";
NSString *const kHotMblogButtonsType = @"type";
NSString *const kHotMblogButtonsName = @"name";


@interface HotMblogButtons ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotMblogButtons

@synthesize actionlog = _actionlog;
@synthesize pic = _pic;
@synthesize type = _type;
@synthesize name = _name;


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
            self.actionlog = [HotActionlog modelObjectWithDictionary:[dict objectForKey:kHotMblogButtonsActionlog]];
            self.pic = [self objectOrNilForKey:kHotMblogButtonsPic fromDictionary:dict];
            self.type = [self objectOrNilForKey:kHotMblogButtonsType fromDictionary:dict];
            self.name = [self objectOrNilForKey:kHotMblogButtonsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.actionlog dictionaryRepresentation] forKey:kHotMblogButtonsActionlog];
    [mutableDict setValue:self.pic forKey:kHotMblogButtonsPic];
    [mutableDict setValue:self.type forKey:kHotMblogButtonsType];
    [mutableDict setValue:self.name forKey:kHotMblogButtonsName];

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

    self.actionlog = [aDecoder decodeObjectForKey:kHotMblogButtonsActionlog];
    self.pic = [aDecoder decodeObjectForKey:kHotMblogButtonsPic];
    self.type = [aDecoder decodeObjectForKey:kHotMblogButtonsType];
    self.name = [aDecoder decodeObjectForKey:kHotMblogButtonsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_actionlog forKey:kHotMblogButtonsActionlog];
    [aCoder encodeObject:_pic forKey:kHotMblogButtonsPic];
    [aCoder encodeObject:_type forKey:kHotMblogButtonsType];
    [aCoder encodeObject:_name forKey:kHotMblogButtonsName];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotMblogButtons *copy = [[HotMblogButtons alloc] init];
    
    if (copy) {

        copy.actionlog = [self.actionlog copyWithZone:zone];
        copy.pic = [self.pic copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
