//
//  Created by Rene Dohan on 4/29/12.
//


#import <Foundation/Foundation.h>

@interface UINavigationController (Extension)
- (void)pushRootViewController:(UIViewController *)newRoot;

- (void)pushViewController:(UIViewController *)controller;

- (UIViewController *)popViewController;

- (void)replaceLast:(UIViewController *)controller;

- (UIViewController *)previous;

- (UIViewController *)last;
@end