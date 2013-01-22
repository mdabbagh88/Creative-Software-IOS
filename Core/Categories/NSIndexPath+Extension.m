//
//  Created by Rene Dohan on 1/12/13.
//


#import "NSIndexPath+Extension.h"


@implementation NSIndexPath (Extension)
- (NSUInteger)index {
		return (NSUInteger) self.row;
}

@end