//
//  H5icon.m
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "H5icon.h"


NSString *const kH5iconOther = @"other";
NSString *const kH5iconMain = @"main";


@interface H5icon ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation H5icon

@synthesize other = _other;
@synthesize main = _main;


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
            self.other = [self objectOrNilForKey:kH5iconOther fromDictionary:dict];
            self.main = [self objectOrNilForKey:kH5iconMain fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForOther = [NSMutableArray array];
    for (NSObject *subArrayObject in self.other) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForOther addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForOther addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOther] forKey:kH5iconOther];
    [mutableDict setValue:self.main forKey:kH5iconMain];

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

    self.other = [aDecoder decodeObjectForKey:kH5iconOther];
    self.main = [aDecoder decodeObjectForKey:kH5iconMain];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_other forKey:kH5iconOther];
    [aCoder encodeObject:_main forKey:kH5iconMain];
}

- (id)copyWithZone:(NSZone *)zone
{
    H5icon *copy = [[H5icon alloc] init];
    
    if (copy) {

        copy.other = [self.other copyWithZone:zone];
        copy.main = [self.main copyWithZone:zone];
    }
    
    return copy;
}


@end
