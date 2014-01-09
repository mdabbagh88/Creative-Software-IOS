//
// Created by Rene Dohan on 22/12/13.
// Copyright (c) 2013 creative_studio. All rights reserved.
//

#import "NSBundle+Extension.h"


@implementation NSBundle (Extension)

+ (NSString *)shortVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (NSString *)build {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey];;
}

@end