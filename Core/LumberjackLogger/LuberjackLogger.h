//
//  Created by Rene Dohan on 10/21/12.
//


#import <Foundation/Foundation.h>
#import "DDLog.h"

@interface LuberjackLogger : NSObject <DDLogFormatter>
- (void)initDefaults;
@end