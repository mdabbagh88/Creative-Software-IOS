//
//  Created by Rene Dohan on 4/29/12.
//


@implementation NSDictionary (Extension)

- (id)at:(int)index {
    NSArray *values = [self allValues];
    if ([values count] > index)return [values objectAtIndex:index];
    return nil;
}

+ (id)put:(id)key :(id)object {
    return [self dictionaryWithObject:object forKey:key];
}

+ (id)put:(id)key1 :(id)object1 put:(id)key2 :(id)object2 {
    return [self dictionaryWithObjects:[NSArray arrayWithObjects:object1, object2, nil]
            forKeys:[NSArray arrayWithObjects:key1, key2, nil]];
}

+ (id)put:(id)key1 :(id)object1 put:(id)key2 :(id)object2 put:(id)key3 :(id)object3 {
    return [self dictionaryWithObjects:[NSArray arrayWithObjects:object1, object2, object3, nil]
            forKeys:[NSArray arrayWithObjects:key1, key2, key3, nil]];
}

+ (id)put:(id)key1 :(id)object1 put:(id)key2 :(id)object2 put:(id)key3 :(id)object3 put:(id)key4 :(id)object4 {
    return [self dictionaryWithObjects:[NSArray arrayWithObjects:object1, object2, object3, object4, nil]
            forKeys:[NSArray arrayWithObjects:key1, key2, key3, key4, nil]];
}

- (id)first {
    return [self at:0];
}

- (id)last {
    return [self at:[[self allValues] count] - 1];
}

- (id)objectAtIndexedSubscript:(NSInteger)index {
    return [self at:index];
}

- (id)objectForKeyedSubscript:(NSString *)key {
    return [self objectForKey:key];
}

- (id)get:(NSString *)key {
    return [self objectForKey:key];
}


@end