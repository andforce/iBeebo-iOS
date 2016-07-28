#import "Emotion.h"
#import "NSString+Emoji.h"
#import "NSObject+MJCoding.h"

@implementation Emotion

- (NSString *)emoji
{
    if (_code) {
        return [NSString emojiWithStringCode:_code];
    }
    return nil;
}

+ (NSArray *)ignoredCodingPropertyNames
{
    return @[@"emoji"]; // 这个属性是为了方便转换 emoji 表情用的,不要归档,否则会崩溃.
}

MJExtensionCodingImplementation

@end