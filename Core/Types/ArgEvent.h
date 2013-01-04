//
//  Created by Rene Dohan on 12/30/12.
//


#import <Foundation/Foundation.h>


@interface ArgEvent : NSObject {
		NSMutableArray *_blockArray;
}

- (void)run:(id)argument;

- (void)add:(void (^)(id))block;

@end