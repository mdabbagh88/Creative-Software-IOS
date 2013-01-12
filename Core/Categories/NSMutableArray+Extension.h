//
//  Created by Rene Dohan on 6/5/12.
//


#import <Foundation/Foundation.h>

@interface NSMutableArray (Extension)

- (void)setObject:(id)thing atIndexedSubscript:(NSInteger)index;

- (void)replaceFromArray:(NSArray *)array;

@end