//
//  WeiboPage.h
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WeiboPage : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) BOOL loadMore;
@property (nonatomic, strong) NSString *modType;
@property (nonatomic, assign) double nextCursor;
@property (nonatomic, assign) double previousCursor;
@property (nonatomic, assign) double page;
@property (nonatomic, assign) double maxPage;
@property (nonatomic, strong) NSArray *cardGroup;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
