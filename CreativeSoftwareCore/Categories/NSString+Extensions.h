//
//  Created by Rene Dohan on 4/29/12.
//


#import <Foundation/Foundation.h>

@interface NSString (Extensions)

- (NSString *)add:(NSString *)first;

- (NSString *)add:(NSString *)first :(NSString *)second;

+ (NSString *)from:(NSObject *)value;

+ (NSString *)fromInt:(int)value;

+ (NSString *)fromBool:(BOOL)value;

+ (NSString *)fromDbl:(double)value;

- (BOOL)isSet;

- (BOOL)empty;
@end