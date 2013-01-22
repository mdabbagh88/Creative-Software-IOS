//
//  Created by Rene Dohan on 5/9/12.
//


@implementation NSArray (Extension)

- (id)objectAtIndexedSubscript:(NSInteger)index {
    return [self at:index];
}

- (id)objectIdenticalTo:(id)anObject {
    NSUInteger index = [self indexOfObjectIdenticalTo:anObject];
    if (index != NSNotFound) return self[index];
    return nil;
}

- (BOOL)hasIdenticalTo:(id)anObject {
    return [self indexOfObjectIdenticalTo:anObject] != NSNotFound;
}

- (id)at:(NSInteger)index {
    if (index < self.count) return [self objectAtIndex:index];
    return nil;
}

- (BOOL)empty {
    return self.count == 0;
}

- (id)last {
    return [self at:self.count - 1];
}

@end