//
//  Created by Rene Dohan on 5/9/12.
//


#import <Foundation/Foundation.h>

@interface NSArray (Extension)

- (id)objectAtIndexedSubscript:(NSInteger)index;

-(id)objectIdenticalTo:(id)anObject;

-(BOOL)hasIdenticalTo:(id)anObject;

- (id)at:(NSInteger)index;

- (BOOL)empty;

- (id)last;
@end