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

@interface Lang : NSObject {
}

void showMessage(NSString *string);

void showProgress(UIView *view);

void hideProgress(UIView *view);

void run(void (^block)());

void runWith(void (^block)(id), id value);

@end
