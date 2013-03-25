//
// Created by inno on 1/31/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CSAlertView.h"


@implementation CSAlertView {
    void (^_button1Action)();

    void (^_button2Action)();

    UIAlertView *_alert;
}

- (CSAlertView *)show:(NSString *)title :(NSString *)message :(NSString *)cancelTitle :(NSString *)okTitle:(void (^)())onSubmit {
    _button1Action = [onSubmit copy];
    _alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:okTitle, nil];
    [_alert show];
    return self;
}

- (CSAlertView *)show:(NSString *)title :(NSString *)message :(NSString *)okTitle {
    return [self show:title :message :okTitle :nil :nil];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 0)return;
    if (buttonIndex == 1) run(_button1Action);
    else if (buttonIndex == 2) run(_button2Action);
}

- (CSAlertView *)show:(NSString *)title :(NSString *)message :(NSString *)button1 :(void (^)())button1Action :(NSString *)button2 :(void (^)())button2Action {
    _button1Action = [button1Action copy];
    _button2Action = [button2Action copy];
    _alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:button1, button2,nil];
    [_alert show];
    return self;
}
@end