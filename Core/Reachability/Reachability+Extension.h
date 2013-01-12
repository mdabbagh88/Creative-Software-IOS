//
//  Created by Rene Dohan on 7/17/12.
//


#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface Reachability (Extension)

+ (BOOL) isReachable:(NSString *)URL;

@end