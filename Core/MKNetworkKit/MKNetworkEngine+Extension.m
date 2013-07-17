//
// Created by Rene Dohan on 7/17/13.
// Copyright (c) 2013 creative_studio. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MKNetworkEngine+Extension.h"


@implementation MKNetworkEngine (Extension)

- (MKNetworkOperation *)forceReload:(NSURL *)url {
    if (url == nil) {
        return nil;
    }
    MKNetworkOperation *op = [self operationWithURLString:[url absoluteString]];
    op.shouldCacheResponseEvenIfProtocolIsHTTPS = YES;
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
    }           errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        error(error);
    }];
    [self enqueueOperation:op forceReload:YES];
    return op;
}

@end