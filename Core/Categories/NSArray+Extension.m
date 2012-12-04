//
//  Created by Rene Dohan on 5/9/12.
//


@implementation NSArray (Extension)

- (id)objectAtIndexedSubscript:(NSInteger)index {
		return [self at:index];
}

- (id)at:(NSInteger)index {
		if (index < self.count) return [self objectAtIndex:index];
		return nil;
}

- (BOOL)empty {
		return self.count == 0;
}

@end