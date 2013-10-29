//
//  Created by Rene Dohan on 10/21/12.
//

#import "LumberjackLogger.h"
#import "DDTTYLogger.h"
#import "DDASLLogger.h"
#import "LumberjackFormatter.h"
#import "DDFileLogger.h"
#import "NSData+Extension.h"
#import "NSFileManager+Extension.h"


static const int DISPLAY_LENGTH = 100000;

@implementation LumberjackLogger

static DDFileLogger *_fileLogger;

+ (void)initDefaults {
    DDASLLogger.sharedInstance.logFormatter = [LumberjackFormatter new];
    DDTTYLogger.sharedInstance.logFormatter = [LumberjackFormatter new];
    [DDLog addLogger:DDASLLogger.sharedInstance];
    [DDLog addLogger:DDTTYLogger.sharedInstance];
    _fileLogger = DDFileLogger.new;
    _fileLogger.rollingFrequency = 60 * 60 * 24 * 7;
    _fileLogger.logFileManager.maximumNumberOfLogFiles = 1;
    [DDLog addLogger:_fileLogger];
}

+ (NSString *)memorySafeLogPart {
    [DDLog flushLog];
    NSData *data = [NSData dataWithContentsOfFile:self.logPath
                                         atOffset:[NSFileManager fileLength:self.logPath] - DISPLAY_LENGTH
                                         withSize:DISPLAY_LENGTH];
    return [NSString.alloc initWithData:data encoding:NSUTF8StringEncoding];
}

+ (NSString *)logPath {
    [DDLog flushLog];
    return _fileLogger.logFileManager.sortedLogFilePaths[0];
}

@end