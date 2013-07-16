//
// Created by Rene Dohan on 7/8/13.
// Copyright (c) 2013 creative_studio. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CSMKNetworkEngine.h"


@implementation CSMKNetworkEngine {

}

static CSMKNetworkEngine *_engine;


+ (id)initDefaultEngine:(NSString * const)host apiPath:(NSString * const)path {
    _engine = [CSMKNetworkEngine.alloc initWithHostName:host apiPath:path customHeaderFields:nil];
    return _engine;
}

+ (CSMKNetworkEngine *)engine {
    return _engine;
}

@end