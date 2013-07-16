//
// Created by Rene Dohan on 7/8/13.
// Copyright (c) 2013 creative_studio. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <objc/runtime.h>
#import "UIView+MKNetworkKitExtension.h"
#import "MKNetworkOperation.h"
#import "CSMKNetworkEngine.h"

static char imageFetchOperationKey;

@implementation UIView (MKNetworkKitExtension)

- (MKNetworkOperation *)imageFetchOperation {
    return (MKNetworkOperation *) objc_getAssociatedObject(self, &imageFetchOperationKey);
}

- (void)setImageFetchOperation:(MKNetworkOperation *)imageFetchOperation {
    objc_setAssociatedObject(self, &imageFetchOperationKey, imageFetchOperation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MKNetworkOperation *)setImageFromURL:(NSURL *)url placeHolderImage:(UIImage *)image  animation:(BOOL)animation :(void (^)(UIImage *))onImage {
    if (image)onImage(image);
    [self.imageFetchOperation cancel];
    if (CSMKNetworkEngine.engine) {
        self.imageFetchOperation = [CSMKNetworkEngine.engine
                    imageAtURL:url size:self.frame.size completionHandler:^(UIImage *fetchedImage, NSURL *url, BOOL isInCache) {
                    if (animation) {
                        [UIView transitionWithView:self.superview
                                duration:isInCache ? kFromCacheAnimationDuration : kFreshLoadAnimationDuration
                                options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionAllowUserInteraction
                                animations:^{
                                    onImage(fetchedImage);
                                } completion:nil];
                    } else onImage(fetchedImage);
                } errorHandler:^(MKNetworkOperation *completedOperation, NSError *_error) {
                    error(_error);
                }];
    } else info(@"No default engine found and imageCacheEngine parameter is null");
    return self.imageFetchOperation;
}

@end