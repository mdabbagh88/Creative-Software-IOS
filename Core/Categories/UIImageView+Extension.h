//
//  Created by Rene Dohan on 1/13/13.
//


#import <Foundation/Foundation.h>

@interface UIImageView (Extension)

- (void)resizableImageWithCapInsets:(UIEdgeInsets)insets;

-(void)stretchableImageWithLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight;

@end