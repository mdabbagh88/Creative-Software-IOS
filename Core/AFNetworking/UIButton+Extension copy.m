//
// Created by inno on 1/28/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "UIButton+Extension.h"

@implementation UIButton (Extension)


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
            }                        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
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