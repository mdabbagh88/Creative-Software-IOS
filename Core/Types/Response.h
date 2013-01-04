//
//  Created by Rene Dohan on 11/2/12.
//


@class LoginData;

@interface Response : NSObject

@property(copy, nonatomic) void (^onSuccess) (id value);
@property(copy, nonatomic) void (^onFailed) (NSString *message);
@property(copy, nonatomic) void (^onDone) (void);

@property(nonatomic, strong) Response *wrapped;

- (void)success:(id)data;

- (void)failed:(NSString *)message;

- (void)cancel;

@property(nonatomic, readonly) BOOL canceled;

@end