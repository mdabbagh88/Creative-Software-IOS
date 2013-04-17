//
// Created by inno on 1/28/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "UIButton+Extension.h"
#import "AFImageRequestOperation.h"


@implementation UIButton (Extension)

- (void)stretchableBackgroundImageWithLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight {
    [self setBackgroundImage:[[self backgroundImageForState:UIControlStateNormal] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight] forState:UIControlStateNormal];
    [self setBackgroundImage:[[self backgroundImageForState:UIControlStateSelected] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight] forState:UIControlStateSelected];
    [self setBackgroundImage:[[self backgroundImageForState:UIControlStateDisabled] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight] forState:UIControlStateDisabled];
    [self setBackgroundImage:[[self backgroundImageForState:UIControlStateHighlighted] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight] forState:UIControlStateHighlighted];
}

- (void)setTitleColor:(UIColor *)color {
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:color forState:UIControlStateHighlighted];
    [self setTitleColor:color forState:UIControlStateDisabled];
    [self setTitleColor:color forState:UIControlStateSelected];
}

- (void)setText:(NSString *)text {
    [self setTitle:text forState:UIControlStateNormal];
}

- (NSString *)text {
    return [self titleForState:UIControlStateNormal];
}

- (void)setImageWithURL:(NSURL *)url {
    [self showProgress];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPShouldHandleCookies:YES];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
    AFImageRequestOperation *operation = [AFImageRequestOperation
            imageRequestOperationWithRequest:request
                        imageProcessingBlock:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                [self setImage:image forState:UIControlStateNormal];
                [self hideProgress];
            }
                                     failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                         [self hideProgress];
                                     }];
    [operation start];
}

- (void)setBackgroundImageWithURL:(NSURL *)url {
    [self showProgress];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPShouldHandleCookies:YES];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
    [[AFImageRequestOperation imageRequestOperationWithRequest:request imageProcessingBlock:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        if (image) [self setBackgroundImage:image forState:UIControlStateNormal];
        [self hideProgress];
    }                                                  failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        [self hideProgress];
    }] start];
}


@end