//
//  Created by Rene Dohan on 4/29/12.
//

#import "Work.h"
#import "DoLaterProcess.h"


@implementation NSObject (Extension)

- (DoLaterProcess *)doLater:(void (^)())method {
		return [[DoLaterProcess new] from:method :0.1];
}

- (DoLaterProcess *)doLater:(void (^)())method :(double)delay {
		return [[DoLaterProcess new] from:method :delay];
}

- (Work *)schedule:(void (^)())method :(double)delay {
		return [[Work new] with:method :delay];
}

- (void)addNotificationCenterObserver:(SEL)sel name:(NSString *)name {
		[[NSNotificationCenter defaultCenter] addObserver:self selector:sel name:name object:nil];
}

- (void)addNotificationCenterObserver:(SEL)sel name:(NSString *)name for:(id)object {
		[[NSNotificationCenter defaultCenter] addObserver:self selector:sel name:name object:object];
}

- (void)removeNotificationObserver {
		[[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (NSString *)className {
		return self.class.description;
}



@end