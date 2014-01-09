//
// Created by Rene Dohan on 18/12/13.
// Copyright (c) 2013 creative_studio. All rights reserved.
//


#import "NSDate+Extension.h"


@implementation NSDate (Extension)

- (NSDate *)addYear:(int)years {
    NSDateComponents *dateComponents = NSDateComponents.new;
    dateComponents.year = years;
    return [NSCalendar.currentCalendar dateByAddingComponents:dateComponents toDate:self options:0];
}

@end