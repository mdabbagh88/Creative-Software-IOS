//
//  Created by Rene Dohan on 5/11/12.
//


#import <Foundation/Foundation.h>


@interface Work : NSObject

@property(nonatomic) int count;

- (void)start;

- (void)stop;

- (Work *)with:(void (^)())method :(double)delay;
@end