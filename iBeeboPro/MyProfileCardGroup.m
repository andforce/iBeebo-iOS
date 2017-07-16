//
//  MyProfileCardGroup.m
//
//  Created by   on 2017/7/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MyProfileCardGroup.h"
#import "MyProfileApps.h"
#import "MyProfileUser.h"


NSString *const kMyProfileCardGroupDisplayArrow = @"display_arrow";
NSString *const kMyProfileCardGroupDesc1 = @"desc1";
NSString *const kMyProfileCardGroupSubType = @"sub_type";
NSString *const kMyProfileCardGroupBackgroundColor = @"background_color";
NSString *const kMyProfileCardGroupBold = @"bold";
NSString *const kMyProfileCardGroupButtons = @"buttons";
NSString *const kMyProfileCardGroupPic = @"pic";
NSString *const kMyProfileCardGroupDesc = @"desc";
NSString *const kMyProfileCardGroupDesc2 = @"desc2";
NSString *const kMyProfileCardGroupApps = @"apps";
NSString *const kMyProfileCardGroupCardType = @"card_type";
NSString *const kMyProfileCardGroupScheme = @"scheme";
NSString *const kMyProfileCardGroupItemid = @"itemid";
NSString *const kMyProfileCardGroupDescExtr = @"desc_extr";
NSString *const kMyProfileCardGroupUser = @"user";


@interface MyProfileCardGroup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MyProfileCardGroup

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
            self.displayArrow = [[self objectOrNilForKey:kMyProfileCardGroupDisplayArrow fromDictionary:dict] doubleValue];
            self.desc1 = [self objectOrNilForKey:kMyProfileCardGroupDesc1 fromDictionary:dict];
            self.subType = [[self objectOrNilForKey:kMyProfileCardGroupSubType fromDictionary:dict] doubleValue];
            self.backgroundColor = [[self objectOrNilForKey:kMyProfileCardGroupBackgroundColor fromDictionary:dict] doubleValue];
            self.bold = [[self objectOrNilForKey:kMyProfileCardGroupBold fromDictionary:dict] doubleValue];
            self.buttons = [self objectOrNilForKey:kMyProfileCardGroupButtons fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kMyProfileCardGroupPic fromDictionary:dict];
            self.desc = [self objectOrNilForKey:kMyProfileCardGroupDesc fromDictionary:dict];
            self.desc2 = [[self objectOrNilForKey:kMyProfileCardGroupDesc2 fromDictionary:dict] doubleValue];
    NSObject *receivedMyProfileApps = [dict objectForKey:kMyProfileCardGroupApps];
    NSMutableArray *parsedMyProfileApps = [NSMutableArray array];
    if ([receivedMyProfileApps isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMyProfileApps) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMyProfileApps addObject:[MyProfileApps modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMyProfileApps isKindOfClass:[NSDictionary class]]) {
       [parsedMyProfileApps addObject:[MyProfileApps modelObjectWithDictionary:(NSDictionary *)receivedMyProfileApps]];
    }

    self.apps = [NSArray arrayWithArray:parsedMyProfileApps];
            self.cardType = [[self objectOrNilForKey:kMyProfileCardGroupCardType fromDictionary:dict] doubleValue];
            self.scheme = [self objectOrNilForKey:kMyProfileCardGroupScheme fromDictionary:dict];
            self.itemid = [self objectOrNilForKey:kMyProfileCardGroupItemid fromDictionary:dict];
            self.descExtr = [self objectOrNilForKey:kMyProfileCardGroupDescExtr fromDictionary:dict];
            self.user = [MyProfileUser modelObjectWithDictionary:[dict objectForKey:kMyProfileCardGroupUser]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.displayArrow] forKey:kMyProfileCardGroupDisplayArrow];
    [mutableDict setValue:self.desc1 forKey:kMyProfileCardGroupDesc1];
    [mutableDict setValue:[NSNumber numberWithDouble:self.subType] forKey:kMyProfileCardGroupSubType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.backgroundColor] forKey:kMyProfileCardGroupBackgroundColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bold] forKey:kMyProfileCardGroupBold];
    [mutableDict setValue:self.buttons forKey:kMyProfileCardGroupButtons];
    [mutableDict setValue:self.pic forKey:kMyProfileCardGroupPic];
    [mutableDict setValue:self.desc forKey:kMyProfileCardGroupDesc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.desc2] forKey:kMyProfileCardGroupDesc2];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForApps] forKey:kMyProfileCardGroupApps];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cardType] forKey:kMyProfileCardGroupCardType];
    [mutableDict setValue:self.scheme forKey:kMyProfileCardGroupScheme];
    [mutableDict setValue:self.itemid forKey:kMyProfileCardGroupItemid];
    [mutableDict setValue:self.descExtr forKey:kMyProfileCardGroupDescExtr];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kMyProfileCardGroupUser];

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

    self.displayArrow = [aDecoder decodeDoubleForKey:kMyProfileCardGroupDisplayArrow];
    self.desc1 = [aDecoder decodeObjectForKey:kMyProfileCardGroupDesc1];
    self.subType = [aDecoder decodeDoubleForKey:kMyProfileCardGroupSubType];
    self.backgroundColor = [aDecoder decodeDoubleForKey:kMyProfileCardGroupBackgroundColor];
    self.bold = [aDecoder decodeDoubleForKey:kMyProfileCardGroupBold];
    self.buttons = [aDecoder decodeObjectForKey:kMyProfileCardGroupButtons];
    self.pic = [aDecoder decodeObjectForKey:kMyProfileCardGroupPic];
    self.desc = [aDecoder decodeObjectForKey:kMyProfileCardGroupDesc];
    self.desc2 = [aDecoder decodeDoubleForKey:kMyProfileCardGroupDesc2];
    self.apps = [aDecoder decodeObjectForKey:kMyProfileCardGroupApps];
    self.cardType = [aDecoder decodeDoubleForKey:kMyProfileCardGroupCardType];
    self.scheme = [aDecoder decodeObjectForKey:kMyProfileCardGroupScheme];
    self.itemid = [aDecoder decodeObjectForKey:kMyProfileCardGroupItemid];
    self.descExtr = [aDecoder decodeObjectForKey:kMyProfileCardGroupDescExtr];
    self.user = [aDecoder decodeObjectForKey:kMyProfileCardGroupUser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_displayArrow forKey:kMyProfileCardGroupDisplayArrow];
    [aCoder encodeObject:_desc1 forKey:kMyProfileCardGroupDesc1];
    [aCoder encodeDouble:_subType forKey:kMyProfileCardGroupSubType];
    [aCoder encodeDouble:_backgroundColor forKey:kMyProfileCardGroupBackgroundColor];
    [aCoder encodeDouble:_bold forKey:kMyProfileCardGroupBold];
    [aCoder encodeObject:_buttons forKey:kMyProfileCardGroupButtons];
    [aCoder encodeObject:_pic forKey:kMyProfileCardGroupPic];
    [aCoder encodeObject:_desc forKey:kMyProfileCardGroupDesc];
    [aCoder encodeDouble:_desc2 forKey:kMyProfileCardGroupDesc2];
    [aCoder encodeObject:_apps forKey:kMyProfileCardGroupApps];
    [aCoder encodeDouble:_cardType forKey:kMyProfileCardGroupCardType];
    [aCoder encodeObject:_scheme forKey:kMyProfileCardGroupScheme];
    [aCoder encodeObject:_itemid forKey:kMyProfileCardGroupItemid];
    [aCoder encodeObject:_descExtr forKey:kMyProfileCardGroupDescExtr];
    [aCoder encodeObject:_user forKey:kMyProfileCardGroupUser];
}

- (id)copyWithZone:(NSZone *)zone
{
    MyProfileCardGroup *copy = [[MyProfileCardGroup alloc] init];
    
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
