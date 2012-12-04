//
//  Created by Rene Dohan on 11/2/12.
//


@class Request;

@interface Response : NSObject

@property(copy) void (^onSuccess) (id value);
@property(copy) void (^onFailed) (NSString *message);
@property(copy) void (^onDone) (void);

+ (Response *)wrap:(Response *)response;

@end