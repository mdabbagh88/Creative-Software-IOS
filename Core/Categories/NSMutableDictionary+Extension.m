//
//  Created by Rene Dohan on 5/3/12.
//


@implementation NSMutableDictionary (Extension)
- (void)setBool:(BOOL)value forKey:(NSString *)key {
    [self setValue:[NSNumber numberWithBool:value] forKey:key];
}

- (void)setObject:(id)thing forKeyedSubscript:(id)key {
    [self setObject:thing forKey:key];
}

- (void)put:(id)key :(id)value {
    if(!value) value = [NSNull null];
    [self setObject:value forKey:key];
}

@end