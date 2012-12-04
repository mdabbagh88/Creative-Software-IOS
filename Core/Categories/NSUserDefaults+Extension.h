//
//  Created by Rene Dohan on 5/7/12.
//


#import <Foundation/Foundation.h>

@interface NSUserDefaults (Extension)

+ (void)save:(NSString *)key :(id)object;

+ (id)load:(NSString *)key;

@end