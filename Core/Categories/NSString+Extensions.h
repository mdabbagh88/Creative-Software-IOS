//
//  Created by Rene Dohan on 4/29/12.
//


#import <Foundation/Foundation.h>

@interface NSString (Extensions)

- (NSString *)add:(NSObject *)first;

- (NSString *)add:(NSObject *)first :(NSObject *)second;

- (NSString *)add:(NSObject *)first :(NSObject *)second :(NSObject *)third;

- (NSString *)add:(NSObject *)first :(NSObject *)second :(NSObject *)third :(NSObject *)fourth;

- (NSString *)add:(NSObject *)first :(NSObject *)second :(NSObject *)third :(NSObject *)fourth :(NSObject *)fifth;

- (NSString *)add:(NSObject *)first :(NSObject *)second :(NSObject *)third :(NSObject *)fourth :(NSObject *)fifth :(NSObject *)sixth;

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