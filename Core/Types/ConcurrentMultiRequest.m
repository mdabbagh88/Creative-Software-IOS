//
//  Created by Rene Dohan on 1/12/13.
//


#import "Response.h"
#import "ConcurrentMultiRequest.h"


@implementation ConcurrentMultiRequest {
		NSInteger _requestCount;
}

- (Response *)add:(Response *)response {
		_requestCount++;
		response.onFailed = ^(NSString *message) {
				[self failed:message];
				[self cancel];
		};
		response.onSuccess = ^(id id) {
				_requestCount--;
				if (_requestCount == 0) {
						[self success:nil];
						[self cancel];
				};
		};
		return response;
}

@end