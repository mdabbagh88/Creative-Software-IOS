//
//  Created by Rene Dohan on 1/9/13.
//


#import "EGORefreshTableHeaderView+Extension.h"


@implementation EGORefreshTableHeaderView (Extension)

+ (EGORefreshTableHeaderView *)from:(UITableView *)tableView:(id <EGORefreshTableHeaderDelegate>)delegate {
		EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:
				CGRectMake(0, 0 - tableView.height, tableView.width, tableView.height)];
		view.delegate = delegate;
		return view;
}

+ (EGORefreshTableHeaderView *)from:(UIScrollView *)tableView :(UIColor *)color :(id <EGORefreshTableHeaderDelegate>)delegate {
		EGORefreshTableHeaderView *view =
				[[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, 0 - tableView.height, tableView.width, tableView.height)
				                                  arrowImageName:@"blueArrow.png" textColor:color];
		view.delegate = delegate;
		[tableView addSubview:view];
		return view;
}


@end