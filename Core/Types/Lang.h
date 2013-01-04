#import <UIKit/UIKit.h>
#import "DDLog.h"

#import "DDLog.h"

static const int ddLogLevel = LOG_LEVEL_VERBOSE;

#define infoInt(int)    DDLogInfo(@"%i", int)
#define infoDbl(double)    DDLogInfo(@"%f", double)
#define infoBool(BOOL_VAL)    DDLogInfo(@"%s", BOOL_VAL ? "Yes" : "No")
#define info(NSObject)    DDLogInfo(@"%@",NSObject)
#define error(NSObject)    DDLogError(@"%@",NSObject)
#define infoEmpty()    DDLogInfo(@"")
static int const MINUTE = 60;

@interface Lang : NSObject

void run (void (^block) ());

void runWith (void (^block) (id), id value);

@end
