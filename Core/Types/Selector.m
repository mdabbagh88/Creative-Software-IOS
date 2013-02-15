//
//  Created by Rene Dohan on 5/14/12.
//


#import "Selector.h"

#pragma clang diagnostic push
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

- (id)run {
    if ([self.object respondsToSelector:self.selector])
        return [self.object performSelector:self.selector];
    error(@"Object expected to contain selector");
    return nil;
}

@end
#pragma clang diagnostic pop