//
//  Created by Rene Dohan on 4/29/12.
//

#import "UINavigationController+Extension.h"


@implementation UINavigationController (Extension)

- (void)pushRootViewController:(UIViewController *)newRoot {
    [self setViewControllers:[NSArray arrayWithObject:newRoot] animated:YES];
}

- (void)pushViewController:(UIViewController *)controller {
    [self pushViewController:controller animated:YES];
}

- (void)pushViewController:(UIViewController *)controller:(NSUInteger)index {
    NSArray *range = [self.viewControllers subarrayWithRange:NSMakeRange(0, index - 1)];
    NSMutableArray *array = [NSMutableArray arrayWithArray:range];
    [array addObject:controller];
    [self setViewControllers:array animated:YES];
}

- (void)pushViewControllerAsSecondOfItsKind:(UIViewController *)newcontroller {
    int index = 0;
    BOOL firstFoundIndex = NO;
    for (UIViewController *controller in self.viewControllers) {
        index++;
        if ([controller isKindOfClass:newcontroller.class]) {
            if (firstFoundIndex) {
                [self pushViewController:newcontroller :index];
                return;
            }
            else firstFoundIndex = YES;
        }
    }
    [self pushViewController:newcontroller];
}

- (void)pushViewControllerAsFirstOfItsKind:(UIViewController *)newcontroller {
    int index = 0;
    for (UIViewController *controller in self.viewControllers) {
        index++;
        if ([controller isKindOfClass:newcontroller.class]) {
            [self pushViewController:newcontroller :index];
            return;
        }
    }
    [self pushViewController:newcontroller];
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