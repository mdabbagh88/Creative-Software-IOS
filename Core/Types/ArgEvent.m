//
//  Created by Rene Dohan on 12/30/12.
//


#import "ArgEvent.h"

@implementation ArgEvent

- (id)init {
    if (self = [super init])
        _blockArray = [NSMutableArray new];
    return self;
}

- (void)run:(id)argument {
    for (void (^block)(id) in _blockArray) runWith(block, argument);
}

- (void)add:(void (^)(id))block {
    [_blockArray addObject:block];
}

@end