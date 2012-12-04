//
//  Created by Rene Dohan on 6/5/12.
//


@implementation NSMutableArray (Extension)

- (void)setObject:(id)thing atIndexedSubscript:(NSInteger)index {
    [self replaceObjectAtIndex:index withObject:thing];
}

@end