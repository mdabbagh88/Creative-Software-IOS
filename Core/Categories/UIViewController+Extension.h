//
//  Created by Rene Dohan on 6/11/12.
//


#import <Foundation/Foundation.h>

@interface UIViewController (Extension) <UITextFieldDelegate>

-(UIPopoverController *)presentModalInPopoverIfPossible:(CGRect)rectangle :(UIViewController *)controller;

- (UIPopoverController *)presentInPopoverIfPossible:(CGRect)rectangle :(UIViewController *)controller;

+ (id)create;

+ (id)create:(NSString *)nib;

- (Response *)showResponse:(Response *)request;

- (BOOL)isControllerActive;

-(Response *)showResponse:(Response *)response :(BOOL)reportFailure;

- (Response *)showFailed:(Response *)request;

- (Response *)showProgress:(Response *)request;

- (void)showMessage :(NSString *)string;

- (UIPopoverController *)presentInPopoverIfPossible:(CGRect)rectangle :(UIViewController *)controller :(id <UIPopoverControllerDelegate>)delegate;

-(UIPopoverController *)presentModalInPopoverIfPossible:(CGRect)rectangle :(UIViewController *)controller :(id<UIPopoverControllerDelegate>)delegate;
@end