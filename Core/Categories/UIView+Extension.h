//
//  Created by Rene Dohan on 4/29/12.
//


#import <Foundation/Foundation.h>

@class UIView;
@class UIViewController;
@class MBProgressHUD;
@class Response;

static float const CS_FADE_TIME = 0.5;

@interface UIView (Extension)

- (void)resizeAutoResizingViewsFonts :(float)multiply;

+ (UIView *)findFirstResponder:(UIView *)view;

+ (UIViewAnimationOptions)animationOptionsWithCurve:(UIViewAnimationCurve)curve;

- (UIView *)firstResponder;

+ (id)create:(NSString *)IBName;

+ (id)create;

+ (void)animationFromCurrentState:(NSTimeInterval)time :(UIViewAnimationCurve)curve;

- (void)fadeIn:(NSTimeInterval)time;

- (void)fadeIn;

- (void)fadeOut:(NSTimeInterval)time;

- (void)fadeOut:(NSTimeInterval)time :(void (^)())method;

- (void)fadeOut;

- (void)fadeToggle;

- (void)setVisible:(BOOL)visible;

- (void)setFadeVisible:(BOOL)visible;

- (BOOL)visible;

- (UIViewController *)controller;

- (id)getView:(int)tag;

@property float height;
@property float width;
@property float top;
@property float absTop;
@property float bottom;
@property(readonly) float absBottom;
@property float left;
@property float right;

- (CGSize)size;

- (void)clearSubViews;

- (MBProgressHUD *)showProgress;

- (void)hideProgress;

- (void)showMessage :(NSString *)string;

- (void)show;

- (void)hide;

- (Response *)showResponse:(Response *)response;

- (Response *)showProgress:(Response *)response;

- (Response *)showFailed:(Response *)response;

//Layout
- (UIView *)addSubviewUnder:(UIView *)view;

- (UIView *)addSubviewRight:(UIView *)view;
@end