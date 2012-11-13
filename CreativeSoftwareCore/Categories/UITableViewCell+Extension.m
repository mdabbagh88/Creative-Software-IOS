//
//  Created by Rene Dohan on 5/7/12.
//


#import "UITableViewCell+Extension.h"


@implementation UITableViewCell (Extension)

- (void)setSelectedBackgroundColor:(UIColor *)color {
    UIView *bgColorView = [[UIView alloc] init];
    [bgColorView setBackgroundColor:color];
    self.selectedBackgroundView = bgColorView;
}

@end