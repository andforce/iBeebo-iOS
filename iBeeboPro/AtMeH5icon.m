//
//  AtMeH5icon.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "AtMeH5icon.h"


NSString *const kAtMeH5iconOther = @"other";
NSString *const kAtMeH5iconMain = @"main";


@interface AtMeH5icon ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AtMeH5icon

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
            self.other = [self objectOrNilForKey:kAtMeH5iconOther fromDictionary:dict];
            self.main = [[self objectOrNilForKey:kAtMeH5iconMain fromDictionary:dict] doubleValue];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOther] forKey:kAtMeH5iconOther];
    [mutableDict setValue:[NSNumber numberWithDouble:self.main] forKey:kAtMeH5iconMain];

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

    self.other = [aDecoder decodeObjectForKey:kAtMeH5iconOther];
    self.main = [aDecoder decodeDoubleForKey:kAtMeH5iconMain];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_other forKey:kAtMeH5iconOther];
    [aCoder encodeDouble:_main forKey:kAtMeH5iconMain];
}

- (id)copyWithZone:(NSZone *)zone
{
    AtMeH5icon *copy = [[AtMeH5icon alloc] init];
    
    if (copy) {

        copy.other = [self.other copyWithZone:zone];
        copy.main = self.main;
    }
    
    return copy;
}


@end
