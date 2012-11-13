//
//  Created by Rene Dohan on 4/29/12.
//


#import <Foundation/Foundation.h>

@interface NSDictionary (Extension)

+ (id)put:(id)key :(id)object;

+ (id)put:(id)key1 :(id)object1 put:(id)key2 :(id)object2;

+ (id)put:(id)key1 :(id)object1 put:(id)key2 :(id)object2 put:(id)key3 :(id)object3;

+ (id)put:(id)key1 :(id)object1 put:(id)key2 :(id)object2 put:(id)key3 :(id)object3 put:(id)key4 :(id)object4;

- (id)at:(int)index;

- (id)get:(NSString *)key;

- (id)first;

- (id)last;

- (id)objectForKeyedSubscript:(NSString *)key;

- (id)objectAtIndexedSubscript:(NSInteger)index;

@end