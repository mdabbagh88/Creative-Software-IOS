//
//  Created by Rene Dohan on 12/7/12.
//


#import <Foundation/Foundation.h>

@interface UIImageView (Extension)

- (void)stretchableImageWithLeftCapWidth:(int)width topCapHeight:(int)height;

- (void)resizableImageWithCapInsets:(UIEdgeInsets)insets;

@end