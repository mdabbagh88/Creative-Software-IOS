//
//  Created by Rene Dohan on 4/29/12.
//


#import <Foundation/Foundation.h>

@class UIView;
@class UIViewController;
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

- (void)fadeOut;

- (void)fadeToggle;

- (BOOL)visible;

- (UIViewController *)viewDelegate;

@property float height;
@property float width;
@property float top;
@property float bottom;
@property float left;
@property(readonly) float right;

+ (BOOL)iphone;

- (void)clearSubViews;


- (Response *)showRequest:(Response *)request;

- (Response *)showProgress:(Response *)request;

//Layout
- (UIView *)addSubviewUnder:(UIView *)view;

- (UIView *)addSubviewRight:(UIView *)view;
@end