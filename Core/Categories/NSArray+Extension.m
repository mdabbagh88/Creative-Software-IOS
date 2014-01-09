//
//  Created by Rene Dohan on 5/9/12.
//


@implementation NSArray (Extension)

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self at:index];
}

- (id)objectAs:(id)anObject {
    NSUInteger index = [self indexOfObject:anObject];
    if (index != NSNotFound) return self[index];
    return nil;
}

- (BOOL)hasAs:(id)anObject {
    return [self indexOfObject:anObject] != NSNotFound;
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

- (int)lastIndex {
    return self.count - 1;
}

@end