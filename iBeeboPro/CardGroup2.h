//
//  CardGroup2.h
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CardGroup2 : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *cardGroup;
@property (nonatomic, assign) BOOL loadMore;
@property (nonatomic, strong) NSString *modType;
@property (nonatomic, assign) double nextCursor;
@property (nonatomic, assign) double previousCursor;
@property (nonatomic, assign) double page;
@property (nonatomic, assign) double maxPage;
@property (nonatomic, strong) NSString *url;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
