//
//  Created by Rene Dohan on 7/17/12.
//


#import "Reachability+Extension.h"


@implementation Reachability (Extension)

+ (BOOL)isReachable:(NSString *)URL {
    Reachability *reachability = [Reachability reachabilityWithHostname:URL];
    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    if (remoteHostStatus == NotReachable) return NO;
    return YES;
}


@end