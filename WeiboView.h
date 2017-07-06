//
//  WeiboView.h
//  iBeeboPro
//
//  Created by 迪远 王 on 2017/7/6.
//  Copyright © 2017年 andforce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeiboView : UIView

-(void)showWeiboContent:(NSString *)avatarUrl name:(NSString *)name time:(NSString*) time content:(NSAttributedString*) content pics:(NSArray *) pics;

-(void)showRepostWeiboContent:(NSString *)avatarUrl name:(NSString *)name time:(NSString*) time content:(NSAttributedString*)content repostContent:(NSAttributedString*) repostContent pics:(NSArray *) pics;

@end
