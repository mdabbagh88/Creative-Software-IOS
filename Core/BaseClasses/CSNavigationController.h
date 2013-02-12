//
//  Created by Rene Dohan on 10/26/12.
//


#import <Foundation/Foundation.h>


@interface CSNavigationController : UINavigationController {

}

@property(readonly) UIViewController *popped;

@property (nonatomic,strong, readonly)CSNavigationController *instance;
@end