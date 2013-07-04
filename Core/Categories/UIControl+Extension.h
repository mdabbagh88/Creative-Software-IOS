//
//  Created by Rene Dohan on 10/24/12.
//


#import <Foundation/Foundation.h>

@interface UIControl (Extension)

- (void)addTouchDown:(id)target:(SEL)action;

- (void)addEffectTouchDown:(id)target :(SEL)action;

- (void)addTouchEffect;

@end