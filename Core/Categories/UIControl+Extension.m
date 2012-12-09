//
//  Created by Rene Dohan on 10/24/12.
//


#import "UIControl+Extension.h"


@implementation UIControl (Extension)

- (void)addTouchDown:(id)target:(SEL)action {
		[self addTarget:target action:action forControlEvents:UIControlEventTouchDown];
}

- (void)addTouchEffect {
		[self addTouchDown:self :@selector(onTouchEffect)];
}

- (void)onTouchEffect {
		self.backgroundColor = [UIColor darkGrayColor];
		[self doLater:^{
				self.backgroundColor = UIColor.clearColor;
		}       after:0.1];
}

@end