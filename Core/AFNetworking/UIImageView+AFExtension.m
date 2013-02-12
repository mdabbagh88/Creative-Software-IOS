//
// Created by inno on 2/4/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "UIImageView+AFExtension.h"
#import "UIImageView+AFNetworking.h"


@implementation UIImageView (AFExtension)

- (void)setImageWithURL:(NSURL *)url {
    [self setImageWithURL:url placeholderImage:nil];
}

- (void)setImageWithURL:(NSURL *)url
       placeholderImage:(UIImage *)placeholderImage
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPShouldHandleCookies:YES];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];

    [self setImageWithURLRequest:request placeholderImage:placeholderImage success:nil failure:nil];
}

@end