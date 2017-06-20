//
//  MeBadge.h
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MeBadge : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double gongyi;
@property (nonatomic, assign) double lolMsi2017;
@property (nonatomic, assign) double vipActivity1;
@property (nonatomic, assign) double taobao;
@property (nonatomic, assign) double olympic2016;
@property (nonatomic, assign) double superStar2017;
@property (nonatomic, assign) double unreadPoolExt;
@property (nonatomic, assign) double bindTaobao;
@property (nonatomic, assign) double leagueBadge;
@property (nonatomic, assign) double gongyiLevel;
@property (nonatomic, assign) double selfMedia;
@property (nonatomic, assign) double unreadPool;
@property (nonatomic, assign) double suishoupai2017;
@property (nonatomic, assign) double anniversary;
@property (nonatomic, assign) double ucDomain;
@property (nonatomic, assign) double uefaEuro2016;
@property (nonatomic, assign) double daiyan;
@property (nonatomic, assign) double discount2016;
@property (nonatomic, assign) double ali1688;
@property (nonatomic, assign) double dailv;
@property (nonatomic, assign) double foolsDay2016;
@property (nonatomic, assign) double vipActivity2;
@property (nonatomic, assign) double enterprise;
@property (nonatomic, assign) double dzwbqlx2016;
@property (nonatomic, assign) double zongyiji;
@property (nonatomic, assign) double followWhitelistVideo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
