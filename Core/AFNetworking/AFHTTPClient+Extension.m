//
//  Created by Rene Dohan on 1/10/13.
//


#import "AFHTTPClient+Extension.h"
#import "AFNetworking.h"
#import "NSString+Extensions.h"


@implementation AFHTTPClient (Extension)

- (void)postPath:(NSString *)path :(NSDictionary *)arguments :(NSDictionary *)parameters :(void (^)(AFHTTPRequestOperation *, id))success :(void (^)(AFHTTPRequestOperation *, NSError *))failure {
		if (arguments.count) {
				path = [path add:@"?"];
				for (NSString *key in arguments)
						path = [path add:(key) :@"=" :((NSObject *) [arguments get:key]).description :@"&"];
				path = [path substringToIndex:path.length - 1];
		}
		[self postPath:path parameters:parameters success:success failure:failure];
}

@end