//
// Created by 迪远 王 on 2016/11/6.
// Copyright (c) 2016 andforce. All rights reserved.
//

#import "TransBundle.h"


@implementation TransBundle {
    NSMutableDictionary *dictonary;
}

- (instancetype)init {
    if (self = [super init]) {
        dictonary = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)putIntValue:(int)value forKey:(NSString *)key {
    [dictonary setValue:@(value) forKey:key];
}

- (void)putStringValue:(NSString *)value forKey:(NSString *)key {
    [dictonary setValue:value forKey:key];
}

- (int)getIntValue:(NSString *)key {
    NSNumber *value = [dictonary valueForKey:key];
    if (value == nil) {
        return -1;
    }
    return value.intValue;
}

- (NSString *)getStringValue:(NSString *)key {
    return [dictonary valueForKey:key];
}

- (void)putObjectValue:(id)value forKey:(NSString *)key {
    dictonary[key] = value;
}

- (id)getObjectValue:(NSString *)key {
    return dictonary[key];
}

- (BOOL)containsKey:(NSString *)key {
    return [dictonary.allKeys containsObject:key];
}

@end