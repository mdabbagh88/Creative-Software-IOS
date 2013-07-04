//
//  Created by Rene Dohan on 10/24/12.
//


#import "UIControl+Extension.h"
#import "UIColor+Extension.h"


@implementation UIControl (Extension)

- (void)addTouchDown:(id)target:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventTouchDown];
}

- (void)addEffectTouchDown:(id)target:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    [self addTouchEffect];
}

- (void)addTouchEffect {
    [self addTouchDown:self :@selector(onTouchEffect)];
}

- (void)addTouchEffect:(UIColor *)color {
    [self addTouchDown:self :@selector(onTouchEffect)];
}

- (void)onTouchEffect {
    UIColor *previousColor = self.backgroundColor;
    self.backgroundColor = [UIColor colorWithRGBA:150 :150 :150 :0.5];
    doLater(^{
        self.backgroundColor = previousColor;
    }, 0.1);
}

@end