//
// Created by Rene Dohan on 7/17/13.
// Copyright (c) 2013 creative_studio. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "MKNetworkEngine.h"

@interface MKNetworkEngine (Extension)
- (MKNetworkOperation *)forceReload:(NSURL *)url;
@end