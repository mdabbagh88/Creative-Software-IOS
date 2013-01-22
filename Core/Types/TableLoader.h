//
//  Created by Rene Dohan on 1/11/13.
//


#import <Foundation/Foundation.h>
#import "EGORefreshTableHeaderView.h"

@interface TableLoader : NSObject <EGORefreshTableHeaderDelegate> {

}

@property(nonatomic, strong) EGORefreshTableHeaderView *refreshHeaderView;

@property(nonatomic, strong, readonly) UITableView *table;

@property(nonatomic, copy) Response *(^onReload)();

@property(nonatomic, copy) Response *(^onLoadNext)();

- (TableLoader *)from:(UITableView *)table:(UIView *)loadIndicator :(NSMutableArray *)data;

- (void)onReloadSuccess:(NSArray *)array;

- (void)onLoadSuccess:(NSArray *)array;

- (void)reload;

- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)scrollViewDidScroll:(UIScrollView *)view;

- (void)scrollViewDidEndDragging:(UIScrollView *)view willDecelerate:(BOOL)decelerate;

- (void)viewWillAppear;
@end