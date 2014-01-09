//
//  Created by Rene Dohan on 4/29/12.
//


@implementation NSString (Extensions)

static NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";


+ (NSString *)generateRandomStringOfLength:(int)len {
    NSMutableString *randomString = [NSMutableString stringWithCapacity:(NSUInteger) len];
    for (int i = 0; i < len; i++) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random() % [letters length]]];
    }
    return randomString;
}

- (NSString *)clearLast:(NSInteger)count {
    if (count > self.length)return self;
    return [self substringToIndex:self.length - count];
}

- (NSString *)replaceLast:(NSString *)string :(NSString *)replacement {
    return [self stringByReplacingCharactersInRange:[self rangeOfString:string options:NSBackwardsSearch] withString:replacement];
}

- (NSString *)replace:(NSString *)string :(NSString *)replacement {
    return [self stringByReplacingOccurrencesOfString:string withString:replacement];
}

- (NSString *)substringTo:(NSUInteger)to {
    if (to > self.length)return self;
    return [self substringToIndex:to];
}

- (NSString *)add:(NSObject *)first {
    if (!first)return self;
    NSString *description = first.description;
    if (description) return [self stringByAppendingString:description];
    return self;
}

- (NSString *)add:(NSObject *)first :(NSObject *)second {
    return [[self add:first] add:second];
}

- (NSString *)add:(NSObject *)first :(NSObject *)second :(NSObject *)third {
    return [[self add:first :second] add:third];
}

- (NSString *)add:(NSObject *)first :(NSObject *)second :(NSObject *)third :(NSObject *)fourth {
    return [[self add:first :second :third] add:fourth];
}

- (NSString *)add:(NSObject *)first :(NSObject *)second :(NSObject *)third :(NSObject *)fourth :(NSObject *)fifth {
    return [[self add:first :second :third :fourth] add:fifth];
}

- (NSString *)add:(NSObject *)first :(NSObject *)second :(NSObject *)third :(NSObject *)fourth :(NSObject *)fifth :(NSObject *)sixth {
    return [[self add:first :second :third :fourth :fifth] add:sixth];
}

- (NSString *)add:(NSObject *)first :(NSObject *)second :(NSObject *)third :(NSObject *)fourth :(NSObject *)fifth :(NSObject *)sixth :(NSObject *)seventh {
    return [[self add:first :second :third :fourth :fifth :sixth] add:seventh];
}

+ (NSString *)from:(NSObject *)value {
    return [NSString stringWithFormat:@"%@", value];
}

+ (NSString *)fromInt:(int)value {
    return [NSString stringWithFormat:@"%d", value];
}

+ (NSString *)fromDbl:(double)value {
    return [NSString stringWithFormat:@"%f", value];
}

+ (NSString *)fromBool:(BOOL)value {
    return [NSString stringWithFormat:@"%s", value ? "YES" : "NO"];
}

- (BOOL)contains:(NSString *)string {
    return [self rangeOfString:string].location != NSNotFound;
}

- (BOOL)containsCaseInsensitive:(NSString *)string {
    return [self rangeOfString:string options:NSCaseInsensitiveSearch].location != NSNotFound;
}

- (BOOL)set {
    return self.length != 0;
}

- (BOOL)empty {
    return self.length == 0;
}

- (NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


- (BOOL)equals:(NSString *)aString {
    return [self isEqualToString:aString];
}

+ (NSString *)stringWithFile:(NSString *)path {
    return [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
}

@end