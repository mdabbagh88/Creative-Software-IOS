//
//  Created by Rene Dohan on 4/29/12.
//

#import "Work.h"


@implementation NSObject (Extension)

- (void)methodToPerform:(void (^)())methodToInvoke {
    methodToInvoke();
}

- (void)doLater:(void (^)())method {
    [self performSelector:@selector(methodToPerform:) withObject:method afterDelay:0.1];
}


- (void)doLater:(void (^)())method after:(double)delay {
    [self performSelector:@selector(methodToPerform:) withObject:method afterDelay:delay];
}

- (Work *)schedule:(void (^)())method :(double)delay {
    Work *work = [Work new];
    work.method = method;
    work.delay = delay;
    return work;
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

+(NSString *)className {
    return self.class.description;
}

@end