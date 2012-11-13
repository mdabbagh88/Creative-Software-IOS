//
//  Created by Rene Dohan on 5/3/12.
//


#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Extension)

- (void)setBool:(BOOL)value forKey:(NSString *)key;

- (void)setObject:(id)thing  forKeyedSubscript:(id)key;

- (void)put:(id)key :(id)value;
@end