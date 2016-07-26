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

@interface MainTimeLineTableViewController (){
    AFHTTPSessionManager *_browser;
    
    NSMutableArray * _mblogs;
}

@end

@implementation MainTimeLineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mblogs = [NSMutableArray array];
    
    _browser = [AFHTTPSessionManager manager];
    _browser.responseSerializer = [AFHTTPResponseSerializer serializer];
    _browser.responseSerializer.acceptableContentTypes = [_browser.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    
    
    [_browser GETWithURLString:@"http://m.weibo.cn/index/feed?format=cards" requestCallback:^(BOOL isSuccess, NSString *html) {
        NSString * debugStr = html;
        
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

    static NSString * Identifier = @"TimeLineCell";
    TimeLineCell * cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    
    CardGroup * cardGroup = [_mblogs objectAtIndex:indexPath.row];
    
    cell.timeLineContent.text = cardGroup.mblog.text;
    
    return cell;
}

@end
