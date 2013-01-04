//
//  Created by Rene Dohan on 1/2/13.
//


#import "DoLaterProcess.h"


@implementation DoLaterProcess {
		id _method;
		BOOL _stop;
}

- (void)methodToPerform:(void (^)())methodToInvoke {
		info(self);
		if (!_stop) methodToInvoke();
}

- (DoLaterProcess *)from:(void (^)())method:(NSTimeInterval)delay {
		[self performSelector:@selector(methodToPerform:) withObject:method afterDelay:delay];
		_method = method;
		return self;
}

- (void)stop {
		info(self);
		_stop = YES;
		[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(methodToPerform:) object:_method];
}

@end