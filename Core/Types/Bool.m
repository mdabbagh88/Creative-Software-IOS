//
//  Created by Rene Dohan on 5/12/12.
//


#import "Bool.h"

@interface Bool ()
@property NSNumber *number;
@end

@implementation Bool

@synthesize number;

+ (Bool *)new:(BOOL)value {
    Bool *this = [self new];
    this.number = [NSNumber numberWithBool:value];
    return this;
}

- (BOOL)value {
    return [number boolValue];
}

@end