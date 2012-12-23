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

- (NSString *)add:(NSString *)first :(NSString *)second {
		return [[self add:first] add:second];
}

- (NSString *)append:(NSString *)first :(NSString *)second :(NSString *)third {
		return [[[self add:first] add:second] add:third];
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

- (BOOL)isSet {
		return self.length != 0;
}

- (BOOL)empty {
		return self.length == 0;
}

- (NSString *)trim {
		return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


@end