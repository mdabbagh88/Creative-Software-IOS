//
//  Created by Rene Dohan on 1/13/13.
//


#import "AFNetworking.h"


@implementation UIImageView (Extension)

- (void)setImageURL:(NSURL *)url {
    [self setImageWithURL:url placeholderImage:self.image];
}

@end