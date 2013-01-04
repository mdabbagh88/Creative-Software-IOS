//
//  Created by Rene Dohan on 12/30/12.
//


#import "Event.h"


@implementation Event

- (id)init {
		if (self = [super init])
				_blockArray = [NSMutableArray new];
		return self;
}

- (void)run {
		for (
				void (^block) (id)
				in _blockArray) {
				run(block);
		}
}

- (void)add:(void (^)(void))block {
		[_blockArray addObject:block];
}


@end