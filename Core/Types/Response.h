//
//  Created by Rene Dohan on 11/2/12.
//


@class LoginData;

@interface Response : NSObject

@property(copy) void (^onSuccess) (id value);
@property(copy) void (^onFailed) (NSString *message);
@property(copy) void (^onDone) (void);

+ (Response *)wrap:(Response *)response;

- (void)success:(id)data;

- (void)failed:(id)o;
@end