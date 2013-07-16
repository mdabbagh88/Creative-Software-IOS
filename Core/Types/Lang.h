#import <UIKit/UIKit.h>
#import "DDLog.h"
#import "Log.h"

static const int ddLogLevel = LOG_LEVEL_VERBOSE;

#ifdef DEBUG
    #define infoInt(int)    DDLogInfo(@"%i", int)
    #define infoDbl(double)    DDLogInfo(@"%f", double)
    #define infoBool(BOOL_VAL)    DDLogInfo(@"%s", BOOL_VAL ? "Yes" : "No")
    #define info(NSObject)    DDLogInfo(@"%@",NSObject)
    #define infoEmpty()    DDLogInfo(@"")
    #define error(NSObject)    DDLogError(@"%@",NSObject)
#else
    #define infoInt(int)     [Log infoInt:int]
    #define infoDbl(double)   [Log infoDbl:double]
    #define infoBool(BOOL_VAL)    [Log infoBool:BOOL_VAL]
    #define info(NSObject)    [Log info:NSObject]
    #define infoEmpty()    [Log infoEmpty]
    #define error(NSObject)    [Log error:NSObject]
#endif

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
