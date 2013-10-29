//
//  Created by Rene Dohan on 12/26/12.
//


#import <Foundation/Foundation.h>

@interface UIDevice (Extension)

+ (BOOL)orientationPortrait;

+ (BOOL)iPhone;

+(BOOL)iPad;

+ (float)systemVersion;
@end