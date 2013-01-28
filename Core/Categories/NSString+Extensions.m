//
//  Created by Rene Dohan on 4/29/12.
//


#import "NSString+Extensions.h"


@implementation NSString (Extensions)

- (NSString *)add:(NSObject *)first {
		if (first)
				return [self stringByAppendingString:first.description];
		return self;
}

- (NSString *)clearLast:(NSInteger)count {
		return [self substringToIndex:self.length - count];
}

- (NSString *)replace:(NSString *)string :(NSString *)replacement {
		return [self stringByReplacingOccurrencesOfString:string withString:replacement];
}

- (NSString *)add:(NSObject *)first :(NSObject *)second {
		return [[self add:first] add:second];
}

- (NSString *)add:(NSObject *)first :(NSObject *)second :(NSObject *)third {
		return [[[self add:first] add:second] add:third];
}

- (NSString *)add:(NSObject *)first :(NSObject *)second :(NSObject *)third :(NSObject *)fourth {
		return [[[[self add:first] add:second] add:third] add:fourth];
}

- (NSString *)add:(NSObject *)first :(NSObject *)second :(NSObject *)third :(NSObject *)fourth :(NSObject *)fifth {
		return [[[[[self add:first] add:second] add:third] add:fourth] add:fifth];
}

- (NSString *)add:(NSObject *)first :(NSObject *)second :(NSObject *)third :(NSObject *)fourth :(NSObject *)fifth :(NSObject *)sixth {
		return [[[[[[self add:first] add:second] add:third] add:fourth] add:fifth] add:sixth];
}

+ (NSString *)from:(NSObject *)value {
		return [NSString stringWithFormat:@"%@", value];
}

+ (NSString *)fromInt:(int)value {
		return [NSString stringWithFormat:@"%i", value];
}

+ (NSString *)fromDbl:(double)value {
		return [NSString stringWithFormat:@"%f", value];
}

+ (NSString *)fromBool:(BOOL)value {
		return [NSString stringWithFormat:@" %s", value ? "true" : "false"];
}

- (BOOL)contains:(NSString *)string {
		return [self rangeOfString:string].location != NSNotFound;
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


@end