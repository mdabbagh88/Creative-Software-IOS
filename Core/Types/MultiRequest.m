//
//  Created by Rene Dohan on 12/29/12.
//


#import "MultiRequest.h"


@implementation MultiRequest {
    Response *_addedRequest;
}

- (Response *)add:(Response *)request {
    _addedRequest = request;
    [self failIfFail:request];
    return request;
}

- (void)cancel {
    [super cancel];
    [_addedRequest cancel];
}

- (Response *)addLast:(Response *)request {
    [self add:request].onSuccess = ^(id id) {
        [self success:id];
    };
    return request;
}

- (void)finish {
    invoke(^{
        [self success:nil];
    });
}

@end