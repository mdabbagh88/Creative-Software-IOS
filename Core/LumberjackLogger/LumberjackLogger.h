//
//  Created by Rene Dohan on 10/21/12.
//


#import <Foundation/Foundation.h>
#import "DDLog.h"

@class DDFileLogger;

@interface LumberjackLogger : NSObject

+ (void)initDefaults;

+ (NSString *)memorySafeLogPart;

+ (NSString *)logPath;
@end