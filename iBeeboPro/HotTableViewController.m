//
//  HotTableViewController.m
//  iBeeboPro
//
//  Created by 迪远 王 on 2017/6/19.
//  Copyright © 2017年 andforce. All rights reserved.
//

#import "HotTableViewController.h"

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
#import "UIWeiboTableViewCell.h"

@interface HotTableViewController ()<UITextViewDelegate>{

    NSMutableArray<HotWeibo *> * _mblogs;
    WeiboHelper * _weiboHelper;

    HotWeiboPage * _currentPage;
}

@end

@implementation HotTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 180.0;



    _mblogs = [NSMutableArray array];

    _weiboHelper = [[WeiboHelper alloc] init];


    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{

        [_weiboHelper fetchHot:0 withCallback:^(HotWeiboPage *weiboPage) {
            _currentPage = weiboPage;
            NSMutableArray *tmp = [NSMutableArray array];

            for (HotCards * cg in weiboPage.cards){
                if (cg.mblog.text != nil){
                    [tmp addObject:[[HotWeibo alloc] initWithMBlog:cg.mblog]];
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

        [_weiboHelper fetchHot:_currentPage.cardlistInfo.sinceId withCallback:^(HotWeiboPage *weiboPage) {
            _currentPage = weiboPage;

            for (HotCards * cg in weiboPage.cards){
                if (cg.mblog.text != nil){
                    [_mblogs addObject:[[HotWeibo alloc] initWithMBlog:cg.mblog]];
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
    return _mblogs.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0){
        return 2.5;
    }
    return 5;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    HotWeibo * hotWeibo = _mblogs[(NSUInteger) indexPath.section];


    NSString * Identifier = nil;

    HotPageInfo *pageInfo = hotWeibo.pageInfo;
    if (pageInfo.pageUrl == nil) {
        int count = (int)hotWeibo.pics.count;
        Identifier = [NSString stringWithFormat:@"%d", count];

        UIWeiboTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
        if (!cell){
            //加载一个Cell时候用的
//            [tableView registerNib:[UINib nibWithNibName:@"" bundle:nil] forCellReuseIdentifier:Identifier];
//            cell = [tableView dequeueReusableCellWithIdentifier:Identifier];

            NSArray * views = [[NSBundle mainBundle] loadNibNamed:@"UIWeiboTableViewCell" owner:self options:nil];
            cell = views[count];
        }

        cell.fd_enforceFrameLayout = NO;

        [cell showContent:hotWeibo.text];
        return cell;
    } else{
        TimeLineCell * cell = nil;
        Identifier = @"TimeLinePageInfo";
        cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
        cell.fd_enforceFrameLayout = NO;

        [cell showHotWeibo:hotWeibo];

        return cell;
    }


}

-(BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{

    return YES;
}

@end
