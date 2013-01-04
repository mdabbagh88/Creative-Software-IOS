//
//  Created by Rene Dohan on 12/30/12.
//


#import <Foundation/Foundation.h>


@interface Event : NSObject {
		NSMutableArray *_blockArray;
}

- (void)add:(void (^)(void))block;

- (void)run;

@end