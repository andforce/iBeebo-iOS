
@import Foundation;
#import "Emotion.h"

NS_ASSUME_NONNULL_BEGIN

@interface EmotionsManager : NSObject

+ (void)addEmotionToRecentList:(Emotion *)emotion;

+ (NSArray<Emotion *> *)recentEmotions;
+ (NSArray<Emotion *> *)defaultEmotionList;
+ (NSArray<Emotion *> *)emojiEmotionList;
+ (NSArray<Emotion *> *)lxhEmotionList;

+ (Emotion *)emotionWithCHS:(NSString *)chs;

@end

NS_ASSUME_NONNULL_END