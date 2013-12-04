//
// Created by inno on 1/31/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface CSAlertView : NSObject <UIAlertViewDelegate>

@property(nonatomic, strong) UIAlertView *alert;

@property(nonatomic, readonly) BOOL visible;

- (CSAlertView *)show;

- (CSAlertView *)show:(NSString *)title :(NSString *)message :(NSString *)cancelTitle :(NSString *)okTitle :(void (^)())onSubmit;

- (CSAlertView *)show:(NSString *)title :(NSString *)message :(NSString *)okTitle;

- (CSAlertView *)show:(NSString *)title :(NSString *)message :(NSString *)okTitle :(void (^)())onSubmit;

- (CSAlertView *)show:(NSString *)title :(NSString *)message :(NSString *)button1 :(void (^)())button1Action :(NSString *)button2 :(void (^)())button2Action;

- (CSAlertView *)create:(NSString *)title :(NSString *)message :(NSString *)cancelTitle :(NSString *)okTitle :(void (^)())onSubmit;

- (void)hide;

@end