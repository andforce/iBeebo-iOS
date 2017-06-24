//
//  AtMeTableViewController.m
//  iBeeboPro
//
//  Created by 迪远 王 on 2017/6/21.
//  Copyright © 2017年 andforce. All rights reserved.
//

#import "AtMeTableViewController.h"

#import "TimeLineCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "MJRefresh.h"
#import "WeiboHelper.h"
#import "HotCards.h"
#import "HotWeiboPage.h"
#import "HotCardlistInfo.h"
#import "HotMblog.h"
#import "HotPageInfo.h"
#import "HotWeibo.h"
#import "AtMeAtMePage.h"
#import "AtMeCardGroup.h"
#import "AtMeTableViewCell.h"

@interface AtMeTableViewController ()<UITextViewDelegate>{

    NSMutableArray<AtMeCardGroup *> * _mblogs;
    WeiboHelper * _weiboHelper;

    AtMeAtMePage * _currentPage;
}

@end

@implementation AtMeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 180.0;



    _mblogs = [NSMutableArray array];

    _weiboHelper = [[WeiboHelper alloc] init];


    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{

        [_weiboHelper fetchAtMe:@"allWB" wiht:1 withCallback:^(AtMeAtMePage *weiboPage) {
            _currentPage = weiboPage;

            [_mblogs removeAllObjects];
            [_mblogs addObjectsFromArray:weiboPage.cardGroup];


            [self.tableView reloadData];

            [self.tableView.mj_header endRefreshing];
        }];
    }];

    [self.tableView.mj_header beginRefreshing];


    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{

        [_weiboHelper fetchAtMe:@"allWB" wiht:2 withCallback:^(AtMeAtMePage *weiboPage) {
            _currentPage = weiboPage;

            [_mblogs removeAllObjects];
            [_mblogs addObjectsFromArray:weiboPage.cardGroup];


            [self.tableView reloadData];

            [self.tableView.mj_header endRefreshing];
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

    AtMeCardGroup * hotWeibo = _mblogs[(NSUInteger) indexPath.row];

    AtMeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AtMeTableViewCell"];
    cell.fd_enforceFrameLayout = NO;

    [cell showAtMe:hotWeibo];

    [cell setSeparatorInset:UIEdgeInsetsZero];
    [cell setLayoutMargins:UIEdgeInsetsZero];
    return cell;
}

-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{

    return YES;
}

@end
