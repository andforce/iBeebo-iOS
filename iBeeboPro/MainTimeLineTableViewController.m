//
//  MainTimeLineTableViewController.m
//  iBeeboPro
//
//  Created by 迪远 王 on 16/7/25.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import "MainTimeLineTableViewController.h"
#import "AFHTTPSessionManager+SimpleAction.h"
#import "WeiboPage.h"
#import "Mblog.h"
#import "TimeLineCell.h"
#import "CardGroup.h"
#import "User.h"
#import "LXStatusTextLink.h"
#import "LXStatusTextPart.h"
#import <UIImageView+WebCache.h>
#import "RegexKitLite.h"
#import "EmotionsManager.h"
#import "Emotion.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "NSString+Extensions.h"
#import "WeiboJsonCleanner.h"
#import "TimeLine1ImagesCell.h"
#import "TimeLine2ImagesCell.h"
#import "Pics.h"
#import "RetweetedStatus.h"


@interface MainTimeLineTableViewController ()<UITextViewDelegate>{
    AFHTTPSessionManager *_browser;
    
    NSMutableArray * _mblogs;
    
    WeiboJsonCleanner *_cleanner;
}

@end

@implementation MainTimeLineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cleanner = [[WeiboJsonCleanner alloc] init];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 180.0;
    

    
    _mblogs = [NSMutableArray array];
    
    _browser = [AFHTTPSessionManager manager];
    _browser.responseSerializer = [AFHTTPResponseSerializer serializer];
    _browser.responseSerializer.acceptableContentTypes = [_browser.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    
    
    [_browser GETWithURLString:@"http://m.weibo.cn/index/feed?format=cards" requestCallback:^(BOOL isSuccess, NSString *html) {
        NSString * debugStr = [_cleanner cleanHtmlTag:html];

        //NSArray * atUrls = [debugStr arrayWithRegulat:@"<a href=\'/n/[\\u4e00-\\u9fa5_a-zA-Z0-9-]+\'>@[\\u4e00-\\u9fa5_a-zA-Z0-9-]+</a>"];
        
        NSData *data = [debugStr dataUsingEncoding:NSUTF8StringEncoding];
        
        NSArray *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        WeiboPage * page = [WeiboPage modelObjectWithDictionary:[dictionary firstObject]];
        
        NSArray *cardGroup = page.cardGroup;
        
        [_mblogs addObjectsFromArray:cardGroup];
        
        [self.tableView reloadData];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _mblogs.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    CardGroup * cardGroup = [_mblogs objectAtIndex:indexPath.row];
    
    RetweetedStatus * retweet = cardGroup.mblog.retweetedStatus;
    
    NSString * retweetFlag = retweet.text == nil ? @"" : @"Retweet";
    int count = retweet.text == nil ? (int)cardGroup.mblog.pics.count : 1;
    NSString * Identifier = [NSString stringWithFormat:@"TimeLine%dImagesCell%@", count,retweetFlag];
    TimeLineCell * cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    cell.fd_enforceFrameLayout = NO;
    
    [cell showStatus:cardGroup.mblog];
    return cell;
}

-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    
    return YES;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    CardGroup * cardGroup = [_mblogs objectAtIndex:indexPath.row];
    
    
    RetweetedStatus * retweet = cardGroup.mblog.retweetedStatus;
    
    NSString * retweetFlag = retweet.text == nil ? @"" : @"Retweet";
    int count = retweet.text == nil ? (int)cardGroup.mblog.pics.count : 1;
    NSString * Identifier = [NSString stringWithFormat:@"TimeLine%dImagesCell%@", count,retweetFlag];
    return [tableView fd_heightForCellWithIdentifier:Identifier configuration:^(TimeLineCell *cell) {
        cell.fd_enforceFrameLayout = NO;
        
        CardGroup * cardGroup = [_mblogs objectAtIndex:indexPath.row];

        [cell showStatus:cardGroup.mblog];
        
    }];
}





@end
