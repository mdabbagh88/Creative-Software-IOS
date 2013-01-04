//
//  Created by Rene Dohan on 5/11/12.
//

#import "Work.h"
#import "DoLaterProcess.h"
#import "NSObject+Extension.h"

@implementation Work {
		BOOL stop;
		void (^_method) ();
		double _delay;
		DoLaterProcess *_doLater;
}

- (id)init {
		if ((self = super.init))
				stop = YES;
		return self;
}

- (void)process {
		_doLater = [self doLater:^{
				if (!stop) {
						run(_method);
						[self process];
				}
		} :_delay];
}

- (Work *)with:(void (^)())method :(double)delay {
		_method = method;
		_delay = delay;
		return self;
}

- (void)start {
		if (stop) {
				stop = NO;
				[self process];
		}
}

- (void)stop {
		stop = YES;
		[_doLater stop];
}

@end