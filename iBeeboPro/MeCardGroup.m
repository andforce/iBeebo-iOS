//
//  MeCardGroup.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MeCardGroup.h"
#import "MeApps.h"
#import "MeUser.h"


NSString *const kMeCardGroupDisplayArrow = @"display_arrow";
NSString *const kMeCardGroupDesc1 = @"desc1";
NSString *const kMeCardGroupSubType = @"sub_type";
NSString *const kMeCardGroupBackgroundColor = @"background_color";
NSString *const kMeCardGroupBold = @"bold";
NSString *const kMeCardGroupButtons = @"buttons";
NSString *const kMeCardGroupPic = @"pic";
NSString *const kMeCardGroupDesc = @"desc";
NSString *const kMeCardGroupDesc2 = @"desc2";
NSString *const kMeCardGroupApps = @"apps";
NSString *const kMeCardGroupCardType = @"card_type";
NSString *const kMeCardGroupScheme = @"scheme";
NSString *const kMeCardGroupItemid = @"itemid";
NSString *const kMeCardGroupDescExtr = @"desc_extr";
NSString *const kMeCardGroupUser = @"user";


@interface MeCardGroup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MeCardGroup

@synthesize displayArrow = _displayArrow;
@synthesize desc1 = _desc1;
@synthesize subType = _subType;
@synthesize backgroundColor = _backgroundColor;
@synthesize bold = _bold;
@synthesize buttons = _buttons;
@synthesize pic = _pic;
@synthesize desc = _desc;
@synthesize desc2 = _desc2;
@synthesize apps = _apps;
@synthesize cardType = _cardType;
@synthesize scheme = _scheme;
@synthesize itemid = _itemid;
@synthesize descExtr = _descExtr;
@synthesize user = _user;


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
            self.displayArrow = [[self objectOrNilForKey:kMeCardGroupDisplayArrow fromDictionary:dict] doubleValue];
            self.desc1 = [self objectOrNilForKey:kMeCardGroupDesc1 fromDictionary:dict];
            self.subType = [[self objectOrNilForKey:kMeCardGroupSubType fromDictionary:dict] doubleValue];
            self.backgroundColor = [[self objectOrNilForKey:kMeCardGroupBackgroundColor fromDictionary:dict] doubleValue];
            self.bold = [[self objectOrNilForKey:kMeCardGroupBold fromDictionary:dict] doubleValue];
            self.buttons = [self objectOrNilForKey:kMeCardGroupButtons fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kMeCardGroupPic fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kMeCardGroupDesc fromDictionary:dict];
            self.desc2 = [[self objectOrNilForKey:kMeCardGroupDesc2 fromDictionary:dict] doubleValue];
    NSObject *receivedMeApps = [dict objectForKey:kMeCardGroupApps];
    NSMutableArray *parsedMeApps = [NSMutableArray array];
    if ([receivedMeApps isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMeApps) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMeApps addObject:[MeApps modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMeApps isKindOfClass:[NSDictionary class]]) {
       [parsedMeApps addObject:[MeApps modelObjectWithDictionary:(NSDictionary *)receivedMeApps]];
    }

    self.apps = [NSArray arrayWithArray:parsedMeApps];
            self.cardType = [[self objectOrNilForKey:kMeCardGroupCardType fromDictionary:dict] doubleValue];
            self.scheme = [self objectOrNilForKey:kMeCardGroupScheme fromDictionary:dict];
            self.itemid = [self objectOrNilForKey:kMeCardGroupItemid fromDictionary:dict];
            self.descExtr = [self objectOrNilForKey:kMeCardGroupDescExtr fromDictionary:dict];
            self.user = [MeUser modelObjectWithDictionary:[dict objectForKey:kMeCardGroupUser]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.displayArrow] forKey:kMeCardGroupDisplayArrow];
    [mutableDict setValue:self.desc1 forKey:kMeCardGroupDesc1];
    [mutableDict setValue:[NSNumber numberWithDouble:self.subType] forKey:kMeCardGroupSubType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.backgroundColor] forKey:kMeCardGroupBackgroundColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bold] forKey:kMeCardGroupBold];
    [mutableDict setValue:self.buttons forKey:kMeCardGroupButtons];
    [mutableDict setValue:self.pic forKey:kMeCardGroupPic];
    [mutableDict setValue:self.desc forKey:kMeCardGroupDesc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.desc2] forKey:kMeCardGroupDesc2];
    NSMutableArray *tempArrayForApps = [NSMutableArray array];
    for (NSObject *subArrayObject in self.apps) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForApps addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForApps addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForApps] forKey:kMeCardGroupApps];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cardType] forKey:kMeCardGroupCardType];
    [mutableDict setValue:self.scheme forKey:kMeCardGroupScheme];
    [mutableDict setValue:self.itemid forKey:kMeCardGroupItemid];
    [mutableDict setValue:self.descExtr forKey:kMeCardGroupDescExtr];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kMeCardGroupUser];

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

    self.displayArrow = [aDecoder decodeDoubleForKey:kMeCardGroupDisplayArrow];
    self.desc1 = [aDecoder decodeObjectForKey:kMeCardGroupDesc1];
    self.subType = [aDecoder decodeDoubleForKey:kMeCardGroupSubType];
    self.backgroundColor = [aDecoder decodeDoubleForKey:kMeCardGroupBackgroundColor];
    self.bold = [aDecoder decodeDoubleForKey:kMeCardGroupBold];
    self.buttons = [aDecoder decodeObjectForKey:kMeCardGroupButtons];
    self.pic = [aDecoder decodeObjectForKey:kMeCardGroupPic];
    self.desc = [aDecoder decodeObjectForKey:kMeCardGroupDesc];
    self.desc2 = [aDecoder decodeDoubleForKey:kMeCardGroupDesc2];
    self.apps = [aDecoder decodeObjectForKey:kMeCardGroupApps];
    self.cardType = [aDecoder decodeDoubleForKey:kMeCardGroupCardType];
    self.scheme = [aDecoder decodeObjectForKey:kMeCardGroupScheme];
    self.itemid = [aDecoder decodeObjectForKey:kMeCardGroupItemid];
    self.descExtr = [aDecoder decodeObjectForKey:kMeCardGroupDescExtr];
    self.user = [aDecoder decodeObjectForKey:kMeCardGroupUser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_displayArrow forKey:kMeCardGroupDisplayArrow];
    [aCoder encodeObject:_desc1 forKey:kMeCardGroupDesc1];
    [aCoder encodeDouble:_subType forKey:kMeCardGroupSubType];
    [aCoder encodeDouble:_backgroundColor forKey:kMeCardGroupBackgroundColor];
    [aCoder encodeDouble:_bold forKey:kMeCardGroupBold];
    [aCoder encodeObject:_buttons forKey:kMeCardGroupButtons];
    [aCoder encodeObject:_pic forKey:kMeCardGroupPic];
    [aCoder encodeObject:_desc forKey:kMeCardGroupDesc];
    [aCoder encodeDouble:_desc2 forKey:kMeCardGroupDesc2];
    [aCoder encodeObject:_apps forKey:kMeCardGroupApps];
    [aCoder encodeDouble:_cardType forKey:kMeCardGroupCardType];
    [aCoder encodeObject:_scheme forKey:kMeCardGroupScheme];
    [aCoder encodeObject:_itemid forKey:kMeCardGroupItemid];
    [aCoder encodeObject:_descExtr forKey:kMeCardGroupDescExtr];
    [aCoder encodeObject:_user forKey:kMeCardGroupUser];
}

- (id)copyWithZone:(NSZone *)zone
{
    MeCardGroup *copy = [[MeCardGroup alloc] init];
    
    if (copy) {

        copy.displayArrow = self.displayArrow;
        copy.desc1 = [self.desc1 copyWithZone:zone];
        copy.subType = self.subType;
        copy.backgroundColor = self.backgroundColor;
        copy.bold = self.bold;
        copy.buttons = [self.buttons copyWithZone:zone];
        copy.pic = [self.pic copyWithZone:zone];
        copy.desc = [self.desc copyWithZone:zone];
        copy.desc2 = self.desc2;
        copy.apps = [self.apps copyWithZone:zone];
        copy.cardType = self.cardType;
        copy.scheme = [self.scheme copyWithZone:zone];
        copy.itemid = [self.itemid copyWithZone:zone];
        copy.descExtr = [self.descExtr copyWithZone:zone];
        copy.user = [self.user copyWithZone:zone];
    }
    
    return copy;
}


@end
