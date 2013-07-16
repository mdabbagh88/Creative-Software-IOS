//
// Created by Rene Dohan on 7/8/13.
// Copyright (c) 2013 creative_studio. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class MKNetworkOperation;

@interface UIView (MKNetworkKitExtension)
- (MKNetworkOperation *)setImageFromURL:(NSURL *)url placeHolderImage:(UIImage *)image animation:(BOOL)animation :(void (^)(UIImage *))onImage;
@end