//
//  Created by Rene Dohan on 4/29/12.
//


#import <Foundation/Foundation.h>

@interface NSString (Extensions)

- (NSString *)add:(NSString *)first;

- (NSString *)add:(NSString *)first :(NSString *)second;

- (NSString *)add:(NSString *)first :(NSString *)second :(NSString *)third;

- (NSString *)add:(NSString *)first :(NSString *)second :(NSString *)third :(NSString *)fourth;

- (NSString *)add:(NSString *)first :(NSString *)second :(NSString *)third :(NSString *)fourth :(NSString *)fifth;

- (NSString *)add:(NSString *)first :(NSString *)second :(NSString *)third :(NSString *)fourth :(NSString *)fifth :(NSString *)sixth;

+ (NSString *)from:(NSObject *)value;

+ (NSString *)fromInt:(int)value;

+ (NSString *)fromBool:(BOOL)value;

+ (NSString *)fromDbl:(double)value;

- (NSString *)clearLast:(NSInteger)count;

- (BOOL)set;

- (BOOL)empty;

- (NSString *)trim;

- (BOOL)contains:(NSString *)string;

- (NSString *)replace:(NSString *)string :(NSString *)replacement;
@end