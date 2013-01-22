//
//  Created by Rene Dohan on 1/13/13.
//


#import <Foundation/Foundation.h>

@interface UIScrollView (Extension)

- (void)scrollToPage:(NSInteger)to of:(NSInteger)of;

- (void)sizeHeightToFit;

@end