//
// Created by inno on 1/22/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MKAnnotationViewAFImageCache.h"

static inline NSString *AFImageCacheKeyFromURLRequest(NSURLRequest *request) {
    return [[request URL] absoluteString];
}


@implementation MKAnnotationViewAFImageCache

- (UIImage *)cachedImageForRequest:(NSURLRequest *)request {
    switch ([request cachePolicy]) {
        case NSURLRequestReloadIgnoringCacheData:
        case NSURLRequestReloadIgnoringLocalAndRemoteCacheData:
            return nil;
        default:
            break;
    }

    return [self objectForKey:AFImageCacheKeyFromURLRequest(request)];
}

- (void)cacheImage:(UIImage *)image
        forRequest:(NSURLRequest *)request {
    if (image && request) {
        [self setObject:image forKey:AFImageCacheKeyFromURLRequest(request)];
    }
}

@end