//
//  Created by Rene Dohan on 1/11/13.
//


#import <Foundation/Foundation.h>
#import "PullToRefreshView.h"

@class PullToRefreshView;
@class CSPullToRefreshView;

@interface TableLoader : NSObject <PullToRefreshViewDelegate> {

}

@property(nonatomic, strong, readonly) CSPullToRefreshView *refreshHeaderView;

@property(nonatomic, strong, readonly) UITableView *table;

@property(nonatomic, copy) Response *(^onReload)();

@property(nonatomic, copy) Response *(^onLoadNext)();

@property(nonatomic, strong) UIView *emptyLabel;

@property(nonatomic, strong) NSMutableArray *data;


- (TableLoader *)from:(UITableView *)table:(UIView *)loadNextIndicator :(NSMutableArray *)data;

- (void)onReloadSuccess:(NSArray *)array;

- (void)onLoadSuccess:(NSArray *)array;

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)reload;

- (void)updateEmpty;

- (void)viewWillAppear;

- (void)addItem:(id)dog;

- (void)insertItem:(id)item :(int)index;

- (void)removeItem:(id)item;

- (void)removeItemAtIndex:(NSUInteger)i;
@end