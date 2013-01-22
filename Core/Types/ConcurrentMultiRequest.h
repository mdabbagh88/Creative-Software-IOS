//
//  Created by Rene Dohan on 1/12/13.
//


#import <Foundation/Foundation.h>
#import "Response.h"


@interface ConcurrentMultiRequest : Response {

}

- (Response *)add:(Response *)response;

@end