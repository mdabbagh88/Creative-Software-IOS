//
// Created by inno on 1/28/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "UIButton+MKNetworkKitExtension.h"
#import "UIView+MKNetworkKitExtension.h"

@implementation UIButton (MKNetworkKitExtension)


- (void)setImageWithURL:(NSURL *)url {
    [self showProgress];
    UIButton *_self = self;
    [self setImageFromURL:url placeHolderImage:nil animation:YES :^(UIImage *image) {
        [_self setImage:image forState:UIControlStateNormal];
        [_self hideProgress];
    }];
}

- (void)setBackgroundImageWithURL:(NSURL *)url {
    [self showProgress];
    UIButton *_self = self;
    [self setImageFromURL:url placeHolderImage:nil animation:YES :^(UIImage *image) {
        [_self setBackgroundImage:image forState:UIControlStateNormal];
        [_self hideProgress];
    }];
}


@end