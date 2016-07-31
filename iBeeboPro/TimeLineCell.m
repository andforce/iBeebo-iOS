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
    
    // 匹配特殊字段.
    [text enumerateStringsMatchedByRegex:kRegexPattern
                              usingBlock:^(NSInteger captureCount,
                                           NSString *const __unsafe_unretained *capturedStrings,
                                           const NSRange *capturedRanges,
                                           volatile BOOL *const stop) {
                                  NSAssert((*capturedRanges).length > 0, @"尼玛长度能为0?");
                                  LXStatusTextPart *part = [LXStatusTextPart new];
                                  part.text  = *capturedStrings;
                                  part.range = *capturedRanges;
                                  part.isEmotion = [*capturedStrings hasPrefix:@"["];
                                  part.isSpecial = YES;
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
                                    part.text  = *capturedStrings;
                                    part.range = *capturedRanges;
                                    
                                    [parts addObject:part];
                                }];
    
    // 按照 location 排序字段,即还原其原本的顺序.
    [parts sortUsingComparator:^NSComparisonResult(LXStatusTextPart * _Nonnull obj1, LXStatusTextPart * _Nonnull obj2) {
        return obj1.range.location < obj2.range.location ? NSOrderedAscending : NSOrderedDescending;
    }];
    
    return parts;
}

- (NSAttributedString *)attributedTextWithText:(NSString *)text {
    NSMutableArray *links = [NSMutableArray new];
    NSMutableAttributedString *attributedString = [NSMutableAttributedString new];
    
    for (LXStatusTextPart *part in [self statusTextPartsWithText:text]) {
        
        NSMutableAttributedString *subAttributedString = nil;
        if (part.isEmotion) { // 表情.
            Emotion *emotion = [EmotionsManager emotionWithCHS:part.text];
            if (!emotion) {
                subAttributedString = [[NSMutableAttributedString alloc] initWithString:part.text];
            } else {
                NSTextAttachment *textAttachment = [NSTextAttachment new];
                textAttachment.image = [UIImage imageNamed:emotion.png];
                textAttachment.bounds = CGRectMake(0, sStatusTextFont.descender, sStatusTextFont.lineHeight, sStatusTextFont.lineHeight);
                subAttributedString = [NSMutableAttributedString attributedStringWithAttachment:textAttachment];
            }
        } else if (part.isSpecial) { // @ #.
            LXStatusTextLink *link = [LXStatusTextLink new];
            
            link.text  = part.text;
            link.range = NSMakeRange(attributedString.length, part.text.length);
            
            [links addObject:link];
            
            
            NSString * linkName = [link.text copy];
            //subAttributedString = [[NSMutableAttributedString alloc] initWithString:part.text attributes:sSpecialAttributes];
            if (![link.text hasPrefix:@"http"]) {
                link.text = [@"app://" stringByAppendingString:[link.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            }
            subAttributedString = [[NSMutableAttributedString alloc] initWithString:linkName];
            [subAttributedString addAttribute:NSLinkAttributeName value:[NSURL URLWithString:link.text] range:NSMakeRange(0, linkName.length)];
        } else { // 普通文本内容.
            subAttributedString = [[NSMutableAttributedString alloc] initWithString:part.text];
        }
        
        [attributedString appendAttributedString:subAttributedString];
    }
    
    [attributedString addAttribute:NSFontAttributeName value:sStatusTextFont range:(NSRange){ 0, attributedString.length }];
    
    [attributedString addAttribute:@"links" value:links range:(NSRange){0, 1}]; // 绑定链接数组.
    
    return attributedString;
}
@end
