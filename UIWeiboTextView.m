//
//  UIWeiboTextView.m
//  iBeeboPro
//
//  Created by 迪远 王 on 16/7/30.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import "UIWeiboTextView.h"

@implementation UIWeiboTextView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    [UIMenuController sharedMenuController].menuVisible = NO;  //do not display the menu
    [self resignFirstResponder];                      //do not allow the user to selected anything
    return NO;
}

#pragma overide
-(void)didAddSubview:(UIView *)subview{
    self.textContainerInset = UIEdgeInsetsMake(0, 6, 0, 6);
}

@end
