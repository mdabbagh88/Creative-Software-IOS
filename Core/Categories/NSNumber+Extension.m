//
// Created by inno on 2/11/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSNumber+Extension.h"


@implementation NSNumber (Extension)

+ (NSNumber *)numberWithString:(NSString *)value {
    if (value)return [NSNumber numberWithInt:value.intValue];
    return nil;
}
@end