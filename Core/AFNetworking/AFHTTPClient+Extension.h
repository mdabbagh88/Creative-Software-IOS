//
//  Created by Rene Dohan on 1/10/13.
//


#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"

@interface AFHTTPClient (Extension)

- (void)postPath:(NSString *)path:(NSDictionary *)arguments:(NSDictionary *)parameters
		:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
		:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end