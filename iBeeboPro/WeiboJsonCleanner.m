//
//  WeiboJsonCleanner.m
//  iBeeboPro
//
//  Created by 迪远 王 on 16/7/30.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import "WeiboJsonCleanner.h"
#import "NSString+Extensions.h"

#import <IGHTMLQuery.h>

@implementation WeiboJsonCleanner

-(NSString *)cleanHtmlTag:(NSString *)src{
    if (src == nil || [src isEqualToString:@""]) {
        return src;
    }
    NSString * cleanStr = [src stringByReplacingOccurrencesOfString:@"\\/" withString:@"/"];
    
    //把 <a href='/n/andforce'>@andforce</a> 转成 @andforce，就是去除多余的html标签
    NSArray * atUserTags = [cleanStr arrayWithRegulat:@"<a href=\'/n/[\\u4e00-\\u9fa5_a-zA-Z0-9-]+\'>@[\\u4e00-\\u9fa5_a-zA-Z0-9-]+</a>"];
    for (NSString * userTag in atUserTags) {
        NSString * atUser = [userTag stringWithRegular:@"@[\\u4e00-\\u9fa5_a-zA-Z0-9-]+"];
        cleanStr = [cleanStr stringByReplacingOccurrencesOfString:userTag withString:atUser];
    }
    
    //把 <a class='k' href='/k/话题?from=feed'>#话题#</a> 转成 #话题#，就是去除多余的html标签
    NSArray * feedTags = [cleanStr arrayWithRegulat:@"<a class=\'k\' href=\'/k/.*?\\?from=feed\'>#.*?#</a>"];
    for (NSString * feedTag in feedTags) {
        NSString * feed = [feedTag stringWithRegular:@"#.*?#"];
        cleanStr = [cleanStr stringByReplacingOccurrencesOfString:feedTag withString:feed];
    }
    
    // 转换秒拍视频    <a data-url=\\\".*?\\\" href=\\\".*?\\\" ><i class=\\\".*?\\\"><img src=\\\".*?\\\"></i><span class=\\\".*?\\\">秒拍视频</span></a>
    NSArray * miaopaiTags = [cleanStr arrayWithRegulat:@"<a data-url=\\\\\".*?\\\\\" href=\\\\\".*?\\\\\" ><i class=\\\\\".*?\\\\\"><img src=\\\\\".*?\\\\\"></i><span class=\\\\\".*?\\\\\">.*?</span></a>"];
    for (NSString * miaopaiTag in miaopaiTags) {
        if ([miaopaiTag containsString:@"timeline_card_small_video_default"]) {
            NSString * miaopai = @"[秒拍]http://秒拍视频";
            cleanStr = [cleanStr stringByReplacingOccurrencesOfString:miaopaiTag withString:miaopai];
        } else if([miaopaiTag containsString:@"timeline_card_small_web_default"]){
            NSString * miaopai = @"[网页]http://网页链接";
            cleanStr = [cleanStr stringByReplacingOccurrencesOfString:miaopaiTag withString:miaopai];
        } else if ([miaopaiTag containsString:@"timeline_card_small_location_default"]){
            IGHTMLDocument * document = [[IGHTMLDocument alloc] initWithHTMLString:miaopaiTag error:nil];
            NSString * location = [document text];
            
            NSString * miaopai = [NSString stringWithFormat:@"[位置]http://%@", location];
            cleanStr = [cleanStr stringByReplacingOccurrencesOfString:miaopaiTag withString:miaopai];
        } else if ([miaopaiTag containsString:@"timeline_card_small_photo_default"]){
            IGHTMLDocument * document = [[IGHTMLDocument alloc] initWithHTMLString:miaopaiTag error:nil];
            NSString * location = [document text];
            
            NSString * miaopai = [NSString stringWithFormat:@"[图片]http://%@", location];
            cleanStr = [cleanStr stringByReplacingOccurrencesOfString:miaopaiTag withString:miaopai];
        } else if ([miaopaiTag containsString:@"timeline_card_small_music_default"]){
            IGHTMLDocument * document = [[IGHTMLDocument alloc] initWithHTMLString:miaopaiTag error:nil];
            NSString * location = [document text];
            
            NSString * miaopai = [NSString stringWithFormat:@"[音乐]http://%@", location];
            cleanStr = [cleanStr stringByReplacingOccurrencesOfString:miaopaiTag withString:miaopai];
        }

    }
    
    // 转换表情 <i class=\\\\\".*?\\\\\">[.*?]</i>
    NSArray * emotionTags = [cleanStr arrayWithRegulat:@"<i class=\\\\\"face.*?\\\\\">\\[.*?\\]</i>?"];
    for (NSString * emotionTag in emotionTags) {
        NSString * emotion = [emotionTag stringWithRegular:@"\\[.*?\\]"];
        cleanStr = [cleanStr stringByReplacingOccurrencesOfString:emotionTag withString:emotion];
    }
    return cleanStr;
}
@end
