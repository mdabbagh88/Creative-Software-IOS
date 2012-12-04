//
//  Created by Rene Dohan on 5/11/12.
//


#import <Foundation/Foundation.h>


@interface Work : NSObject

- (void)start;

- (void)stop;

@property(copy) void (^method)(void);
@property(nonatomic, assign) double delay;

@end