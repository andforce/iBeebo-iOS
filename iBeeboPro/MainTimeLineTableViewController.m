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
#import "PageInfo.h"

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
            
            NSMutableArray *tmp = [NSMutableArray array];
            
            for (CardGroup * cg in weiboPage.cardGroup){
                if (cg.mblog.text != nil){
                    [tmp addObject:[[Weibo alloc] initWithMBlog:cg.mblog]];
                }
            }
            

            [_mblogs removeAllObjects];
            [_mblogs addObjectsFromArray:tmp];
            

            [self.tableView reloadData];
            
            [self.tableView.mj_header endRefreshing];
        
        }];
    }];
    
    [self.tableView.mj_header beginRefreshing];
    
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{

        [_weiboHelper fetchTimeLine:_currentPage.nextCursor page:1 withCallback:^(WeiboPage *weiboPage) {
            
            _currentPage = weiboPage;
            
            for (CardGroup * cg in weiboPage.cardGroup){
                if (cg.mblog.text != nil){
                    [_mblogs addObject:[[Weibo alloc] initWithMBlog:cg.mblog]];
                }
            }
            
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

    Weibo * weibo = _mblogs[(NSUInteger) indexPath.row];

    RetweetedWeibo * retweet = weibo.retweetedWeibo;

    BOOL isRetweet = retweet.text != nil;

    TimeLineCell * cell = nil;
    NSString * Identifier = nil;

    if (isRetweet){
        PageInfo *retweetPageInfo = weibo.retweetedWeibo.pageInfo;
        if (retweetPageInfo.pageUrl == nil){
            int count = (int)weibo.retweetedWeibo.pics.count;
            Identifier = [NSString stringWithFormat:@"TimeLine%dImagesCellRetweet", count];
        } else {
            Identifier = @"TimeLinePageInfoRetweet";
        }
    } else {
        PageInfo *pageInfo = weibo.pageInfo;
        if (pageInfo.pageUrl == nil) {
            int count = (int)weibo.pics.count;
            Identifier = [NSString stringWithFormat:@"TimeLine%dImagesCell", count];
        } else{

            Identifier = @"TimeLinePageInfo";
        }
    }

    cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    cell.fd_enforceFrameLayout = NO;

    [cell showStatus:weibo];

    [cell setSeparatorInset:UIEdgeInsetsZero];
    [cell setLayoutMargins:UIEdgeInsetsZero];
    return cell;
}

-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    
    return YES;
}

@end
