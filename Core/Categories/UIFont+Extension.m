//
// Created by inno on 2/2/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "UIFont+Extension.h"


@implementation UIFont (Extension)

- (void)setTo:(NSArray *)items {
    for (id item in items) {
        [item setFont:self];
    }
}

@end