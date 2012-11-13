//
//  Created by Rene Dohan on 10/24/12.
//


#import <Foundation/Foundation.h>

@class Selector;

@interface UISwipeGestureRecognizer (Extension)

+ (UISwipeGestureRecognizer *)new:(id)target:(SEL)selector :(UISwipeGestureRecognizerDirection)direction;

@end