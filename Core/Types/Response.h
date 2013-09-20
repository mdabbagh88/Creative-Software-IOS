//
//  Created by Rene Dohan on 11/2/12.
//

@protocol RequestProtocol;

@interface Response : NSObject

@property(copy, nonatomic) void (^onSuccess)(id);
@property(copy, nonatomic) void (^onFailed)(Response <RequestProtocol> *);
@property(copy, nonatomic) void (^onDone)(void);

- (void)success:(id)data;

- (void)failed:(Response *)response;

- (void)cancel;

@property(nonatomic, readonly) BOOL canceled;

@property(nonatomic, copy) NSString *message;

@property(nonatomic, readonly) BOOL failed;

@property(nonatomic) BOOL done;

@property(nonatomic) BOOL success;

@property(nonatomic) BOOL reload;

- (Response *)failIfFail:(Response *)request;

- (Response *)connect:(Response *)response;

- (Response *)successIfSuccess:(Response *)response;

- (void)failedWithMessage:(NSString *)string;

- (Response *)addOnSuccess:(void (^)(id))onSuccess;

- (Response *)addOnDone:(void (^)())block;

- (Response *)addOnFailed:(void (^)(Response <RequestProtocol> *))block;

- (void)reset;

- (Response *)reload:(BOOL)reload;
@end