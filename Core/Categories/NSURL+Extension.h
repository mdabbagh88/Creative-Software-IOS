//
//  Created by Rene Dohan on 12/19/12.
//


#import <Foundation/Foundation.h>

@interface NSURL (Extension)

+(NSString *)createParamsString:(NSDictionary *)dictionary;

- (BOOL)validate;

- (NSURL *)URLByAppending :(NSString *)path;

- (NSString *)parseBaseURL;
@end