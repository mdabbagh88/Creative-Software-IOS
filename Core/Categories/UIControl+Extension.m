//
//  Created by Rene Dohan on 10/24/12.
//


#import "UIControl+Extension.h"
#import "NSObject+Extension.h"


@implementation UIControl (Extension)

- (void)addTouchDown:(id)target:(SEL)action {
		[self addTarget:target action:action forControlEvents:UIControlEventTouchDown];
}

- (void)addTouchEffect {
		[self addTouchDown:self :@selector(onTouchEffect)];
}

- (void)onTouchEffect {
		UIColor *previousColor = self.backgroundColor;
		self.backgroundColor = [UIColor darkGrayColor];
		[self doLater:^{
				self.backgroundColor = previousColor;
		} :0.1];
}

@end