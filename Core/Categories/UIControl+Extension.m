//
//  Created by Rene Dohan on 10/24/12.
//


#import "UIControl+Extension.h"


@implementation UIControl (Extension)

- (void)addTouchDown:(id)target:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpOutside];
}

- (void)addTouchEffect {
    [self addTouchDown:self :@selector(onTouchEffect)];
}

- (void)onTouchEffect {
    UIColor *previousColor = self.backgroundColor;
    self.backgroundColor = [UIColor darkGrayColor];
    doLater(^{
        self.backgroundColor = previousColor;
    }, 0.1);
}

@end