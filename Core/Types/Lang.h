#import <UIKit/UIKit.h>
#import "DDLog.h"

static const int ddLogLevel = LOG_LEVEL_VERBOSE;

#define infoInt(int)    DDLogInfo(@"%i", int)
#define infoDbl(double)    DDLogInfo(@"%f", double)
#define infoBool(BOOL_VAL)    DDLogInfo(@"%s", BOOL_VAL ? "Yes" : "No")
#define info(NSObject)    DDLogInfo(@"%@",NSObject)
#define infoEmpty()    DDLogInfo(@"")
#define error(NSObject)    DDLogError(@"%@",NSObject)

#define L(key) NSLocalizedString(key, nil)
static int const MINUTE = 60;
static int const HOUR = MINUTE * 60;
static int const DAY = HOUR * 24;

@interface Lang : NSObject

void run(void (^block)());

id nilToNULL(id object);

id nilToString(id object);

void runWith(void (^block)(id), id value);

void doLater(void (^block)(void), NSTimeInterval delay);

void invoke(void (^block)(void));

void doLaterWith(void (^block)(id), id value, NSTimeInterval delay);

void invokeWith(void (^block)(id), id value);

@end
