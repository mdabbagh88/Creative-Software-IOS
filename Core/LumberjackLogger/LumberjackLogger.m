//
//  Created by Rene Dohan on 10/21/12.
//

#import "LumberjackLogger.h"
#import "DDTTYLogger.h"
#import "DDASLLogger.h"
#import "LumberjackFormatter.h"


@implementation LumberjackLogger

+ (void)initDefaults {
#ifdef DEBUG
    DDASLLogger.sharedInstance.logFormatter = [LumberjackFormatter new];
    DDTTYLogger.sharedInstance.logFormatter = [LumberjackFormatter new];
    [DDLog addLogger:DDASLLogger.sharedInstance];
    [DDLog addLogger:DDTTYLogger.sharedInstance];
#endif
}

@end