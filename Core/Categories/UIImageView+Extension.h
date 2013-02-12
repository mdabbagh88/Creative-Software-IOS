//
//  Created by Rene Dohan on 1/13/13.
//


#import <Foundation/Foundation.h>

@interface UIImageView (Extension)

- (void)setImageURL:(NSURL *)url;

- (void)resizableImageWithCapInsets:(UIEdgeInsets)insets;

-(void)stretchableImageWithLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight;
@end