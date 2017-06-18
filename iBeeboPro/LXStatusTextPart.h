//
//  LXStatusTextPart.h
//  LXWeibo
//
//  Created by 从今以后 on 15/10/9.
//  Copyright © 2015年 从今以后. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, LinkType) {
    LinkTypeNone,   //默认从0开始
    LinkTypeAt,
    LinkTypeHuaTi,
    LinkTypeEmoation,
    LinkTypeLink,
    LinkTypeQuanWen,
    LinkReturn,
};


@interface LXStatusTextPart : NSObject

/** 文字的内容. */
@property (nonatomic, copy) NSString *text;
/** 文字的范围. */
@property (nonatomic, assign) NSRange range;

/** LinkType */
@property (nonatomic, assign) LinkType linkType;

@end

NS_ASSUME_NONNULL_END
