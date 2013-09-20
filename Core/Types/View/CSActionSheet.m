//
// Created by Rene Dohan on 9/7/13.
// Copyright (c) 2013 creative_studio. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CSActionSheet.h"


@implementation CSActionSheet {
    void (^_onOK)();

    void (^_onAction)();

    BOOL _visible;
}

- (CSActionSheet *)show:(UIView *)view:(NSString *)title :(NSString *)message :(NSString *)cancelTitle :(NSString *)okTitle :(void (^)())onOK :
        (NSString *)actionTitle :(void (^)())onAction {
    _onOK = [onOK copy];
    _onAction = [onAction copy];
    _sheet = [UIActionSheet.alloc initWithTitle:[title add:@" " :message] delegate:self cancelButtonTitle:cancelTitle destructiveButtonTitle:okTitle otherButtonTitles:actionTitle, nil];
    [_sheet showInView:view];
    _visible = YES;
    return self;
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    _visible = NO;
    if (buttonIndex == 0)run(_onOK);
    else if (buttonIndex == 1) run(_onAction);
}

@end