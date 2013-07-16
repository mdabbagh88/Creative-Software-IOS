//
// Created by inno on 1/28/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "UIView+MKNetworkKitExtension.h"

@implementation UIImageView (MKNetworkKitExtension)


- (void)setImageWithURL:(NSURL *)url {
    [self setImageWithURL:url :YES];
}

- (void)setImageWithURL:(NSURL *)url :(BOOL)animations {
//    if (animations) [self showProgress];
    UIImageView *_self = self;
    [self setImageFromURL:url placeHolderImage:nil animation:animations :^(UIImage *image) {
        [_self setImage:image];
//        if (animations) [_self hideProgress];
    }];
}

@end