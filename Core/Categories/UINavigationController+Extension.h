//
//  Created by Rene Dohan on 4/29/12.
//


#import <Foundation/Foundation.h>

@interface UINavigationController (Extension)
- (void)pushRootViewController:(UIViewController *)newRoot;

- (void)pushViewController:(UIViewController *)controller;

-(void)pushViewController:(UIViewController *)controller :(NSUInteger)index1;

-(void)pushViewControllerAsSecondOfItsKind:(UIViewController *)controller;

- (UIViewController *)popViewController;

-(void)pushViewControllerAsFirstOfItsKind:(UIViewController *)newcontroller;

- (void)pushViewControllerAfter:(UIViewController *)newcontroller :(Class)after;

- (void)replaceLast:(UIViewController *)controller;

- (UIViewController *)previous;

- (UIViewController *)last;
@end