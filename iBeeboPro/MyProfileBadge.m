//
//  MyProfileBadge.m
//
//  Created by   on 2017/7/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MyProfileBadge.h"


NSString *const kMyProfileBadgeGongyi = @"gongyi";
NSString *const kMyProfileBadgeLolMsi2017 = @"lol_msi_2017";
NSString *const kMyProfileBadgeVipActivity1 = @"vip_activity1";
NSString *const kMyProfileBadgeVideoAttention = @"video_attention";
NSString *const kMyProfileBadgeTaobao = @"taobao";
NSString *const kMyProfileBadgeSuperStar2017 = @"super_star_2017";
NSString *const kMyProfileBadgeOlympic2016 = @"olympic_2016";
NSString *const kMyProfileBadgeUnreadPoolExt = @"unread_pool_ext";
NSString *const kMyProfileBadgeBindTaobao = @"bind_taobao";
NSString *const kMyProfileBadgeLeagueBadge = @"league_badge";
NSString *const kMyProfileBadgeGongyiLevel = @"gongyi_level";
NSString *const kMyProfileBadgeSelfMedia = @"self_media";
NSString *const kMyProfileBadgeUnreadPool = @"unread_pool";
NSString *const kMyProfileBadgeSuishoupai2017 = @"suishoupai_2017";
NSString *const kMyProfileBadgeAnniversary = @"anniversary";
NSString *const kMyProfileBadgeUcDomain = @"uc_domain";
NSString *const kMyProfileBadgeUefaEuro2016 = @"uefa_euro_2016";
NSString *const kMyProfileBadgeDaiyan = @"daiyan";
NSString *const kMyProfileBadgeDailv = @"dailv";
NSString *const kMyProfileBadgeAli1688 = @"ali_1688";
NSString *const kMyProfileBadgeDiscount2016 = @"discount_2016";
NSString *const kMyProfileBadgeFoolsDay2016 = @"fools_day_2016";
NSString *const kMyProfileBadgeVipActivity2 = @"vip_activity2";
NSString *const kMyProfileBadgeEnterprise = @"enterprise";
NSString *const kMyProfileBadgeDzwbqlx2016 = @"dzwbqlx_2016";
NSString *const kMyProfileBadgeZongyiji = @"zongyiji";
NSString *const kMyProfileBadgeFollowWhitelistVideo = @"follow_whitelist_video";


@interface MyProfileBadge ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MyProfileBadge

@synthesize gongyi = _gongyi;
@synthesize lolMsi2017 = _lolMsi2017;
@synthesize vipActivity1 = _vipActivity1;
@synthesize videoAttention = _videoAttention;
@synthesize taobao = _taobao;
@synthesize superStar2017 = _superStar2017;
@synthesize olympic2016 = _olympic2016;
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
@synthesize dailv = _dailv;
@synthesize ali1688 = _ali1688;
@synthesize discount2016 = _discount2016;
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
            self.gongyi = [[self objectOrNilForKey:kMyProfileBadgeGongyi fromDictionary:dict] doubleValue];
            self.lolMsi2017 = [[self objectOrNilForKey:kMyProfileBadgeLolMsi2017 fromDictionary:dict] doubleValue];
            self.vipActivity1 = [[self objectOrNilForKey:kMyProfileBadgeVipActivity1 fromDictionary:dict] doubleValue];
            self.videoAttention = [[self objectOrNilForKey:kMyProfileBadgeVideoAttention fromDictionary:dict] doubleValue];
            self.taobao = [[self objectOrNilForKey:kMyProfileBadgeTaobao fromDictionary:dict] doubleValue];
            self.superStar2017 = [[self objectOrNilForKey:kMyProfileBadgeSuperStar2017 fromDictionary:dict] doubleValue];
            self.olympic2016 = [[self objectOrNilForKey:kMyProfileBadgeOlympic2016 fromDictionary:dict] doubleValue];
            self.unreadPoolExt = [[self objectOrNilForKey:kMyProfileBadgeUnreadPoolExt fromDictionary:dict] doubleValue];
            self.bindTaobao = [[self objectOrNilForKey:kMyProfileBadgeBindTaobao fromDictionary:dict] doubleValue];
            self.leagueBadge = [[self objectOrNilForKey:kMyProfileBadgeLeagueBadge fromDictionary:dict] doubleValue];
            self.gongyiLevel = [[self objectOrNilForKey:kMyProfileBadgeGongyiLevel fromDictionary:dict] doubleValue];
            self.selfMedia = [[self objectOrNilForKey:kMyProfileBadgeSelfMedia fromDictionary:dict] doubleValue];
            self.unreadPool = [[self objectOrNilForKey:kMyProfileBadgeUnreadPool fromDictionary:dict] doubleValue];
            self.suishoupai2017 = [[self objectOrNilForKey:kMyProfileBadgeSuishoupai2017 fromDictionary:dict] doubleValue];
            self.anniversary = [[self objectOrNilForKey:kMyProfileBadgeAnniversary fromDictionary:dict] doubleValue];
            self.ucDomain = [[self objectOrNilForKey:kMyProfileBadgeUcDomain fromDictionary:dict] doubleValue];
            self.uefaEuro2016 = [[self objectOrNilForKey:kMyProfileBadgeUefaEuro2016 fromDictionary:dict] doubleValue];
            self.daiyan = [[self objectOrNilForKey:kMyProfileBadgeDaiyan fromDictionary:dict] doubleValue];
            self.dailv = [[self objectOrNilForKey:kMyProfileBadgeDailv fromDictionary:dict] doubleValue];
            self.ali1688 = [[self objectOrNilForKey:kMyProfileBadgeAli1688 fromDictionary:dict] doubleValue];
            self.discount2016 = [[self objectOrNilForKey:kMyProfileBadgeDiscount2016 fromDictionary:dict] doubleValue];
            self.foolsDay2016 = [[self objectOrNilForKey:kMyProfileBadgeFoolsDay2016 fromDictionary:dict] doubleValue];
            self.vipActivity2 = [[self objectOrNilForKey:kMyProfileBadgeVipActivity2 fromDictionary:dict] doubleValue];
            self.enterprise = [[self objectOrNilForKey:kMyProfileBadgeEnterprise fromDictionary:dict] doubleValue];
            self.dzwbqlx2016 = [[self objectOrNilForKey:kMyProfileBadgeDzwbqlx2016 fromDictionary:dict] doubleValue];
            self.zongyiji = [[self objectOrNilForKey:kMyProfileBadgeZongyiji fromDictionary:dict] doubleValue];
            self.followWhitelistVideo = [[self objectOrNilForKey:kMyProfileBadgeFollowWhitelistVideo fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gongyi] forKey:kMyProfileBadgeGongyi];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lolMsi2017] forKey:kMyProfileBadgeLolMsi2017];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vipActivity1] forKey:kMyProfileBadgeVipActivity1];
    [mutableDict setValue:[NSNumber numberWithDouble:self.videoAttention] forKey:kMyProfileBadgeVideoAttention];
    [mutableDict setValue:[NSNumber numberWithDouble:self.taobao] forKey:kMyProfileBadgeTaobao];
    [mutableDict setValue:[NSNumber numberWithDouble:self.superStar2017] forKey:kMyProfileBadgeSuperStar2017];
    [mutableDict setValue:[NSNumber numberWithDouble:self.olympic2016] forKey:kMyProfileBadgeOlympic2016];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unreadPoolExt] forKey:kMyProfileBadgeUnreadPoolExt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bindTaobao] forKey:kMyProfileBadgeBindTaobao];
    [mutableDict setValue:[NSNumber numberWithDouble:self.leagueBadge] forKey:kMyProfileBadgeLeagueBadge];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gongyiLevel] forKey:kMyProfileBadgeGongyiLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.selfMedia] forKey:kMyProfileBadgeSelfMedia];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unreadPool] forKey:kMyProfileBadgeUnreadPool];
    [mutableDict setValue:[NSNumber numberWithDouble:self.suishoupai2017] forKey:kMyProfileBadgeSuishoupai2017];
    [mutableDict setValue:[NSNumber numberWithDouble:self.anniversary] forKey:kMyProfileBadgeAnniversary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ucDomain] forKey:kMyProfileBadgeUcDomain];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uefaEuro2016] forKey:kMyProfileBadgeUefaEuro2016];
    [mutableDict setValue:[NSNumber numberWithDouble:self.daiyan] forKey:kMyProfileBadgeDaiyan];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dailv] forKey:kMyProfileBadgeDailv];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ali1688] forKey:kMyProfileBadgeAli1688];
    [mutableDict setValue:[NSNumber numberWithDouble:self.discount2016] forKey:kMyProfileBadgeDiscount2016];
    [mutableDict setValue:[NSNumber numberWithDouble:self.foolsDay2016] forKey:kMyProfileBadgeFoolsDay2016];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vipActivity2] forKey:kMyProfileBadgeVipActivity2];
    [mutableDict setValue:[NSNumber numberWithDouble:self.enterprise] forKey:kMyProfileBadgeEnterprise];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dzwbqlx2016] forKey:kMyProfileBadgeDzwbqlx2016];
    [mutableDict setValue:[NSNumber numberWithDouble:self.zongyiji] forKey:kMyProfileBadgeZongyiji];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followWhitelistVideo] forKey:kMyProfileBadgeFollowWhitelistVideo];

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

    self.gongyi = [aDecoder decodeDoubleForKey:kMyProfileBadgeGongyi];
    self.lolMsi2017 = [aDecoder decodeDoubleForKey:kMyProfileBadgeLolMsi2017];
    self.vipActivity1 = [aDecoder decodeDoubleForKey:kMyProfileBadgeVipActivity1];
    self.videoAttention = [aDecoder decodeDoubleForKey:kMyProfileBadgeVideoAttention];
    self.taobao = [aDecoder decodeDoubleForKey:kMyProfileBadgeTaobao];
    self.superStar2017 = [aDecoder decodeDoubleForKey:kMyProfileBadgeSuperStar2017];
    self.olympic2016 = [aDecoder decodeDoubleForKey:kMyProfileBadgeOlympic2016];
    self.unreadPoolExt = [aDecoder decodeDoubleForKey:kMyProfileBadgeUnreadPoolExt];
    self.bindTaobao = [aDecoder decodeDoubleForKey:kMyProfileBadgeBindTaobao];
    self.leagueBadge = [aDecoder decodeDoubleForKey:kMyProfileBadgeLeagueBadge];
    self.gongyiLevel = [aDecoder decodeDoubleForKey:kMyProfileBadgeGongyiLevel];
    self.selfMedia = [aDecoder decodeDoubleForKey:kMyProfileBadgeSelfMedia];
    self.unreadPool = [aDecoder decodeDoubleForKey:kMyProfileBadgeUnreadPool];
    self.suishoupai2017 = [aDecoder decodeDoubleForKey:kMyProfileBadgeSuishoupai2017];
    self.anniversary = [aDecoder decodeDoubleForKey:kMyProfileBadgeAnniversary];
    self.ucDomain = [aDecoder decodeDoubleForKey:kMyProfileBadgeUcDomain];
    self.uefaEuro2016 = [aDecoder decodeDoubleForKey:kMyProfileBadgeUefaEuro2016];
    self.daiyan = [aDecoder decodeDoubleForKey:kMyProfileBadgeDaiyan];
    self.dailv = [aDecoder decodeDoubleForKey:kMyProfileBadgeDailv];
    self.ali1688 = [aDecoder decodeDoubleForKey:kMyProfileBadgeAli1688];
    self.discount2016 = [aDecoder decodeDoubleForKey:kMyProfileBadgeDiscount2016];
    self.foolsDay2016 = [aDecoder decodeDoubleForKey:kMyProfileBadgeFoolsDay2016];
    self.vipActivity2 = [aDecoder decodeDoubleForKey:kMyProfileBadgeVipActivity2];
    self.enterprise = [aDecoder decodeDoubleForKey:kMyProfileBadgeEnterprise];
    self.dzwbqlx2016 = [aDecoder decodeDoubleForKey:kMyProfileBadgeDzwbqlx2016];
    self.zongyiji = [aDecoder decodeDoubleForKey:kMyProfileBadgeZongyiji];
    self.followWhitelistVideo = [aDecoder decodeDoubleForKey:kMyProfileBadgeFollowWhitelistVideo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_gongyi forKey:kMyProfileBadgeGongyi];
    [aCoder encodeDouble:_lolMsi2017 forKey:kMyProfileBadgeLolMsi2017];
    [aCoder encodeDouble:_vipActivity1 forKey:kMyProfileBadgeVipActivity1];
    [aCoder encodeDouble:_videoAttention forKey:kMyProfileBadgeVideoAttention];
    [aCoder encodeDouble:_taobao forKey:kMyProfileBadgeTaobao];
    [aCoder encodeDouble:_superStar2017 forKey:kMyProfileBadgeSuperStar2017];
    [aCoder encodeDouble:_olympic2016 forKey:kMyProfileBadgeOlympic2016];
    [aCoder encodeDouble:_unreadPoolExt forKey:kMyProfileBadgeUnreadPoolExt];
    [aCoder encodeDouble:_bindTaobao forKey:kMyProfileBadgeBindTaobao];
    [aCoder encodeDouble:_leagueBadge forKey:kMyProfileBadgeLeagueBadge];
    [aCoder encodeDouble:_gongyiLevel forKey:kMyProfileBadgeGongyiLevel];
    [aCoder encodeDouble:_selfMedia forKey:kMyProfileBadgeSelfMedia];
    [aCoder encodeDouble:_unreadPool forKey:kMyProfileBadgeUnreadPool];
    [aCoder encodeDouble:_suishoupai2017 forKey:kMyProfileBadgeSuishoupai2017];
    [aCoder encodeDouble:_anniversary forKey:kMyProfileBadgeAnniversary];
    [aCoder encodeDouble:_ucDomain forKey:kMyProfileBadgeUcDomain];
    [aCoder encodeDouble:_uefaEuro2016 forKey:kMyProfileBadgeUefaEuro2016];
    [aCoder encodeDouble:_daiyan forKey:kMyProfileBadgeDaiyan];
    [aCoder encodeDouble:_dailv forKey:kMyProfileBadgeDailv];
    [aCoder encodeDouble:_ali1688 forKey:kMyProfileBadgeAli1688];
    [aCoder encodeDouble:_discount2016 forKey:kMyProfileBadgeDiscount2016];
    [aCoder encodeDouble:_foolsDay2016 forKey:kMyProfileBadgeFoolsDay2016];
    [aCoder encodeDouble:_vipActivity2 forKey:kMyProfileBadgeVipActivity2];
    [aCoder encodeDouble:_enterprise forKey:kMyProfileBadgeEnterprise];
    [aCoder encodeDouble:_dzwbqlx2016 forKey:kMyProfileBadgeDzwbqlx2016];
    [aCoder encodeDouble:_zongyiji forKey:kMyProfileBadgeZongyiji];
    [aCoder encodeDouble:_followWhitelistVideo forKey:kMyProfileBadgeFollowWhitelistVideo];
}

- (id)copyWithZone:(NSZone *)zone
{
    MyProfileBadge *copy = [[MyProfileBadge alloc] init];
    
    if (copy) {

        copy.gongyi = self.gongyi;
        copy.lolMsi2017 = self.lolMsi2017;
        copy.vipActivity1 = self.vipActivity1;
        copy.videoAttention = self.videoAttention;
        copy.taobao = self.taobao;
        copy.superStar2017 = self.superStar2017;
        copy.olympic2016 = self.olympic2016;
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
        copy.dailv = self.dailv;
        copy.ali1688 = self.ali1688;
        copy.discount2016 = self.discount2016;
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
