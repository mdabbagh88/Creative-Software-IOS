//
//  Created by Rene Dohan on 7/15/12.
//


#import "CALayer+Extension.h"


@implementation CALayer (Extension)

- (void)setBorder:(CGFloat)width :(UIColor *)color :(int)radius {
    self.borderWidth = width;
    self.borderColor = color.CGColor;
    self.cornerRadius = radius;
    self.masksToBounds = YES;
}

@end