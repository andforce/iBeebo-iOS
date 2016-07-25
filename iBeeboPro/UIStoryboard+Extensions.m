//
//  UIStoryboard+Extensions.m
//  iBeeboPro
//
//  Created by 迪远 王 on 16/7/24.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import "UIStoryboard+Extensions.h"
#import "AppDelegate.h"

@implementation UIStoryboard(Extensions)

+(UIStoryboard *)mainStoryboard{
    return [self storyboardWithName:@"Main" bundle:nil];
}

-(UIViewController *)instantiateViewController:(Class) controller{
    NSString * controllerIdentifier = NSStringFromClass(controller);
    return [self instantiateViewControllerWithIdentifier:controllerIdentifier];
}

-(void)changeRootViewController:(Class)controller{
    UITabBarController *rootViewController = [self instantiateViewController:controller];
    
    [[UIApplication sharedApplication].keyWindow setRootViewController:rootViewController];
    
    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    
    [UIView transitionWithView:app.window
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromTop
                    animations:^{
                        app.window.rootViewController = rootViewController;
                    }
                    completion:nil];
}

@end
