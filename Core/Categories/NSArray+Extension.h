//
//  Created by Rene Dohan on 5/9/12.
//

#import <Foundation/Foundation.h>

@interface NSArray (Extension)

- (id)objectAtIndexedSubscript:(NSUInteger)index;

- (id)objectAs:(id)anObject;

- (BOOL)hasAs:(id)anObject;

- (id)at:(NSInteger)index;

- (BOOL)empty;

- (id)last;

- (int)lastIndex;
@end