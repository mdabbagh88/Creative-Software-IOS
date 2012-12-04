//
//  Created by Rene Dohan on 10/21/12.
//

#import "LuberjackLogger.h"
#import "DDTTYLogger.h"
#import "DDASLLogger.h"


@implementation LuberjackLogger {
    NSDateFormatter *threadUnsafeDateFormatter;
}

- (id)init {
    if ((self = [super init])) {
        threadUnsafeDateFormatter = [[NSDateFormatter alloc] init];
        [threadUnsafeDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
        [threadUnsafeDateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss:SSS"];
    }
    return self;
}


- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSString *logLevel;
    switch (logMessage->logFlag) {
        case LOG_FLAG_ERROR :
            logLevel = @"Error";
            break;
        case LOG_FLAG_WARN  :
            logLevel = @"Warn";
            break;
        case LOG_FLAG_INFO  :
            logLevel = @"Info";
            break;
        default             :
            logLevel = @"Verbose";
            break;
    }

    NSString *dateAndTime = [threadUnsafeDateFormatter stringFromDate:(logMessage->timestamp)];
    return [NSString stringWithFormat:@"%@ %@ %@ %@ %i = %@\n",dateAndTime, logLevel, logMessage.fileName,
                                      logMessage.methodName, logMessage->lineNumber, logMessage->logMsg];
}

- (void)initDefaults {
    DDASLLogger.sharedInstance.logFormatter = self;
    DDTTYLogger.sharedInstance.logFormatter = self;
    [DDLog addLogger:DDASLLogger.sharedInstance];
    [DDLog addLogger:DDTTYLogger.sharedInstance];
}

@end