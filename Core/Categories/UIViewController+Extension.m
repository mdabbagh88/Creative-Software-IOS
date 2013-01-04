//
//  Created by Rene Dohan on 6/11/12.
//

#import "UIView+Extension.h"

@implementation UIViewController (Extension)

- (Response *)showRequest:(Response *)request {
		return [self.view showRequest:request];
}

- (Response *)showFailed:(Response *)request {
		return [self.view showFailed:request];
}

- (Response *)showProgress:(Response *)request {
		return [self.view showProgress:request];
}

- (void)showMessage :(NSString *)string {
		[self.view showMessage:string];
}

+ (id)create {
		NSString *className = NSStringFromClass([self class]);
		NSString *viewName = [className stringByReplacingOccurrencesOfString:@"Controller" withString:@""];
		return [[self alloc] initWithNibName:viewName bundle:nil];
}

+ (id)create:(NSString *)nib {
		return [[self alloc] initWithNibName:nib bundle:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
		[theTextField resignFirstResponder];
		return YES;
}

@end