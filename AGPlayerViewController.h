//
//  AGPlayerViewController.h
//  iBeeboPro
//
//  Created by 迪远 王 on 2017/6/25.
//  Copyright © 2017年 andforce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGPlayerView.h"
#import "TransBundleUIViewController.h"

@interface AGPlayerViewController : TransBundleUIViewController

@property (weak, nonatomic) IBOutlet AGPlayerView *videoPlayer;
- (IBAction)exitPlayVideo:(id)sender;

@end
