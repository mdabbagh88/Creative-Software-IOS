//
//  Created by Rene Dohan on 1/10/13.
//


#import <Foundation/Foundation.h>

@interface NSDateFormatter (Extension)

+ (NSString *)format:(NSDate *)date :(NSString *)format;

+ (NSString *)format:(NSDate *)date;

+ (NSDate *)load:(NSString *)date;

+ (NSDateFormatter *)create:(NSString *)format;

+ (NSDateFormatter *)create;

- (NSString *)now;
@end