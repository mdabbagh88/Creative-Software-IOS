//
//  Created by Rene Dohan on 10/24/12.
//


#import "UIControl+Extension.h"


@implementation UIControl (Extension)

- (void)addTouchDown:(id)target:(SEL)action {
		[self addTarget:target action:action forControlEvents:UIControlEventTouchDown];
}

@end