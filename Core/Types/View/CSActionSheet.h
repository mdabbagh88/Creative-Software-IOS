//
// Created by Rene Dohan on 9/7/13.
// Copyright (c) 2013 creative_studio. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface CSActionSheet : NSObject <UIActionSheetDelegate>

@property(nonatomic, readonly) UIActionSheet *sheet;

- (CSActionSheet *)show:(UIView *)view:(NSString *)title :(NSString *)message :(NSString *)cancelTitle :(NSString *)okTitle:(void (^)())onOK :(NSString *)actionTitle:(void (^)())onAction;

@end