//
// Created by Rene Dohan on 7/8/13.
// Copyright (c) 2013 creative_studio. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "MKNetworkEngine.h"


@interface CSMKNetworkEngine : MKNetworkEngine
+ (id)initDefaultEngine:(NSString * const)host apiPath:(NSString * const)path;

+ (CSMKNetworkEngine *)engine;
@end