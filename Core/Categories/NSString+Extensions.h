//
//  Created by Rene Dohan on 4/29/12.
//


#import <Foundation/Foundation.h>

@interface NSString (Extensions)

- (NSString *)substringTo:(NSUInteger)to;

- (NSString *)add:(NSObject *)first;

- (NSString *)add:(NSObject *)first :(NSObject *)second;

- (NSString *)add:(NSObject *)first :(NSObject *)second :(NSObject *)third;

- (NSString *)add:(NSObject *)first :(NSObject *)second :(NSObject *)third :(NSObject *)fourth;

- (NSString *)add:(NSObject *)first :(NSObject *)second :(NSObject *)third :(NSObject *)fourth :(NSObject *)fifth;

- (NSString *)add:(NSObject *)first :(NSObject *)second :(NSObject *)third :(NSObject *)fourth :(NSObject *)fifth :(NSObject *)sixth;

-(NSString *)add:(NSObject *)first :(NSObject *)second :(NSObject *)third :(NSObject *)fourth :(NSObject *)fifth :(NSObject *)sixth :(NSObject *)seventh;

+ (NSString *)from:(NSObject *)value;

+ (NSString *)fromInt:(int)value;

+ (NSString *)fromBool:(BOOL)value;

+ (NSString *)fromDbl:(double)value;

+ (NSString *)stringWithFile:(NSString *)path;

+ (NSString *)generateRandomStringOfLength:(int)len;

- (NSString *)clearLast:(NSInteger)count;

- (NSString *)replaceLast:(NSString *)string :(NSString *)replacement;

- (BOOL)set;

- (BOOL)empty;

- (NSString *)trim;

-(BOOL)equals:(NSString *)aString;

- (BOOL)contains:(NSString *)string;

- (BOOL)containsCaseInsensitive:(NSString *)string;

- (NSString *)replace:(NSString *)string :(NSString *)replacement;
@end