//
//  Created by Rene Dohan on 6/5/12.
//


#import "UIColor+Extension.h"


@implementation UIColor (Extension)

+ (UIColor *)colorWithRGBA:(CGFloat)red :(CGFloat)green :(CGFloat)blue :(CGFloat)alpha {
    return [UIColor colorWithRed:(red / 255.0) green:(green / 255.0) blue:(blue / 255.0) alpha:alpha];
}

@end