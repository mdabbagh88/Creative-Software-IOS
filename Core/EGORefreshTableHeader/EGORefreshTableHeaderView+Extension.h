//
//  Created by Rene Dohan on 1/9/13.
//


#import <Foundation/Foundation.h>
#import "EGORefreshTableHeaderView.h"

@interface EGORefreshTableHeaderView (Extension)

+ (EGORefreshTableHeaderView *)from:(UIScrollView *)tableView:(id <EGORefreshTableHeaderDelegate>)delegate;

+ (EGORefreshTableHeaderView *)from:(UIScrollView *)tableView:(UIColor *)color :(id <EGORefreshTableHeaderDelegate>)delegate;

@end