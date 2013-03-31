//
//  Created by Rene Dohan on 6/11/12.
//

#import "UINavigationController+Extension.h"

@implementation UIViewController (Extension)

- (Response *)showResponse:(Response *)request {
    return [self showResponse:request :NO];
}

- (Response *)showResponse:(Response *)response :(BOOL)reportFailure {
    return [self.view showResponse:response];
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

- (UIPopoverController *)presentInPopoverIfPossible:(CGRect)rectangle :(UIViewController *)controller :(id <UIPopoverControllerDelegate>)delegate {
    if (UIDevice.ipad) {
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:controller];
        popover.delegate = delegate;
        [popover presentPopoverFromRect:rectangle inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        return popover;
    } else {
        [self.navigationController pushViewController:controller];
        return nil;
    }
}

- (UIPopoverController *)presentModalInPopoverIfPossible:(CGRect)rectangle :(UIViewController *)controller :(id <UIPopoverControllerDelegate>)delegate {
    if (UIDevice .ipad) {
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:controller];
        popover.delegate = delegate;
        [popover presentPopoverFromRect:rectangle inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        return popover;
    } else {
        [self presentModalViewController:controller animated:YES];
        return nil;
    }
}

- (UIPopoverController *)presentModalInPopoverIfPossible:(CGRect)rectangle :(UIViewController *)controller {
    return [self presentModalInPopoverIfPossible:rectangle :controller :nil];
}

- (UIPopoverController *)presentInPopoverIfPossible:(CGRect)rectangle :(UIViewController *)controller {
    return [self presentInPopoverIfPossible:rectangle :controller :nil];
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