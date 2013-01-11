//
//  Created by Rene Dohan on 1/10/13.
//


#import "NSDateFormatter+Extension.h"


@implementation NSDateFormatter (Extension)

+ (NSString *)format:(NSDate *)date :(NSString *)format {
		return [[NSDateFormatter create:format] stringFromDate:date];
}

+(NSDateFormatter *) create:(NSString *)format{
		NSDateFormatter *formater = [NSDateFormatter new];
		formater.dateFormat = format;
		return  formater;
}

@end