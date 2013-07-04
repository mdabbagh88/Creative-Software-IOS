//
//  Created by Rene Dohan on 6/11/12.
//


#import <Foundation/Foundation.h>

@interface UIViewController (Extension) <UITextFieldDelegate>

-(UIPopoverController *)presentModalInPopoverIfPossible:(UIView*)view :(UIViewController *)controller;

- (UIPopoverController *)presentInPopoverIfPossible:(UIView*)view :(UIViewController *)controller;

+ (id)create;

+ (id)create:(NSString *)nib;

- (NSString *)controllerName;

- (Response *)showResponse:(Response *)request;

- (BOOL)isControllerActive;

-(Response *)showResponse:(Response *)response :(BOOL)reportFailure;

- (Response *)showFailed:(Response *)request;

- (Response *)showProgress:(Response *)request;

- (void)showMessage :(NSString *)string;

- (UIPopoverController *)presentInPopoverIfPossible:(UIView*)view :(UIViewController *)controller :(id <UIPopoverControllerDelegate>)delegate;

-(UIPopoverController *)presentModalInPopoverIfPossible:(UIView*)view :(UIViewController *)controller :(id<UIPopoverControllerDelegate>)delegate;
@end