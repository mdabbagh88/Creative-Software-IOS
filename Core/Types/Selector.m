//
//  Created by Rene Dohan on 5/14/12.
//


#import "Selector.h"
#import "Lang.h"

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
@implementation Selector {

}
@synthesize selector, object;

+ (Selector *)new:(SEL)selector :(NSObject *)object {
    Selector *this = [self new];
    this.object = object;
    this.selector = selector;
    return this;
}

- (void)run {
    if ([self.object respondsToSelector:self.selector])
        [self.object performSelector:self.selector];
    else error(@"Object expected to contain selector");

}
@end