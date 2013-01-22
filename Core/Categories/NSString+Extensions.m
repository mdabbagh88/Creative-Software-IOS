//
//  Created by Rene Dohan on 4/29/12.
//


#import "NSString+Extensions.h"


@implementation NSString (Extensions)

- (NSString *)add:(NSString *)first {
		if (first)
				return [self stringByAppendingString:first];
		return self;
}

- (NSString *)clearLast:(NSInteger)count {
		return [self substringToIndex:self.length - count];
}

- (NSString *)replace:(NSString *)string :(NSString *)replacement {
		return [self stringByReplacingOccurrencesOfString:string withString:replacement];
}

- (NSString *)add:(NSString *)first :(NSString *)second {
		return [[self add:first] add:second];
}

- (NSString *)add:(NSString *)first :(NSString *)second :(NSString *)third {
		return [[[self add:first] add:second] add:third];
}

- (NSString *)add:(NSString *)first :(NSString *)second :(NSString *)third :(NSString *)fourth {
		return [[[[self add:first] add:second] add:third] add:fourth];
}

- (NSString *)add:(NSString *)first :(NSString *)second :(NSString *)third :(NSString *)fourth :(NSString *)fifth {
		return [[[[[self add:first] add:second] add:third] add:fourth] add:fifth];
}

- (NSString *)add:(NSString *)first :(NSString *)second :(NSString *)third :(NSString *)fourth :(NSString *)fifth :(NSString *)sixth {
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