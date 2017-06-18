//
//  MainTimeLineTableViewController.m
//  iBeeboPro
//
//  Created by 迪远 王 on 16/7/25.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import "MainTimeLineTableViewController.h"
#import "WeiboPage.h"
#import "Mblog.h"
#import "TimeLineCell.h"
#import "CardGroup.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "MJRefresh.h"
#import "RetweetedWeibo.h"
#import "WeiboHelper.h"

@interface MainTimeLineTableViewController ()<UITextViewDelegate>{
    
    NSMutableArray<Weibo *> * _mblogs;
    WeiboHelper * _weiboHelper;
    
    WeiboPage * _currentPage;
}

@end

@implementation MainTimeLineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 180.0;
    

    
    _mblogs = [NSMutableArray array];
    
    _weiboHelper = [[WeiboHelper alloc] init];
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [_weiboHelper fetchTimeLine:-1 page:1 withCallback:^(WeiboPage *weiboPage) {
            
            _currentPage = weiboPage;
            
            for (CardGroup * cg in weiboPage.cardGroup){
                if (cg.mblog.text != nil){
                    [_mblogs addObject:[[Weibo alloc] initWithMBlog:cg.mblog]];
                }
            }

            
            [self.tableView reloadData];
            
            [self.tableView.mj_header endRefreshing];
        
        }];
    }];
    
    [self.tableView.mj_header beginRefreshing];
    
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{

        [_weiboHelper fetchTimeLine:_currentPage.nextCursor page:1 withCallback:^(WeiboPage *weiboPage) {
            
            _currentPage = weiboPage;
            
            NSArray *cardGroup = weiboPage.cardGroup;
            
            [_mblogs addObjectsFromArray:cardGroup];
            
            [self.tableView reloadData];
            
            [self.tableView.mj_footer endRefreshing];
            
        }];
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

    Weibo * cardGroup = _mblogs[(NSUInteger) indexPath.row];
    
    RetweetedWeibo * retweet = cardGroup.retweetedStatus;
    
    BOOL isRetweet = retweet.text != nil;
    NSString * retweetFlag = isRetweet ? @"Retweet" : @"";
    int count = isRetweet ? (int)cardGroup.retweetedStatus.pics.count : (int)cardGroup.pics.count;
    NSString * Identifier = [NSString stringWithFormat:@"TimeLine%dImagesCell%@", count,retweetFlag];
    TimeLineCell * cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    cell.fd_enforceFrameLayout = NO;
    
    [cell showStatus:cardGroup forRetweet:isRetweet];
    return cell;
}

-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    
    return YES;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    Weibo * cardGroup = [_mblogs objectAtIndex:indexPath.row];
//
//
//    RetweetedWeibo * retweet = cardGroup.retweetedStatus;
//
//    BOOL isRetweet = retweet.text != nil;
//    NSString * retweetFlag = isRetweet ? @"Retweet" : @"";
//    int count = isRetweet ? (int)cardGroup.retweetedStatus.pics.count : (int)cardGroup.pics.count;
//    NSString * Identifier = [NSString stringWithFormat:@"TimeLine%dImagesCell%@", count,retweetFlag];
//
//    return [tableView fd_heightForCellWithIdentifier:Identifier configuration:^(TimeLineCell *cell) {
//        cell.fd_enforceFrameLayout = NO;
//
//        CardGroup * cardGroup = [_mblogs objectAtIndex:indexPath.row];
//
//        [cell showStatus:cardGroup.mblog forRetweet:isRetweet];
//
//    }];
//}





@end
