//
//  Created by Rene Dohan on 11/2/12.
//



#import "Response.h"
#import "ArgEvent.h"
#import "Event.h"

@implementation Response {
		BOOL _canceled;
		ArgEvent *_onFailedEvent;
		ArgEvent *_onSuccessEvent;
		Event *_onDoneEvent;
}

- (id)init {
		if (self = [super init]) {
				_onFailedEvent = [ArgEvent new];
				_onSuccessEvent = [ArgEvent new];
				_onDoneEvent = [Event new];
		}
		return self;
}

- (void)success:(id)data {
		if (_canceled)return;
		[_onSuccessEvent run:data];
		[_onDoneEvent run];
}

- (void)failed:(NSString *)message {
		if (_canceled)return;
		[_onFailedEvent run:message];
		[_onDoneEvent run];
}

- (void)cancel {
		_canceled = YES;
}

- (void)setOnSuccess:(void (^)(id))block {
		[_onSuccessEvent add:block];
}

- (void)setOnFailed:(void (^)(NSString *))block {
		[_onFailedEvent add:block];
}

- (void)setOnDone:(void (^)(void))block {
		[_onDoneEvent add:block];
}

- (Response*)failIfFail:(Response *)response {
		response.onFailed = ^(NSString *message) {
				[self failed:message];
		};
		return response;
}- (Response*)successIfSuccesss:(Response *)response {
		response.onSuccess = ^(id value) {
				[self success:value];
		};
		return response;
}

- (Response*)connect:(Response *)response {
		[self failIfFail:response];
		[self successIfSuccesss:response];
		return response;
}
@end