//
//  Created by Rene Dohan on 5/7/12.
//


#import "NSUserDefaults+Extension.h"


@implementation NSUserDefaults (Extension)

+ (void)save:(NSString *)key :(id)object {
		[[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
}

+ (void)clear:(NSString *)key {
		[[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
}

+ (id)load:(NSString *)key {
		return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

@end