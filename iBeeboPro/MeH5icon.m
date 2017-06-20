//
//  MeH5icon.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MeH5icon.h"


NSString *const kMeH5iconOther = @"other";
NSString *const kMeH5iconMain = @"main";


@interface MeH5icon ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MeH5icon

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
            self.other = [self objectOrNilForKey:kMeH5iconOther fromDictionary:dict];
            self.main = [self objectOrNilForKey:kMeH5iconMain fromDictionary:dict];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOther] forKey:kMeH5iconOther];
    [mutableDict setValue:self.main forKey:kMeH5iconMain];

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

    self.other = [aDecoder decodeObjectForKey:kMeH5iconOther];
    self.main = [aDecoder decodeObjectForKey:kMeH5iconMain];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_other forKey:kMeH5iconOther];
    [aCoder encodeObject:_main forKey:kMeH5iconMain];
}

- (id)copyWithZone:(NSZone *)zone
{
    MeH5icon *copy = [[MeH5icon alloc] init];
    
    if (copy) {

        copy.other = [self.other copyWithZone:zone];
        copy.main = [self.main copyWithZone:zone];
    }
    
    return copy;
}


@end
