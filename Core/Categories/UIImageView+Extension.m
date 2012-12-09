//
//  Created by Rene Dohan on 12/7/12.
//


#import "UIImageView+Extension.h"


@implementation UIImageView (Extension)

- (void)stretchableImageWithLeftCapWidth:(int)width topCapHeight:(int)height {
		self.image = [self.image stretchableImageWithLeftCapWidth:width topCapHeight:height];
}

- (void)resizableImageWithCapInsets:(UIEdgeInsets)insets {
		self.image = [self.image resizableImageWithCapInsets:insets];
}

@end