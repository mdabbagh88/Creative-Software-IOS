//
//  Created by Rene Dohan on 4/29/12.
//


#import <Foundation/Foundation.h>

@class Work;
@class DoLaterProcess;

@interface NSObject (Extension)

- (DoLaterProcess *)doLater:(void (^)())method;

- (DoLaterProcess *)doLater:(void (^)())method :(double)delay;

- (Work *)schedule:(void (^)())method :(double)delay;

- (void)addNotificationCenterObserver:(SEL)sel name:(NSString *)name;

- (void)addNotificationCenterObserver:(SEL)sel name:(NSString *)name for:(id)object;

- (void)removeNotificationObserver;

- (id)invoke:(__unused NSString *)methodName;

+ (NSString *)className;

@end