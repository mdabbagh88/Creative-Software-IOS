//
//  Created by Rene Dohan on 1/13/13.
//


#import "AFNetworking.h"


@implementation UIImageView (Extension)

- (void)setImageURL:(NSURL *)url {
    [self setImageWithURL:url placeholderImage:self.image];
}

- (void)resizableImageWithCapInsets:(UIEdgeInsets)insets {
    self.image = [self.image resizableImageWithCapInsets:insets];
}

- (void)stretchableImageWithLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight {
    self.image = [self.image stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
}


@end