//
// Created by inno on 1/31/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface CSAlertView : NSObject <UIAlertViewDelegate>
<<<<<<< HEAD
- (CSAlertView *)show:(NSString *)title :(NSString *)message :(NSString *)cancelTitle :(NSString *)okTitle:(void (^)())onSubmit;
=======
@property(nonatomic, strong) UIAlertView *alert;

@property(nonatomic) BOOL visible;

-(CSAlertView *)show:(NSString *)title :(NSString *)message :(NSString *)cancelTitle :(NSString *)okTitle:(void (^)())onSubmit;
>>>>>>> 44e50698063f05a11e3889039c95d81b02418274

- (CSAlertView *)show:(NSString *)title :(NSString *)message :(NSString *)okTitle;

- (CSAlertView *)show:(NSString *)title :(NSString *)message :(NSString *)okTitle :(void (^)())onSubmit;

- (CSAlertView *)show:(NSString *)title :(NSString *)message :(NSString *)button1 :(void (^)())button1Action :(NSString *)button2 :(void (^)())button2Action;

- (BOOL)visible;

- (void)hide;
@end