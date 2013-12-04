//
//  Created by Rene Dohan on 1/12/13.
//


#import <Foundation/Foundation.h>
#import "Response.h"


@interface ConcurrentMultiResponse : Response {

}

-(Response *)addAll:(NSArray *)responses;

- (Response *)add:(Response *)response;

@end