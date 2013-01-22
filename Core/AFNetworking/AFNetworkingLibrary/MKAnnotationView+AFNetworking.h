#import <Foundation/Foundation.h>
#import "AFImageRequestOperation.h"

#import <Availability.h>
#import <MapKit/MapKit.h>

#if __IPHONE_OS_VERSION_MIN_REQUIRED

#import <UIKit/UIKit.h>

@interface MKAnnotationView (AFNetworking)
- (void)setImageWithURL:(NSURL *)url;

- (void)setImageWithURL:(NSURL *)url
       placeholderImage:(UIImage *)placeholderImage;

- (void)setImageWithURLRequest:(NSURLRequest *)urlRequest
              placeholderImage:(UIImage *)placeholderImage
                       success:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image))success
                       failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error))failure;

- (void)cancelImageRequestOperation;
@end

#endif
