//
// Created by 迪远 王 on 2017/6/18.
// Copyright (c) 2017 andforce. All rights reserved.
//

#import "BaseWeibo.h"

#import "AFHTTPSessionManager+SimpleAction.h"
#import "User.h"
#import "LXStatusTextLink.h"
#import "LXStatusTextPart.h"
#import "RegexKitLite.h"
#import "EmotionsManager.h"
#import "NSString+Extensions.h"
#import "RetweetedStatus.h"
#import <IGHTMLQuery.h>

@implementation BaseWeibo {

}

static UIFont *sStatusTextFont = nil;
static NSDictionary *sSpecialAttributes = nil;

- (instancetype)init {
    self = [super init];
    if (self){
        sStatusTextFont = [UIFont systemFontOfSize:16];
        sSpecialAttributes = @{ NSForegroundColorAttributeName : [UIColor blueColor] };
    }
    return self;
}
- (NSMutableArray<LXStatusTextPart *> *)statusTextPartsWithText:(NSString *)text {
    NSMutableArray<LXStatusTextPart *> *parts = [NSMutableArray new];

    // 匹配 表情
    [text enumerateStringsMatchedByRegex:@"<span class=\"iconimg iconimg-xs\"><img src=\"//h5.sinaimg.cn/m/emoticon/icon/\\S*/\\S*\.png\" style=\"width:1em;height:1em;\" alt=\"\\[\\S*\\]\"></span>"
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
