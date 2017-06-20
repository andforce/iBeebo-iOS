//
//  CmtCommentPage.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CmtCommentPage.h"
#import "CmtCardGroup.h"


NSString *const kCmtCommentPageNextCursor = @"next_cursor";
NSString *const kCmtCommentPagePreviousCursor = @"previous_cursor";
NSString *const kCmtCommentPageCardGroup = @"card_group";
NSString *const kCmtCommentPageModType = @"mod_type";


@interface CmtCommentPage ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CmtCommentPage

@synthesize nextCursor = _nextCursor;
@synthesize previousCursor = _previousCursor;
@synthesize cardGroup = _cardGroup;
@synthesize modType = _modType;


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
            self.nextCursor = [self objectOrNilForKey:kCmtCommentPageNextCursor fromDictionary:dict];
            self.previousCursor = [self objectOrNilForKey:kCmtCommentPagePreviousCursor fromDictionary:dict];
    NSObject *receivedCmtCardGroup = [dict objectForKey:kCmtCommentPageCardGroup];
    NSMutableArray *parsedCmtCardGroup = [NSMutableArray array];
    if ([receivedCmtCardGroup isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCmtCardGroup) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCmtCardGroup addObject:[CmtCardGroup modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCmtCardGroup isKindOfClass:[NSDictionary class]]) {
       [parsedCmtCardGroup addObject:[CmtCardGroup modelObjectWithDictionary:(NSDictionary *)receivedCmtCardGroup]];
    }

    self.cardGroup = [NSArray arrayWithArray:parsedCmtCardGroup];
            self.modType = [self objectOrNilForKey:kCmtCommentPageModType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.nextCursor forKey:kCmtCommentPageNextCursor];
    [mutableDict setValue:self.previousCursor forKey:kCmtCommentPagePreviousCursor];
    NSMutableArray *tempArrayForCardGroup = [NSMutableArray array];
    for (NSObject *subArrayObject in self.cardGroup) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCardGroup addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCardGroup addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCardGroup] forKey:kCmtCommentPageCardGroup];
    [mutableDict setValue:self.modType forKey:kCmtCommentPageModType];

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

    self.nextCursor = [aDecoder decodeObjectForKey:kCmtCommentPageNextCursor];
    self.previousCursor = [aDecoder decodeObjectForKey:kCmtCommentPagePreviousCursor];
    self.cardGroup = [aDecoder decodeObjectForKey:kCmtCommentPageCardGroup];
    self.modType = [aDecoder decodeObjectForKey:kCmtCommentPageModType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_nextCursor forKey:kCmtCommentPageNextCursor];
    [aCoder encodeObject:_previousCursor forKey:kCmtCommentPagePreviousCursor];
    [aCoder encodeObject:_cardGroup forKey:kCmtCommentPageCardGroup];
    [aCoder encodeObject:_modType forKey:kCmtCommentPageModType];
}

- (id)copyWithZone:(NSZone *)zone
{
    CmtCommentPage *copy = [[CmtCommentPage alloc] init];
    
    if (copy) {

        copy.nextCursor = [self.nextCursor copyWithZone:zone];
        copy.previousCursor = [self.previousCursor copyWithZone:zone];
        copy.cardGroup = [self.cardGroup copyWithZone:zone];
        copy.modType = [self.modType copyWithZone:zone];
    }
    
    return copy;
}


@end
