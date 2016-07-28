#import "Emotion.h"
#import "MJExtension.h"
#import "EmotionsManager.h"
#import "NSNotificationCenter+LXAdditions.h"

@implementation EmotionsManager

static NSArray<Emotion *> *sDefaultEmotionList      = nil;
static NSArray<Emotion *> *sEmojiEmotionList        = nil;
static NSArray<Emotion *> *sLXHEmotionList          = nil;
static NSMutableArray<Emotion *> *sRecentEmotions = nil;

static inline NSString * LXRecentEmotionsArchivePath()
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"RecentEmotions.archive"];
}

+ (void)initialize
{
    sDefaultEmotionList = [Emotion mj_objectArrayWithFilename:@"default.plist"];
    sEmojiEmotionList   = [Emotion mj_objectArrayWithFilename:@"emoji.plist"];
    sLXHEmotionList     = [Emotion mj_objectArrayWithFilename:@"lxh.plist"];
    sRecentEmotions   = [NSKeyedUnarchiver unarchiveObjectWithFile:LXRecentEmotionsArchivePath()];
    if (!sRecentEmotions) {
        sRecentEmotions = [NSMutableArray new];
    }

    // 程序进入后台时将最近表情数据写入沙盒.
    [NSNotificationCenter lx_addObserverForName:UIApplicationDidEnterBackgroundNotification
                                         object:nil
                                     usingBlock:
     ^(NSNotification * _Nonnull note) {
         [NSKeyedArchiver archiveRootObject:sRecentEmotions
                                     toFile:LXRecentEmotionsArchivePath()];
     }];
}

#pragma mark - *** 公共方法 ***

#pragma mark - 保存最近表情

+ (void)addEmotionToRecentList:(Emotion *)anEmotion
{
    // 如果该表情之前添加过,移除.
    for (Emotion *emotion in sRecentEmotions) {
        if ([emotion.chs isEqualToString:anEmotion.chs] || [emotion.code isEqualToString:anEmotion.code]) {
            [sRecentEmotions removeObject:emotion];
            break;
        }
    }

    // 将添加的表情插入到首位.
    [sRecentEmotions insertObject:anEmotion atIndex:0];
}

#pragma mark - 供应表情模型列表

+ (NSArray<Emotion *> *)recentEmotions
{
    return sRecentEmotions;
}

+ (NSArray<Emotion *> *)defaultEmotionList
{
    return sDefaultEmotionList;
}

+ (NSArray<Emotion *> *)emojiEmotionList
{
    return sEmojiEmotionList;
}

+ (NSArray<Emotion *> *)lxhEmotionList
{
    return sLXHEmotionList;
}

#pragma mark - 映射表情

+ (Emotion *)emotionWithCHS:(NSString *)chs
{
    NSAssert(chs.length, @"参数 chs 为 nil 或空字符串.");

    for (Emotion *emotion in sDefaultEmotionList) {
        if ([emotion.chs isEqualToString:chs]) {
            return emotion;
        }
    }

    for (Emotion *emotion in sLXHEmotionList) {
        if ([emotion.chs isEqualToString:chs]) {
            return emotion;
        }
    }

    return nil;
}

@end