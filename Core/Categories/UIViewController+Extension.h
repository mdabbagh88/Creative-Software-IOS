//
//  Created by Rene Dohan on 6/11/12.
//


#import <Foundation/Foundation.h>

@interface UIViewController (Extension) <UITextFieldDelegate>

+ (id)create;

+ (id)create:(NSString *)nib;

- (Response *)showResponse:(Response *)request;

- (Response *)showFailed:(Response *)request;

- (Response *)showProgress:(Response *)request;

- (void)showMessage :(NSString *)string;
@end