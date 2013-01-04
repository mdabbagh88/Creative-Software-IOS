//
//  Created by Rene Dohan on 1/2/13.
//


#import <Foundation/Foundation.h>


@interface DoLaterProcess : NSObject

- (DoLaterProcess *)from:(void (^)())method :(NSTimeInterval) delay;

- (void)stop;

@end