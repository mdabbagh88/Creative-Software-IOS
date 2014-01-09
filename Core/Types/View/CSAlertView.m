//
// Created by inno on 1/31/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CSAlertView.h"


@implementation CSAlertView {
    void (^_button1Action)();

    void (^_button2Action)();
}

- (CSAlertView *)create:(NSString *)title :(NSString *)message :(NSString *)cancelTitle :(NSString *)okTitle :(void (^)())onSubmit {
    _button1Action = [onSubmit copy];
    self.alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:okTitle, nil];
    return self;
}

- (CSAlertView *)show {
    if (_visible) return self;
    [self.alert show];
    _visible = YES;
    return self;
}

- (CSAlertView *)show:(NSString *)title :(NSString *)message :(NSString *)cancelTitle :(NSString *)okTitle :(void (^)())onSubmit {
    return [[self create:title :message :cancelTitle :okTitle :onSubmit] show];
}

- (CSAlertView *)show:(NSString *)title :(NSString *)message :(NSString *)okTitle {
    return [self show:title :message :okTitle :nil :nil];
}

- (CSAlertView *)show:(NSString *)title :(NSString *)message :(NSString *)okTitle :(void (^)())onSubmit {
    return [self show:title :message :okTitle :nil :onSubmit];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.numberOfButtons == 1) run(_button1Action);
    else if (alertView.numberOfButtons == 2) {
        if (buttonIndex == alertView.cancelButtonIndex) return;
        if (alertView.cancelButtonIndex == 0) {
            if (buttonIndex == 1) run(_button1Action);
            if (buttonIndex == 2) run(_button2Action);
        } else {
            if (buttonIndex == 0) run(_button1Action);
            if (buttonIndex == 1) run(_button2Action);
        }
    } else if (alertView.numberOfButtons == 3) {
        if (buttonIndex == 1) run(_button1Action);
        if (buttonIndex == 2) run(_button2Action);
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    _visible = NO;
}

- (CSAlertView *)show:(NSString *)title :(NSString *)message :(NSString *)button1 :(void (^)())button1Action :(NSString *)button2 :(void (^)())button2Action {
    _button1Action = [button1Action copy];
    _button2Action = [button2Action copy];
    self.alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:button1, button2, nil];
    return [self show];
}

- (void)hide {
    _visible = NO;
    [self.alert dismissWithClickedButtonIndex:-1 animated:YES];
}

@end