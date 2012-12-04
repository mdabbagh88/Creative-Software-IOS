//
//  Created by Rene Dohan on 5/11/12.
//

#import "Work.h"
#import "NSObject+Extension.h"
#import "Lang.h"

@implementation Work {
    BOOL stop;
}
@synthesize method,delay;

- (id)init {
    if ((self = super.init)) {
        stop = YES;
    }
    return self;
}

- (void)process {
    [self doLater:^{
        if (!stop) {
            run(self.method);
            [self process];
        }
    }       after:self.delay];
}

- (void)start {
    if (stop) {
        stop = NO;
        [self process];
    }
}

- (void)stop {
    stop = YES;
}

@end