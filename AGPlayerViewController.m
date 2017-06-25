//
//  AGPlayerViewController.m
//  iBeeboPro
//
//  Created by 迪远 王 on 2017/6/25.
//  Copyright © 2017年 andforce. All rights reserved.
//

#import "AGPlayerViewController.h"
#import "HotPageInfo.h"
#import "HotMediaInfo.h"

@interface AGPlayerViewController ()<TransBundleDelegate>{
    HotPageInfo *_pageInfo;
}

@end

@implementation AGPlayerViewController

- (void)transBundle:(TransBundle *)bundle {
    _pageInfo = [bundle getObjectValue:@"hotPageInfo"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL *demog = [NSURL URLWithString:_pageInfo.mediaInfo.streamUrl];
    [_videoPlayer updatePlayerWithURL:demog];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)exitPlayVideo:(id)sender {
    [_videoPlayer pause];
    _videoPlayer = nil;
    [self dismissViewControllerAnimated:YES completion:^{
        
        
    }];
}
@end
