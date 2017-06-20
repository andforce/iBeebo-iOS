//
//  CmtCommentPage.h
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CmtCommentPage : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *nextCursor;
@property (nonatomic, strong) NSString *previousCursor;
@property (nonatomic, strong) NSArray *cardGroup;
@property (nonatomic, strong) NSString *modType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
