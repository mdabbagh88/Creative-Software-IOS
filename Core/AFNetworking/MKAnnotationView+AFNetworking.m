#import <objc/runtime.h>
#import "MKAnnotationView+AFNetworking.h"
#import "MKAnnotationViewAFImageCache.h"
#import "UIImage+Extension.h"

#pragma mark -

static char kAFImageRequestOperationObjectKey;

@interface MKAnnotationView (_AFNetworking)
@property(readwrite, nonatomic, strong, setter = af_setImageRequestOperation:) AFImageRequestOperation *af_imageRequestOperation;
@end

@implementation MKAnnotationView (_AFNetworking)
@dynamic af_imageRequestOperation;
@end

#pragma mark -

@implementation MKAnnotationView (AFNetworking)

- (AFHTTPRequestOperation *)af_imageRequestOperation {
    return (AFHTTPRequestOperation *) objc_getAssociatedObject(self, &kAFImageRequestOperationObjectKey);
}

- (void)af_setImageRequestOperation:(AFImageRequestOperation *)imageRequestOperation {
    objc_setAssociatedObject(self, &kAFImageRequestOperationObjectKey, imageRequestOperation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (NSOperationQueue *)af_sharedImageRequestOperationQueue {
    static NSOperationQueue *_af_imageRequestOperationQueue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _af_imageRequestOperationQueue = [[NSOperationQueue alloc] init];
        [_af_imageRequestOperationQueue setMaxConcurrentOperationCount:NSOperationQueueDefaultMaxConcurrentOperationCount];
    });

    return _af_imageRequestOperationQueue;
}

+ (MKAnnotationViewAFImageCache *)af_sharedImageCache {
    static MKAnnotationViewAFImageCache *_af_imageCache = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _af_imageCache = [[MKAnnotationViewAFImageCache alloc] init];
    });

    return _af_imageCache;
}

#pragma mark -


- (void)setImageWithURL:(NSURL *)url {
    [self setImageWithURL:url placeholderImage:self.image];
}

- (void)setImageWithURL:(NSURL *)url
       placeholderImage:(UIImage *)placeholderImage {
    [self setImageWithURL:url placeholderImage:placeholderImage height:0];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage height:(float)height {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPShouldHandleCookies:YES];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];

    [self setImageWithURLRequest:request placeholderImage:placeholderImage height:height success:nil failure:nil];
}

- (void)setImageWithURLRequest:(NSURLRequest *)urlRequest
              placeholderImage:(UIImage *)placeholderImage
                       success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image))success
                       failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error))failure {
    [self setImageWithURLRequest:urlRequest placeholderImage:placeholderImage height:0 success:success failure:failure];
}

- (void)setImageWithURLRequest:(NSURLRequest *)urlRequest
              placeholderImage:(UIImage *)placeholderImage
                        height:(float)height
                       success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image))success
                       failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error))failure {
    [self cancelImageRequestOperation];

    UIImage *cachedImage = [[[self class] af_sharedImageCache] cachedImageForRequest:urlRequest];
    if (cachedImage) {
        [self updateImage:height :cachedImage];
        self.af_imageRequestOperation = nil;

        if (success) {
            success(nil, nil, cachedImage);
        }
    } else {
        [self updateImage:height :placeholderImage];

        AFImageRequestOperation *requestOperation = [[AFImageRequestOperation alloc] initWithRequest:urlRequest];
        [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            if ([[urlRequest URL] isEqual:[[self.af_imageRequestOperation request] URL]]) {
                if (success) {
                    success(operation.request, operation.response, responseObject);
                } else {
                    [self updateImage:height :responseObject];
                }

                self.af_imageRequestOperation = nil;
            }

            [[[self class] af_sharedImageCache] cacheImage:responseObject forRequest:urlRequest];
        }                                       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if ([[urlRequest URL] isEqual:[[self.af_imageRequestOperation request] URL]]) {
                if (failure) {
                    failure(operation.request, operation.response, error);
                }

                self.af_imageRequestOperation = nil;
            }
        }];

        self.af_imageRequestOperation = requestOperation;

        [[[self class] af_sharedImageRequestOperationQueue] addOperation:self.af_imageRequestOperation];
    }
}

- (void)updateImage:(float)height :(UIImage *)image {
    if (height > 0)self.image = [image scaleToHeight:height];
    else self.image = image;
}

- (void)cancelImageRequestOperation {
    [self.af_imageRequestOperation cancel];
    self.af_imageRequestOperation = nil;
}

@end