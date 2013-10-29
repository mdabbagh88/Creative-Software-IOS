//
//  Created by Rene Dohan on 11/2/12.
//



#import "ArgEvent.h"
#import "Event.h"
#import "RequestProtocol.h"
#import "Response.h"

@implementation Response {
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
    [self onSuccessEvent:data];
    [self onDoneEvent];
}

- (void)onSuccessEvent:(id)data {
    _success = YES;
    [_onSuccessEvent run:data];
}

- (void)onDoneEvent {
    _done = YES;
    [_onDoneEvent run];
}

- (void)failed:(Response *)response {
    if (_canceled)return;
    [self onFailedEvent:response];
    [self onDoneEvent];
}

- (void)onFailedEvent:(Response *)response {
    _failed = YES;
    [_onFailedEvent run:response];
}

- (void)cancel {
    _canceled = YES;
}

- (void)setOnSuccess:(void (^)(id))block {
    [_onSuccessEvent add:block];
}

- (void)setOnFailed:(void (^)(Response <RequestProtocol> *))block {
    [_onFailedEvent add:block];
}

- (void)setOnDone:(void (^)(void))block {
    [_onDoneEvent add:block];
}

- (Response *)failIfFail:(Response *)response {
    response.onFailed = ^(Response *_response) {
        [self failed:_response];
    };
    return response;
}

- (Response *)successIfSuccess:(Response *)response {
    response.onSuccess = ^(id value) {
        [self success:value];
    };
    return response;
}

- (Response *)connect:(Response *)response {
    [self failIfFail:response];
    [self successIfSuccess:response];
    return response;
}

- (void)failedWithMessage:(NSString *)message {
    self.message = message;
    [self failed:self];
}

- (Response *)addOnSuccess:(void (^)(id))onSuccess {
    [_onSuccessEvent add:onSuccess];
    return self;
}

- (Response *)addOnDone:(void (^)())block {
    [_onDoneEvent add:block];
    return self;
}

- (Response *)addOnFailed:(void (^)(Response <RequestProtocol> *))block {
    [_onFailedEvent add:block];
    return self;
}

- (Response *)reload:(BOOL)reload {
    _reload = reload;
    return self;
}

- (void)reset {
    _message = nil;
    _done = false;
    _success = false;
    _failed = false;
    _canceled = false;
}

@end