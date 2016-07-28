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

@interface MainTimeLineTableViewController (){
    AFHTTPSessionManager *_browser;
    
    NSMutableArray * _mblogs;
}

@end

@implementation MainTimeLineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    sStatusTextFont = [UIFont systemFontOfSize:14];
    sSpecialAttributes = @{ NSForegroundColorAttributeName : [UIColor blueColor] };
    
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
    
    cell.timeLineTime.text = cardGroup.mblog.createdAt;
    
    NSAttributedString * attrStr = [self attributedTextWithText:cardGroup.mblog.text];
    //cardGroup.mblog.text
    
    cell.timeLineContent.attributedText = attrStr;
    cell.timeLineName.text = cardGroup.mblog.user.screenName;
    cell.timeLineSource.text = cardGroup.mblog.source;
    [cell.timeLineAvatar sd_setImageWithURL:[NSURL URLWithString:cardGroup.mblog.user.profileImageUrl]];
    
    return cell;
}

static NSString * const kRegexPattern = @"@[\\w-_]+|#[\\w]+#|\\[\\w+\\]|(https?)://(?:(\\S+?)(?::(\\S+?))?@)?([a-zA-Z0-9\\-.]+)(?::(\\d+))?((?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?";

static UIFont *sStatusTextFont = nil;
static NSDictionary *sSpecialAttributes = nil;

- (NSMutableArray<LXStatusTextPart *> *)statusTextPartsWithText:(NSString *)text
{
    NSMutableArray<LXStatusTextPart *> *parts = [NSMutableArray new];
    
    // 匹配特殊字段.
    [text enumerateStringsMatchedByRegex:kRegexPattern
                              usingBlock:^(NSInteger captureCount,
                                           NSString *const __unsafe_unretained *capturedStrings,
                                           const NSRange *capturedRanges,
                                           volatile BOOL *const stop) {
                                  NSAssert((*capturedRanges).length > 0, @"尼玛长度能为0?");
                                  LXStatusTextPart *part = [LXStatusTextPart new];
                                  {
                                      part.text  = *capturedStrings;
                                      part.range = *capturedRanges;
                                      part.isEmotion = [*capturedStrings hasPrefix:@"["];
                                      part.isSpecial = YES;
                                  }
                                  [parts addObject:part];
                              }];
    
    // 用特殊字段分割微博文本,即匹配普通文本字段.
    [text enumerateStringsSeparatedByRegex:kRegexPattern
                                usingBlock:^(NSInteger captureCount,
                                             NSString *const __unsafe_unretained *capturedStrings,
                                             const NSRange *capturedRanges,
                                             volatile BOOL *const stop) {
                                    if ((*capturedRanges).length == 0) {
                                        return ;
                                    }
                                    LXStatusTextPart *part = [LXStatusTextPart new];
                                    {
                                        part.text  = *capturedStrings;
                                        part.range = *capturedRanges;
                                    }
                                    [parts addObject:part];
                                }];
    
    // 按照 location 排序字段,即还原其原本的顺序.
    [parts sortUsingComparator:^NSComparisonResult(LXStatusTextPart * _Nonnull obj1,
                                                   LXStatusTextPart * _Nonnull obj2) {
        return obj1.range.location < obj2.range.location ? NSOrderedAscending : NSOrderedDescending;
    }];
    
    return parts;
}

- (NSAttributedString *)attributedTextWithText:(NSString *)text
{
    NSMutableArray *links = [NSMutableArray new];
    NSMutableAttributedString *attributedString = [NSMutableAttributedString new];
    {
        for (LXStatusTextPart *part in [self statusTextPartsWithText:text]) {
            
            NSAttributedString *subAttributedString = nil;
            {
                if (part.isEmotion) { // 表情.
                    Emotion *emotion = [EmotionsManager emotionWithCHS:part.text];
                    if (!emotion) {
                        subAttributedString = [[NSAttributedString alloc] initWithString:part.text];
                    } else {
                        NSTextAttachment *textAttachment = [NSTextAttachment new];
                        {
                            textAttachment.image = [UIImage imageNamed:emotion.png];
                            textAttachment.bounds = CGRectMake(0,
                                                               sStatusTextFont.descender,
                                                               sStatusTextFont.lineHeight,
                                                               sStatusTextFont.lineHeight);
                        }
                        subAttributedString = [NSAttributedString attributedStringWithAttachment:textAttachment];
                    }
                } else if (part.isSpecial) { // @ #.
                    LXStatusTextLink *link = [LXStatusTextLink new];
                    {
                        link.text  = part.text;
                        link.range = NSMakeRange(attributedString.length, part.text.length);
                    }
                    [links addObject:link];
                    
                    subAttributedString = [[NSAttributedString alloc] initWithString:part.text
                                                                          attributes:sSpecialAttributes];
                } else { // 普通文本内容.
                    subAttributedString = [[NSAttributedString alloc] initWithString:part.text];
                }
            }
            
            [attributedString appendAttributedString:subAttributedString];
        }
    }
    
    [attributedString addAttribute:NSFontAttributeName
                             value:sStatusTextFont
                             range:(NSRange){ 0, attributedString.length }];
    
    [attributedString addAttribute:@"links" value:links range:(NSRange){0, 1}]; // 绑定链接数组.
    
    return attributedString;
}

@end
