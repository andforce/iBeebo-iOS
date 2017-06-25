//
//  NSString+Extensions.m
//  DRL
//
//  Created by 迪远 王 on 16/5/21.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import "NSString+Extensions.h"

@implementation NSString (Extensions)


- (NSString *)replaceUnicode {

    NSString *tempStr1 = [self stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];

    NSString *returnStr = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:nil error:nil];

    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];

}

- (NSString *)md5HexDigest {
    const char *str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    unsigned long len = strlen(str);

    CC_MD5(str, (CC_LONG) len, result);

    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x", result[i]];
    }
    return ret;
}

- (NSString *)stringWithRegular:(NSString *)regular {

    NSRange timeRange = [self rangeOfString:regular options:NSRegularExpressionSearch];

    if (timeRange.location != NSNotFound) {
        return [self substringWithRange:timeRange];
    }
    return nil;
}

- (NSString *)stringWithRegular:(NSString *)regular andChild:(NSString *)childRegular {
    NSString *parentStyring = [self findStringWithRegular:self :regular];

    if (parentStyring != nil) {
        return [parentStyring findStringWithRegular:parentStyring :childRegular];
    }

    return nil;
}


- (NSString *)findStringWithRegular:(NSString *)src :(NSString *)regular {

    NSRange range = [src rangeOfString:regular options:NSRegularExpressionSearch];

    if (range.location != NSNotFound) {
        return [src substringWithRange:range];
    }
    return nil;
}

- (NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSArray *)arrayWithRegular:(NSString *)regular {

    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regular options:NSRegularExpressionCaseInsensitive error:nil];

    NSArray *result = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];

    NSMutableArray *stringArray = [NSMutableArray array];

    for (NSTextCheckingResult *tmpresult in result) {

        NSString *str = [self substringWithRange:tmpresult.range];
        [stringArray addObject:str];

    }
    return [stringArray copy];
}

@end
