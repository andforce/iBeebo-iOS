//
//  TimeLineCell.m
//  iBeeboPro
//
//  Created by 迪远 王 on 16/7/26.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import "TimeLineCell.h"
#import <UIImageView+WebCache.h>

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
#import <IGHTMLQuery.h>

@interface TimeLineCell()<UITextViewDelegate>{
    
}

@end


@implementation TimeLineCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    sStatusTextFont = [UIFont systemFontOfSize:14];
    sSpecialAttributes = @{ NSForegroundColorAttributeName : [UIColor blueColor] };
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)showStatus:(Mblog *)status forRetweet:(BOOL)isRetweet{
    _timeLineTime.text = status.createdAt;
    
    NSAttributedString * attrStr = [self attributedTextWithText:status.text];
    _timeLineContent.attributedText = attrStr;
    _timeLineContent.delegate = self;
    
    _timeLineName.text = status.user.screenName;
    _timeLineSource.text = status.source;
    [_timeLineAvatar sd_setImageWithURL:[NSURL URLWithString:status.user.profileImageUrl]];
    if (isRetweet) {
        [self showImages:status.retweetedStatus.pics];
        NSString * retweet = [NSString stringWithFormat:@"@%@: %@",status.retweetedStatus.user.screenName, status.retweetedStatus.text];
        _timeLineReTweetContent.attributedText = [self attributedTextWithText:retweet];
    } else{
        [self showImages:status.pics];
    }


}

-(void)showImages:(NSArray<Pics *> *)pics{
    if (_timeLineImage0 != nil) {
        [_timeLineImage0 sd_setImageWithURL:[NSURL URLWithString:pics[0].url]];
    }
    if (_timeLineImage1 != nil) {
        [_timeLineImage1 sd_setImageWithURL:[NSURL URLWithString:pics[1].url]];
    }
    if (_timeLineImage2 != nil) {
        [_timeLineImage2 sd_setImageWithURL:[NSURL URLWithString:pics[2].url]];
    }
    if (_timeLineImage3 != nil) {
        [_timeLineImage3 sd_setImageWithURL:[NSURL URLWithString:pics[3].url]];
    }
    if (_timeLineImage4 != nil) {
        [_timeLineImage4 sd_setImageWithURL:[NSURL URLWithString:pics[4].url]];
    }
    if (_timeLineImage5 != nil) {
        [_timeLineImage5 sd_setImageWithURL:[NSURL URLWithString:pics[5].url]];
    }
    if (_timeLineImage6 != nil) {
        [_timeLineImage6 sd_setImageWithURL:[NSURL URLWithString:pics[6].url]];
    }
    if (_timeLineImage7 != nil) {
        [_timeLineImage7 sd_setImageWithURL:[NSURL URLWithString:pics[7].url]];
    }
    if (_timeLineImage8 != nil) {
        [_timeLineImage8 sd_setImageWithURL:[NSURL URLWithString:pics[8].url]];
    }
}

static NSString * const kRegexPattern = @"@[\\w-_]+|#[\\w]+#|\\[\\w+\\]|(https?)://(?:(\\S+?)(?::(\\S+?))?@)?([a-zA-Z0-9\\-.]+)(?::(\\d+))?((?:/[a-zA-Z0-9\\-._?,'+\\&%$=~*!():@\\\\]*)+)?";

static UIFont *sStatusTextFont = nil;
static NSDictionary *sSpecialAttributes = nil;

- (NSMutableArray<LXStatusTextPart *> *)statusTextPartsWithText:(NSString *)text {
    NSMutableArray<LXStatusTextPart *> *parts = [NSMutableArray new];

    //text = @"接品牌方通知，BOSE QC35降噪耳机，现已同步官方618活动价：2887元，原价为2888元，<a data-url=\"http://t.cn/RSTHRjN\" target=\"_blank\" href=\"http://weibo.cn/sinaurl/blocked4cb26666?luicode=20000174&featurecode=20000320&u=https%3A%2F%2Fwww.jjboom.com%2Fproducts%2Fp000159\" class=\"\"><span class=\"iconimg iconimg-xs\"><img src=\"https://h5.sinaimg.cn/upload/2015/09/25/3/timeline_card_small_web_default.png\"></span></i><span class=\"surl-text\">网页链接</a> 可以说是史上最无力的618促销了一刚，但有降价，还是要通知大家的嘛，请大家不要吐糟BOSE，这个锅我们背了";

    // 匹配 表情
    //<span class=\\"iconimg iconimg-xs\\">.* alt=\\"\[.*\]\\"></span>
    [text enumerateStringsMatchedByRegex:@"<span class=\"iconimg iconimg-xs\">.*?]\"></span>"
                              usingBlock:^(NSInteger captureCount,
                                      NSString *const __unsafe_unretained *capturedStrings,
                                      const NSRange *capturedRanges,
                                      volatile BOOL *const stop) {

                                  NSAssert((*capturedRanges).length > 0, @"尼玛长度能为0?");

                                  LXStatusTextPart *part = [LXStatusTextPart new];
                                  part.text  = *capturedStrings;
                                  part.range = *capturedRanges;
                                  part.linkType = LinkTypeEmoation;

                                  [parts addObject:part];
                              }];

    // 匹配@
    [text enumerateStringsMatchedByRegex:@"<a href='https://m.weibo.cn/n/.*?[^<]+</a>"
                              usingBlock:^(NSInteger captureCount,
                                           NSString *const __unsafe_unretained *capturedStrings,
                                           const NSRange *capturedRanges,
                                           volatile BOOL *const stop) {
                                  
                                  NSAssert((*capturedRanges).length > 0, @"尼玛长度能为0?");
                                  
                                  LXStatusTextPart *part = [LXStatusTextPart new];
                                  part.text  = *capturedStrings;
                                  part.range = *capturedRanges;
                                  part.linkType = LinkTypeAt;
                                  
                                  [parts addObject:part];
                              }];

    // 匹配#
    [text enumerateStringsMatchedByRegex:@"<a class='k' href='https://m.weibo.cn/k/.*?[^<]+</a>"
                              usingBlock:^(NSInteger captureCount,
                                           NSString *const __unsafe_unretained *capturedStrings,
                                           const NSRange *capturedRanges,
                                           volatile BOOL *const stop) {
                                  
                                  NSAssert((*capturedRanges).length > 0, @"尼玛长度能为0?");
                                  
                                  LXStatusTextPart *part = [LXStatusTextPart new];
                                  part.text  = *capturedStrings;
                                  part.range = *capturedRanges;
                                  part.linkType = LinkTypeHuaTi;
                                  
                                  [parts addObject:part];
                              }];

    // 匹配 网页链接 秒拍视频 等
    [text enumerateStringsMatchedByRegex:@"<a data-url=\"http://t.cn/.*?[^<]+</a>"
                              usingBlock:^(NSInteger captureCount,
                                      NSString *const __unsafe_unretained *capturedStrings,
                                      const NSRange *capturedRanges,
                                      volatile BOOL *const stop) {

                                  NSAssert((*capturedRanges).length > 0, @"尼玛长度能为0?");

                                  LXStatusTextPart *part = [LXStatusTextPart new];
                                  part.text  = *capturedStrings;
                                  part.range = *capturedRanges;
                                  part.linkType = LinkTypeLink;

                                  [parts addObject:part];
                              }];

    // 匹配 全文
    [text enumerateStringsMatchedByRegex:@"<a href=\"/status/\\d+\">全文</a>"
                              usingBlock:^(NSInteger captureCount,
                                      NSString *const __unsafe_unretained *capturedStrings,
                                      const NSRange *capturedRanges,
                                      volatile BOOL *const stop) {

                                  NSAssert((*capturedRanges).length > 0, @"尼玛长度能为0?");

                                  LXStatusTextPart *part = [LXStatusTextPart new];
                                  part.text  = *capturedStrings;
                                  part.range = *capturedRanges;
                                  part.linkType = LinkTypeQuanWen;

                                  [parts addObject:part];
                              }];

    [text enumerateStringsMatchedByRegex:@"<br\\/>"
                              usingBlock:^(NSInteger captureCount,
                                      NSString *const __unsafe_unretained *capturedStrings,
                                      const NSRange *capturedRanges,
                                      volatile BOOL *const stop) {

                                  NSAssert((*capturedRanges).length > 0, @"尼玛长度能为0?");

                                  LXStatusTextPart *part = [LXStatusTextPart new];
                                  part.text  = *capturedStrings;
                                  part.range = *capturedRanges;
                                  part.linkType = LinkReturn;

                                  [parts addObject:part];
                              }];


    // 按照 location 排序字段,即还原其原本的顺序.
    [parts sortUsingComparator:^NSComparisonResult(LXStatusTextPart * _Nonnull obj1, LXStatusTextPart * _Nonnull obj2) {
        return obj1.range.location < obj2.range.location ? NSOrderedAscending : NSOrderedDescending;
    }];
    if (parts.count == 0){
        // 说明没有找到什么特殊的
        LXStatusTextPart *part = [LXStatusTextPart new];
        part.text  = text;
        part.range = NSMakeRange(0, text.length);
        part.linkType = LinkTypeNone;
        [parts addObject:part];

    } else{

        NSMutableArray<LXStatusTextPart *> *tmpParts = [NSMutableArray new];

        NSUInteger location = 0;
        for (int i = 0; i < parts.count; ++i) {
            LXStatusTextPart * part = parts[(NSUInteger) i];
            if (location != part.range.location){
                LXStatusTextPart *needToAdd = [LXStatusTextPart new];
                needToAdd.linkType = LinkTypeNone;
                needToAdd.range = NSMakeRange(location, part.range.location - location);
                needToAdd.text  = [text substringWithRange:needToAdd.range];

                [tmpParts addObject:needToAdd];
            }

            location = part.range.location + part.range.length;
        }

        if (location < text.length){
            LXStatusTextPart *needToAdd = [LXStatusTextPart new];
            needToAdd.linkType = LinkTypeNone;
            needToAdd.range = NSMakeRange(location, text.length - location);
            needToAdd.text  = [text substringWithRange:needToAdd.range];

            [tmpParts addObject:needToAdd];
        }

        if (tmpParts.count > 0){
            [parts addObjectsFromArray:tmpParts];
            [parts sortUsingComparator:^NSComparisonResult(LXStatusTextPart * _Nonnull obj1, LXStatusTextPart * _Nonnull obj2) {
                return obj1.range.location < obj2.range.location ? NSOrderedAscending : NSOrderedDescending;
            }];
        }

    }
    return parts;
}

- (NSAttributedString *)attributedTextWithText:(NSString *)text {
    NSMutableArray *links = [NSMutableArray new];
    NSMutableAttributedString *attributedString = [NSMutableAttributedString new];
    
    NSArray *lxSt = [self statusTextPartsWithText:text];
    
    for (LXStatusTextPart *part in lxSt) {
        
        NSMutableAttributedString *subAttributedString = nil;
        if (part.linkType == LinkTypeEmoation) { // 表情.
            NSString * realEmotion = [part.text stringWithRegular:@"\\[.*\\]"];
            
            Emotion *emotion = [EmotionsManager emotionWithCHS:realEmotion];
            if (!emotion) {
                subAttributedString = [[NSMutableAttributedString alloc] initWithString:realEmotion];
            } else {
                NSTextAttachment *textAttachment = [NSTextAttachment new];
                textAttachment.image = [UIImage imageNamed:emotion.png];
                textAttachment.bounds = CGRectMake(0, sStatusTextFont.descender, sStatusTextFont.lineHeight, sStatusTextFont.lineHeight);
                subAttributedString = [NSMutableAttributedString attributedStringWithAttachment:textAttachment];
            }
        } else if (part.linkType == LinkTypeAt) { // @ #.
            LXStatusTextLink *link = [LXStatusTextLink new];
            
            NSString * spl = [part.text componentsSeparatedByString:@"@"][1];
            NSString * name = [spl componentsSeparatedByString:@"</a>"].firstObject;
            
            link.text  = [@"@" stringByAppendingString:name];
            link.range = NSMakeRange(attributedString.length, link.text.length);
            
            [links addObject:link];
            
            
            NSString * linkName = [link.text copy];
            //subAttributedString = [[NSMutableAttributedString alloc] initWithString:part.text attributes:sSpecialAttributes];
            if (![link.text hasPrefix:@"http"]) {
                link.text = [@"app://" stringByAppendingString:[link.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            }
            subAttributedString = [[NSMutableAttributedString alloc] initWithString:linkName];
            [subAttributedString addAttribute:NSLinkAttributeName value:[NSURL URLWithString:link.text] range:NSMakeRange(0, linkName.length)];
        } else if (part.linkType == LinkTypeHuaTi){
            
            
            IGHTMLDocument * doc = [[IGHTMLDocument alloc] initWithXMLString:part.text error:nil];
            IGXMLNode * node = [doc queryWithCSS:@".k"].firstObject;
            NSString * herf = [node attribute:@"href"];
            NSString * content = doc.text;
            
            
            LXStatusTextLink *link = [LXStatusTextLink new];
            
            link.text  = content;
            link.range = NSMakeRange(attributedString.length, link.text.length);
            
            [links addObject:link];
            
            
            NSString * linkName = [link.text copy];
            //subAttributedString = [[NSMutableAttributedString alloc] initWithString:part.text attributes:sSpecialAttributes];
            if (![link.text hasPrefix:@"http"]) {
                link.text = [@"app://" stringByAppendingString:[link.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            }
            subAttributedString = [[NSMutableAttributedString alloc] initWithString:linkName];
            [subAttributedString addAttribute:NSLinkAttributeName value:[NSURL URLWithString:link.text] range:NSMakeRange(0, linkName.length)];
            
        } else if (part.linkType == LinkTypeLink){

            IGHTMLDocument * doc = [[IGHTMLDocument alloc] initWithXMLString:part.text error:nil];

            NSString * content = doc.text;


            LXStatusTextLink *link = [LXStatusTextLink new];

            link.text  = content;
            link.range = NSMakeRange(attributedString.length, link.text.length);

            [links addObject:link];


            NSString * linkName = [link.text copy];
            if (![link.text hasPrefix:@"http"]) {
                link.text = [@"app://" stringByAppendingString:[link.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            }
            subAttributedString = [[NSMutableAttributedString alloc] initWithString:linkName];
            [subAttributedString addAttribute:NSLinkAttributeName value:[NSURL URLWithString:link.text] range:NSMakeRange(0, linkName.length)];

        } else if (part.linkType == LinkTypeQuanWen){
            LXStatusTextLink *link = [LXStatusTextLink new];

            link.text  = @"全文";
            link.range = NSMakeRange(attributedString.length, link.text.length);

            [links addObject:link];


            NSString * linkName = [link.text copy];
            if (![link.text hasPrefix:@"http"]) {
                link.text = [@"app://" stringByAppendingString:[link.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            }
            subAttributedString = [[NSMutableAttributedString alloc] initWithString:linkName];
            [subAttributedString addAttribute:NSLinkAttributeName value:[NSURL URLWithString:link.text] range:NSMakeRange(0, linkName.length)];
        } else if (part.linkType == LinkReturn){
            LXStatusTextLink *link = [LXStatusTextLink new];

            link.text  = @"\n";
            link.range = NSMakeRange(attributedString.length, link.text.length);

            [links addObject:link];


            NSString * linkName = [link.text copy];
            if (![link.text hasPrefix:@"http"]) {
                link.text = [@"app://" stringByAppendingString:[link.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            }
            subAttributedString = [[NSMutableAttributedString alloc] initWithString:linkName];
            //[subAttributedString addAttribute:NSLinkAttributeName value:[NSURL URLWithString:link.text] range:NSMakeRange(0, linkName.length)];
        }
        
        
        else { // 普通文本内容.
            subAttributedString = [[NSMutableAttributedString alloc] initWithString:part.text];
        }
        
        [attributedString appendAttributedString:subAttributedString];
    }
    
    [attributedString addAttribute:NSFontAttributeName value:sStatusTextFont range:(NSRange){ 0, attributedString.length }];
    
    [attributedString addAttribute:@"links" value:links range:(NSRange){0, 1}]; // 绑定链接数组.
    
    return attributedString;
}
@end
