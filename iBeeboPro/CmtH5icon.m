//
//  CmtH5icon.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CmtH5icon.h"


NSString *const kCmtH5iconOther = @"other";
NSString *const kCmtH5iconMain = @"main";


@interface CmtH5icon ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CmtH5icon

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
            self.other = [self objectOrNilForKey:kCmtH5iconOther fromDictionary:dict];
            self.main = [[self objectOrNilForKey:kCmtH5iconMain fromDictionary:dict] doubleValue];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOther] forKey:kCmtH5iconOther];
    [mutableDict setValue:[NSNumber numberWithDouble:self.main] forKey:kCmtH5iconMain];

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

    self.other = [aDecoder decodeObjectForKey:kCmtH5iconOther];
    self.main = [aDecoder decodeDoubleForKey:kCmtH5iconMain];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_other forKey:kCmtH5iconOther];
    [aCoder encodeDouble:_main forKey:kCmtH5iconMain];
}

- (id)copyWithZone:(NSZone *)zone
{
    CmtH5icon *copy = [[CmtH5icon alloc] init];
    
    if (copy) {

        copy.other = [self.other copyWithZone:zone];
        copy.main = self.main;
    }
    
    return copy;
}


@end
