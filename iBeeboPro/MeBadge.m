//
//  MeBadge.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MeBadge.h"


NSString *const kMeBadgeGongyi = @"gongyi";
NSString *const kMeBadgeLolMsi2017 = @"lol_msi_2017";
NSString *const kMeBadgeVipActivity1 = @"vip_activity1";
NSString *const kMeBadgeTaobao = @"taobao";
NSString *const kMeBadgeOlympic2016 = @"olympic_2016";
NSString *const kMeBadgeSuperStar2017 = @"super_star_2017";
NSString *const kMeBadgeUnreadPoolExt = @"unread_pool_ext";
NSString *const kMeBadgeBindTaobao = @"bind_taobao";
NSString *const kMeBadgeLeagueBadge = @"league_badge";
NSString *const kMeBadgeGongyiLevel = @"gongyi_level";
NSString *const kMeBadgeSelfMedia = @"self_media";
NSString *const kMeBadgeUnreadPool = @"unread_pool";
NSString *const kMeBadgeSuishoupai2017 = @"suishoupai_2017";
NSString *const kMeBadgeAnniversary = @"anniversary";
NSString *const kMeBadgeUcDomain = @"uc_domain";
NSString *const kMeBadgeUefaEuro2016 = @"uefa_euro_2016";
NSString *const kMeBadgeDaiyan = @"daiyan";
NSString *const kMeBadgeDiscount2016 = @"discount_2016";
NSString *const kMeBadgeAli1688 = @"ali_1688";
NSString *const kMeBadgeDailv = @"dailv";
NSString *const kMeBadgeFoolsDay2016 = @"fools_day_2016";
NSString *const kMeBadgeVipActivity2 = @"vip_activity2";
NSString *const kMeBadgeEnterprise = @"enterprise";
NSString *const kMeBadgeDzwbqlx2016 = @"dzwbqlx_2016";
NSString *const kMeBadgeZongyiji = @"zongyiji";
NSString *const kMeBadgeFollowWhitelistVideo = @"follow_whitelist_video";


@interface MeBadge ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MeBadge

@synthesize gongyi = _gongyi;
@synthesize lolMsi2017 = _lolMsi2017;
@synthesize vipActivity1 = _vipActivity1;
@synthesize taobao = _taobao;
@synthesize olympic2016 = _olympic2016;
@synthesize superStar2017 = _superStar2017;
@synthesize unreadPoolExt = _unreadPoolExt;
@synthesize bindTaobao = _bindTaobao;
@synthesize leagueBadge = _leagueBadge;
@synthesize gongyiLevel = _gongyiLevel;
@synthesize selfMedia = _selfMedia;
@synthesize unreadPool = _unreadPool;
@synthesize suishoupai2017 = _suishoupai2017;
@synthesize anniversary = _anniversary;
@synthesize ucDomain = _ucDomain;
@synthesize uefaEuro2016 = _uefaEuro2016;
@synthesize daiyan = _daiyan;
@synthesize discount2016 = _discount2016;
@synthesize ali1688 = _ali1688;
@synthesize dailv = _dailv;
@synthesize foolsDay2016 = _foolsDay2016;
@synthesize vipActivity2 = _vipActivity2;
@synthesize enterprise = _enterprise;
@synthesize dzwbqlx2016 = _dzwbqlx2016;
@synthesize zongyiji = _zongyiji;
@synthesize followWhitelistVideo = _followWhitelistVideo;


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
            self.gongyi = [[self objectOrNilForKey:kMeBadgeGongyi fromDictionary:dict] doubleValue];
            self.lolMsi2017 = [[self objectOrNilForKey:kMeBadgeLolMsi2017 fromDictionary:dict] doubleValue];
            self.vipActivity1 = [[self objectOrNilForKey:kMeBadgeVipActivity1 fromDictionary:dict] doubleValue];
            self.taobao = [[self objectOrNilForKey:kMeBadgeTaobao fromDictionary:dict] doubleValue];
            self.olympic2016 = [[self objectOrNilForKey:kMeBadgeOlympic2016 fromDictionary:dict] doubleValue];
            self.superStar2017 = [[self objectOrNilForKey:kMeBadgeSuperStar2017 fromDictionary:dict] doubleValue];
            self.unreadPoolExt = [[self objectOrNilForKey:kMeBadgeUnreadPoolExt fromDictionary:dict] doubleValue];
            self.bindTaobao = [[self objectOrNilForKey:kMeBadgeBindTaobao fromDictionary:dict] doubleValue];
            self.leagueBadge = [[self objectOrNilForKey:kMeBadgeLeagueBadge fromDictionary:dict] doubleValue];
            self.gongyiLevel = [[self objectOrNilForKey:kMeBadgeGongyiLevel fromDictionary:dict] doubleValue];
            self.selfMedia = [[self objectOrNilForKey:kMeBadgeSelfMedia fromDictionary:dict] doubleValue];
            self.unreadPool = [[self objectOrNilForKey:kMeBadgeUnreadPool fromDictionary:dict] doubleValue];
            self.suishoupai2017 = [[self objectOrNilForKey:kMeBadgeSuishoupai2017 fromDictionary:dict] doubleValue];
            self.anniversary = [[self objectOrNilForKey:kMeBadgeAnniversary fromDictionary:dict] doubleValue];
            self.ucDomain = [[self objectOrNilForKey:kMeBadgeUcDomain fromDictionary:dict] doubleValue];
            self.uefaEuro2016 = [[self objectOrNilForKey:kMeBadgeUefaEuro2016 fromDictionary:dict] doubleValue];
            self.daiyan = [[self objectOrNilForKey:kMeBadgeDaiyan fromDictionary:dict] doubleValue];
            self.discount2016 = [[self objectOrNilForKey:kMeBadgeDiscount2016 fromDictionary:dict] doubleValue];
            self.ali1688 = [[self objectOrNilForKey:kMeBadgeAli1688 fromDictionary:dict] doubleValue];
            self.dailv = [[self objectOrNilForKey:kMeBadgeDailv fromDictionary:dict] doubleValue];
            self.foolsDay2016 = [[self objectOrNilForKey:kMeBadgeFoolsDay2016 fromDictionary:dict] doubleValue];
            self.vipActivity2 = [[self objectOrNilForKey:kMeBadgeVipActivity2 fromDictionary:dict] doubleValue];
            self.enterprise = [[self objectOrNilForKey:kMeBadgeEnterprise fromDictionary:dict] doubleValue];
            self.dzwbqlx2016 = [[self objectOrNilForKey:kMeBadgeDzwbqlx2016 fromDictionary:dict] doubleValue];
            self.zongyiji = [[self objectOrNilForKey:kMeBadgeZongyiji fromDictionary:dict] doubleValue];
            self.followWhitelistVideo = [[self objectOrNilForKey:kMeBadgeFollowWhitelistVideo fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gongyi] forKey:kMeBadgeGongyi];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lolMsi2017] forKey:kMeBadgeLolMsi2017];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vipActivity1] forKey:kMeBadgeVipActivity1];
    [mutableDict setValue:[NSNumber numberWithDouble:self.taobao] forKey:kMeBadgeTaobao];
    [mutableDict setValue:[NSNumber numberWithDouble:self.olympic2016] forKey:kMeBadgeOlympic2016];
    [mutableDict setValue:[NSNumber numberWithDouble:self.superStar2017] forKey:kMeBadgeSuperStar2017];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unreadPoolExt] forKey:kMeBadgeUnreadPoolExt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bindTaobao] forKey:kMeBadgeBindTaobao];
    [mutableDict setValue:[NSNumber numberWithDouble:self.leagueBadge] forKey:kMeBadgeLeagueBadge];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gongyiLevel] forKey:kMeBadgeGongyiLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.selfMedia] forKey:kMeBadgeSelfMedia];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unreadPool] forKey:kMeBadgeUnreadPool];
    [mutableDict setValue:[NSNumber numberWithDouble:self.suishoupai2017] forKey:kMeBadgeSuishoupai2017];
    [mutableDict setValue:[NSNumber numberWithDouble:self.anniversary] forKey:kMeBadgeAnniversary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ucDomain] forKey:kMeBadgeUcDomain];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uefaEuro2016] forKey:kMeBadgeUefaEuro2016];
    [mutableDict setValue:[NSNumber numberWithDouble:self.daiyan] forKey:kMeBadgeDaiyan];
    [mutableDict setValue:[NSNumber numberWithDouble:self.discount2016] forKey:kMeBadgeDiscount2016];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ali1688] forKey:kMeBadgeAli1688];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dailv] forKey:kMeBadgeDailv];
    [mutableDict setValue:[NSNumber numberWithDouble:self.foolsDay2016] forKey:kMeBadgeFoolsDay2016];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vipActivity2] forKey:kMeBadgeVipActivity2];
    [mutableDict setValue:[NSNumber numberWithDouble:self.enterprise] forKey:kMeBadgeEnterprise];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dzwbqlx2016] forKey:kMeBadgeDzwbqlx2016];
    [mutableDict setValue:[NSNumber numberWithDouble:self.zongyiji] forKey:kMeBadgeZongyiji];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followWhitelistVideo] forKey:kMeBadgeFollowWhitelistVideo];

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

    self.gongyi = [aDecoder decodeDoubleForKey:kMeBadgeGongyi];
    self.lolMsi2017 = [aDecoder decodeDoubleForKey:kMeBadgeLolMsi2017];
    self.vipActivity1 = [aDecoder decodeDoubleForKey:kMeBadgeVipActivity1];
    self.taobao = [aDecoder decodeDoubleForKey:kMeBadgeTaobao];
    self.olympic2016 = [aDecoder decodeDoubleForKey:kMeBadgeOlympic2016];
    self.superStar2017 = [aDecoder decodeDoubleForKey:kMeBadgeSuperStar2017];
    self.unreadPoolExt = [aDecoder decodeDoubleForKey:kMeBadgeUnreadPoolExt];
    self.bindTaobao = [aDecoder decodeDoubleForKey:kMeBadgeBindTaobao];
    self.leagueBadge = [aDecoder decodeDoubleForKey:kMeBadgeLeagueBadge];
    self.gongyiLevel = [aDecoder decodeDoubleForKey:kMeBadgeGongyiLevel];
    self.selfMedia = [aDecoder decodeDoubleForKey:kMeBadgeSelfMedia];
    self.unreadPool = [aDecoder decodeDoubleForKey:kMeBadgeUnreadPool];
    self.suishoupai2017 = [aDecoder decodeDoubleForKey:kMeBadgeSuishoupai2017];
    self.anniversary = [aDecoder decodeDoubleForKey:kMeBadgeAnniversary];
    self.ucDomain = [aDecoder decodeDoubleForKey:kMeBadgeUcDomain];
    self.uefaEuro2016 = [aDecoder decodeDoubleForKey:kMeBadgeUefaEuro2016];
    self.daiyan = [aDecoder decodeDoubleForKey:kMeBadgeDaiyan];
    self.discount2016 = [aDecoder decodeDoubleForKey:kMeBadgeDiscount2016];
    self.ali1688 = [aDecoder decodeDoubleForKey:kMeBadgeAli1688];
    self.dailv = [aDecoder decodeDoubleForKey:kMeBadgeDailv];
    self.foolsDay2016 = [aDecoder decodeDoubleForKey:kMeBadgeFoolsDay2016];
    self.vipActivity2 = [aDecoder decodeDoubleForKey:kMeBadgeVipActivity2];
    self.enterprise = [aDecoder decodeDoubleForKey:kMeBadgeEnterprise];
    self.dzwbqlx2016 = [aDecoder decodeDoubleForKey:kMeBadgeDzwbqlx2016];
    self.zongyiji = [aDecoder decodeDoubleForKey:kMeBadgeZongyiji];
    self.followWhitelistVideo = [aDecoder decodeDoubleForKey:kMeBadgeFollowWhitelistVideo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_gongyi forKey:kMeBadgeGongyi];
    [aCoder encodeDouble:_lolMsi2017 forKey:kMeBadgeLolMsi2017];
    [aCoder encodeDouble:_vipActivity1 forKey:kMeBadgeVipActivity1];
    [aCoder encodeDouble:_taobao forKey:kMeBadgeTaobao];
    [aCoder encodeDouble:_olympic2016 forKey:kMeBadgeOlympic2016];
    [aCoder encodeDouble:_superStar2017 forKey:kMeBadgeSuperStar2017];
    [aCoder encodeDouble:_unreadPoolExt forKey:kMeBadgeUnreadPoolExt];
    [aCoder encodeDouble:_bindTaobao forKey:kMeBadgeBindTaobao];
    [aCoder encodeDouble:_leagueBadge forKey:kMeBadgeLeagueBadge];
    [aCoder encodeDouble:_gongyiLevel forKey:kMeBadgeGongyiLevel];
    [aCoder encodeDouble:_selfMedia forKey:kMeBadgeSelfMedia];
    [aCoder encodeDouble:_unreadPool forKey:kMeBadgeUnreadPool];
    [aCoder encodeDouble:_suishoupai2017 forKey:kMeBadgeSuishoupai2017];
    [aCoder encodeDouble:_anniversary forKey:kMeBadgeAnniversary];
    [aCoder encodeDouble:_ucDomain forKey:kMeBadgeUcDomain];
    [aCoder encodeDouble:_uefaEuro2016 forKey:kMeBadgeUefaEuro2016];
    [aCoder encodeDouble:_daiyan forKey:kMeBadgeDaiyan];
    [aCoder encodeDouble:_discount2016 forKey:kMeBadgeDiscount2016];
    [aCoder encodeDouble:_ali1688 forKey:kMeBadgeAli1688];
    [aCoder encodeDouble:_dailv forKey:kMeBadgeDailv];
    [aCoder encodeDouble:_foolsDay2016 forKey:kMeBadgeFoolsDay2016];
    [aCoder encodeDouble:_vipActivity2 forKey:kMeBadgeVipActivity2];
    [aCoder encodeDouble:_enterprise forKey:kMeBadgeEnterprise];
    [aCoder encodeDouble:_dzwbqlx2016 forKey:kMeBadgeDzwbqlx2016];
    [aCoder encodeDouble:_zongyiji forKey:kMeBadgeZongyiji];
    [aCoder encodeDouble:_followWhitelistVideo forKey:kMeBadgeFollowWhitelistVideo];
}

- (id)copyWithZone:(NSZone *)zone
{
    MeBadge *copy = [[MeBadge alloc] init];
    
    if (copy) {

        copy.gongyi = self.gongyi;
        copy.lolMsi2017 = self.lolMsi2017;
        copy.vipActivity1 = self.vipActivity1;
        copy.taobao = self.taobao;
        copy.olympic2016 = self.olympic2016;
        copy.superStar2017 = self.superStar2017;
        copy.unreadPoolExt = self.unreadPoolExt;
        copy.bindTaobao = self.bindTaobao;
        copy.leagueBadge = self.leagueBadge;
        copy.gongyiLevel = self.gongyiLevel;
        copy.selfMedia = self.selfMedia;
        copy.unreadPool = self.unreadPool;
        copy.suishoupai2017 = self.suishoupai2017;
        copy.anniversary = self.anniversary;
        copy.ucDomain = self.ucDomain;
        copy.uefaEuro2016 = self.uefaEuro2016;
        copy.daiyan = self.daiyan;
        copy.discount2016 = self.discount2016;
        copy.ali1688 = self.ali1688;
        copy.dailv = self.dailv;
        copy.foolsDay2016 = self.foolsDay2016;
        copy.vipActivity2 = self.vipActivity2;
        copy.enterprise = self.enterprise;
        copy.dzwbqlx2016 = self.dzwbqlx2016;
        copy.zongyiji = self.zongyiji;
        copy.followWhitelistVideo = self.followWhitelistVideo;
    }
    
    return copy;
}


@end
