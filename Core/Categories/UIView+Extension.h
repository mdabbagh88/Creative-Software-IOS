//
//  Created by Rene Dohan on 4/29/12.
//


#import <Foundation/Foundation.h>

@class UIView;
@class UIViewController;
@class MBProgressHUD;
@class Response;

@interface UIView (Extension)

+ (UIView *)findFirstResponder:(UIView *)view;

- (UIView *)firstResponder;

+ (id)create:(NSString *)IBName;

+ (id)create;

+ (void)animationFromCurrentState:(NSTimeInterval)time :(UIViewAnimationCurve)curve;

- (void)fadeIn:(NSTimeInterval)time;

- (void)fadeIn;

- (void)fadeOut:(NSTimeInterval)time;

- (void)fadeOut:(NSTimeInterval)time:(void (^)())method;

- (void)fadeOut;

- (void)fadeToggle;

- (void)setVisible:(BOOL)visible;

- (BOOL)visible;

- (UIViewController *)controller;

- (id)getView:(int)tag;

@property float height;
@property float width;
@property float top;
@property float abstop;
@property float bottom;
@property(readonly) float absbottom;
@property float left;
@property float right;

- (void)clearSubViews;

- (MBProgressHUD *)showProgress;

- (void)hideProgress;

- (void)showMessage :(NSString *)string;

- (Response *)showResponse:(Response *)request;

- (Response *)showProgress:(Response *)request;

- (Response *)showFailed:(Response *)request;

//Layout
- (UIView *)addSubviewUnder:(UIView *)view;

- (UIView *)addSubviewRight:(UIView *)view;
@end