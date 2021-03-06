//
//  Created by Rene Dohan on 12/29/12.
//


#import <Foundation/Foundation.h>
#import "Response.h"


@interface MultiResponse : Response

@property(nonatomic, readonly) Response *addedRequest;

- (Response *)add:(Response *)response;

- (Response *)addLast:(Response *)request;

@end