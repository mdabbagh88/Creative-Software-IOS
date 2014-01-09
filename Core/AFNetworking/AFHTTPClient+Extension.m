//
//  Created by Rene Dohan on 1/10/13.
//


#import "AFHTTPClient+Extension.h"
#import "AFNetworking.h"
#import "NSURL+Extension.h"


@implementation AFHTTPClient (Extension)

- (void)postPath:(NSString *)path :(NSDictionary *)arguments :(NSDictionary *)parameters :(void (^)(AFHTTPRequestOperation *, id))success :(void (^)(AFHTTPRequestOperation *, NSError *))failure {
    [self postPath:[path add:[NSURL createParamsString:arguments]] parameters:parameters success:success failure:failure];
}

- (BOOL)isReachable {
    return self.networkReachabilityStatus != AFNetworkReachabilityStatusNotReachable;
}

- (BOOL)isNotReachable {
    return self.networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable;
}
@end