//
//  Created by Rene Dohan on 4/29/12.
//

#import "UINavigationController+Extension.h"
#import "NSArray+Extension.h"


@implementation UINavigationController (Extension)

- (void)pushRootViewController:(UIViewController *)newRoot {
    [self setViewControllers:[NSArray arrayWithObject:newRoot] animated:YES];
}

- (void)pushViewController:(UIViewController *)controller {
    [self pushViewController:controller animated:YES];
}

- (void)replaceLast:(UIViewController *)controller {
    [self popViewControllerAnimated:NO];
    [self pushViewController:controller animated:YES];
}

- (UIViewController *)popViewController {
    return [self popViewControllerAnimated:YES];
}

- (UIViewController *)previous {
    int previousControllerIndex = self.viewControllers.count - 2;
    return [self.viewControllers at:previousControllerIndex];
}

- (UIViewController *)last {
    return self.viewControllers.lastObject;
}
@end