//
//  Created by Rene Dohan on 1/10/13.
//


#import <Foundation/Foundation.h>

@interface NSDateFormatter (Extension)

+ (NSString *)format:(NSDate *)date :(NSString *)format;

+ (NSDateFormatter *)create:(NSString *)format;

@end