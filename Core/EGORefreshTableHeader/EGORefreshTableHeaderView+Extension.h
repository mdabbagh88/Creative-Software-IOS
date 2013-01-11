//
//  Created by Rene Dohan on 1/9/13.
//


#import <Foundation/Foundation.h>
#import "EGORefreshTableHeaderView.h"

@interface EGORefreshTableHeaderView (Extension)

+ (EGORefreshTableHeaderView *)from:(UITableView *)tableView:(id <EGORefreshTableHeaderDelegate>)delegate;

+ (EGORefreshTableHeaderView *)from:(UITableView *)tableView:(UIColor *)color :(id <EGORefreshTableHeaderDelegate>)delegate;

@end