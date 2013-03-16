//
//  Created by Rene Dohan on 6/5/12.
//


#import <Foundation/Foundation.h>

@interface UIColor (Extension)

+ (UIColor *)colorWithRGBA:(CGFloat)red :(CGFloat)green :(CGFloat)blue :(CGFloat)alpha;

+ (UIColor *)colorWithHex:(NSString *)hex;

@end