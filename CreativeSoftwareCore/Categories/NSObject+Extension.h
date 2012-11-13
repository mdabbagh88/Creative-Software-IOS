//
//  Created by Rene Dohan on 4/29/12.
//


#import <Foundation/Foundation.h>

@class Work;

@interface NSObject (Extension)

- (void)doLater:(void (^)())method;

- (void)doLater:(void (^)())method after:(double)delay;

- (Work *)schedule:(void (^)())method :(double)delay;

- (void)addNotificationCenterObserver:(SEL)sel name:(NSString *)name;

- (void)addNotificationCenterObserver:(SEL)sel name:(NSString *)name for:(id)object;

- (void)removeNotificationObserver;

+(NSString *)className;
@end