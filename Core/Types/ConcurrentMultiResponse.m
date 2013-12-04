//
//  Created by Rene Dohan on 1/12/13.
//


#import "Response.h"
#import "ConcurrentMultiResponse.h"


@implementation ConcurrentMultiResponse {
    NSInteger _requestCount;
}

- (Response *)addAll:(NSArray *)responses {
    for (Response *response in responses) [self add:response];
    return self;
}

- (Response *)add:(Response *)response {
    _requestCount++;
    response.onFailed = ^(Response *response) {
        [self failed:response];
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