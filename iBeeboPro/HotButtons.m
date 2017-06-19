//
//  HotButtons.m
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HotButtons.h"
#import "HotActionlog.h"
#import "HotParams.h"


NSString *const kHotButtonsActionlog = @"actionlog";
NSString *const kHotButtonsPic = @"pic";
NSString *const kHotButtonsType = @"type";
NSString *const kHotButtonsName = @"name";
NSString *const kHotButtonsParams = @"params";


@interface HotButtons ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotButtons

@synthesize actionlog = _actionlog;
@synthesize pic = _pic;
@synthesize type = _type;
@synthesize name = _name;
@synthesize params = _params;


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
            self.actionlog = [HotActionlog modelObjectWithDictionary:[dict objectForKey:kHotButtonsActionlog]];
            self.pic = [self objectOrNilForKey:kHotButtonsPic fromDictionary:dict];
            self.type = [self objectOrNilForKey:kHotButtonsType fromDictionary:dict];
            self.name = [self objectOrNilForKey:kHotButtonsName fromDictionary:dict];
            self.params = [HotParams modelObjectWithDictionary:[dict objectForKey:kHotButtonsParams]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.actionlog dictionaryRepresentation] forKey:kHotButtonsActionlog];
    [mutableDict setValue:self.pic forKey:kHotButtonsPic];
    [mutableDict setValue:self.type forKey:kHotButtonsType];
    [mutableDict setValue:self.name forKey:kHotButtonsName];
    [mutableDict setValue:[self.params dictionaryRepresentation] forKey:kHotButtonsParams];

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

    self.actionlog = [aDecoder decodeObjectForKey:kHotButtonsActionlog];
    self.pic = [aDecoder decodeObjectForKey:kHotButtonsPic];
    self.type = [aDecoder decodeObjectForKey:kHotButtonsType];
    self.name = [aDecoder decodeObjectForKey:kHotButtonsName];
    self.params = [aDecoder decodeObjectForKey:kHotButtonsParams];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_actionlog forKey:kHotButtonsActionlog];
    [aCoder encodeObject:_pic forKey:kHotButtonsPic];
    [aCoder encodeObject:_type forKey:kHotButtonsType];
    [aCoder encodeObject:_name forKey:kHotButtonsName];
    [aCoder encodeObject:_params forKey:kHotButtonsParams];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotButtons *copy = [[HotButtons alloc] init];
    
    if (copy) {

        copy.actionlog = [self.actionlog copyWithZone:zone];
        copy.pic = [self.pic copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.params = [self.params copyWithZone:zone];
    }
    
    return copy;
}


@end
