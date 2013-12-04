//
// Created by Rene Dohan on 19/11/13.
// Copyright (c) 2013 creative_studio. All rights reserved.
//


#import "NSHTTPCookieStorage+Extension.h"


@implementation NSHTTPCookieStorage (Extension)

+ (void)deleteAllCookies {
    for (NSHTTPCookie *cookie in NSHTTPCookieStorage.sharedHTTPCookieStorage.cookies)
        [NSHTTPCookieStorage.sharedHTTPCookieStorage deleteCookie:cookie];
}

@end