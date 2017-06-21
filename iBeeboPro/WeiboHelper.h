//
//  WeiboHelper.h
//  iBeeboPro
//
//  Created by 迪远 王 on 2017/4/9.
//  Copyright © 2017年 andforce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeiboPage.h"

@class HotWeiboPage;
@class AtMeAtMePage;

typedef void(^RequestWeiboPageCallback)(WeiboPage *weiboPage);

typedef void(^HotWeiboCallback)(HotWeiboPage *weiboPage);

typedef void(^AtMeCallback)(AtMeAtMePage *weiboPage);

@interface WeiboHelper : NSObject

- (void) fetchTimeLine:(double) cursor page:(int) page withCallback:(RequestWeiboPageCallback) callback;

- (void) fetchHot:(double) since_id withCallback:(HotWeiboCallback) callback;

- (void) fetchAtMe:(NSString *) subtype wiht:(int) page withCallback:(AtMeCallback) callback;

@end
