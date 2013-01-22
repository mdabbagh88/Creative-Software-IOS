#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#if __IPHONE_OS_VERSION_MIN_REQUIRED

#import "MKAnnotationView+AFNetworking.h"

@interface AFImageCache : NSCache
- (UIImage *)cachedImageForRequest:(NSURLRequest *)request;

- (void)cacheImage:(UIImage *)image
        forRequest:(NSURLRequest *)request;
@end

#endif
