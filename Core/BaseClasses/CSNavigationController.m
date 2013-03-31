//
//  Created by Rene Dohan on 10/26/12.
//


#import "CSNavigationController.h"
#import "UINavigationController+Extension.h"


@implementation CSNavigationController {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _instance = self;
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    _lastPoped = self.last;
    return [super popViewControllerAnimated:animated];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    _lastPoped = nil;
    [super pushViewController:viewController animated:animated];
}

- (void)pushRootViewController:(UIViewController *)newRoot {
    _lastPoped = nil;
    [super pushRootViewController:newRoot];
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated {
    return [super popToRootViewControllerAnimated:animated];
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    _lastPoped = viewController;
    return [super popToViewController:viewController animated:animated];
}

@end