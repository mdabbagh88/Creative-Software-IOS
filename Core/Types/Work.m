//
//  Created by Rene Dohan on 5/11/12.
//

#import "Work.h"

@implementation Work {
    BOOL stop;

    void (^_method)();

    double _delay;
    NSTimer *_timer;
}

- (id)init {
    if ((self = super.init)) stop = YES;
    return self;
}

- (void)run {
    if (!stop) {
        _count++;
        run(_method);
    }
}

- (Work *)with:(void (^)())method :(double)delay {
    _method = method;
    _delay = delay;
    return self;
}

- (void)start {
    if (stop) {
        stop = NO;
        _count = 0;
        _timer = [NSTimer scheduledTimerWithTimeInterval:_delay target:self selector:@selector(run) userInfo:nil repeats:YES];
    } else {
        _count = 0;
    }
}

- (void)stop {
    if (stop)return;

    stop = YES;
    [_timer invalidate];
    _timer = nil;
}

@end