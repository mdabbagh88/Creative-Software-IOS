//
//  Created by Rene Dohan on 5/14/12.
//


#import <Foundation/Foundation.h>


@interface Selector : NSObject
@property(nonatomic, assign) SEL selector;

@property(nonatomic, strong) NSObject *object;

- (id)run;

+ (Selector *)new:(SEL)selector :(NSObject *)object;

@end