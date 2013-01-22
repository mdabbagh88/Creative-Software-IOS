//
//  Created by Rene Dohan on 1/13/13.
//


#import "UIScrollView+Extension.h"


@implementation UIScrollView (Extension)

- (void)scrollToPage:(NSInteger)to of:(NSInteger)of {
		CGFloat pageWidth = self.contentSize.width / of;
		CGFloat x = to * pageWidth;
		[self scrollRectToVisible:CGRectMake(x, 0, pageWidth, self.height) animated:YES];
}

- (void)sizeHeightToFit {
		UIEdgeInsets inset = self.contentInset;
		self.height = self.contentSize.height + inset.top + inset.bottom;
}

@end