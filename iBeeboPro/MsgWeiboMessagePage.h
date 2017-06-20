//
//  MsgWeiboMessagePage.h
//
//  Created by   on 2017/6/20
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MsgWeiboMessagePage : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *cardGroup;
@property (nonatomic, assign) BOOL loadMore;
@property (nonatomic, strong) NSString *modType;
@property (nonatomic, strong) NSString *nextCursor;
@property (nonatomic, strong) NSString *previousCursor;
@property (nonatomic, assign) double page;
@property (nonatomic, assign) double maxPage;
@property (nonatomic, strong) NSString *url;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
