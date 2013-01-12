//
//  Created by Rene Dohan on 1/12/13.
//


#import "UITextView+Extension.h"


@implementation UITextView (Extension)

- (void)sizeHeightToFit {
		UIEdgeInsets inset = self.contentInset;
		self.height = self.contentSize.height + inset.top + inset.bottom;
}

@end