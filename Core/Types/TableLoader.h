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

@property(nonatomic, strong) UILabel *emptyLabel;

- (TableLoader *)from:(UITableView *)table:(UIView *)loadNextIndicator :(NSMutableArray *)data;

- (void)onReloadSuccess:(NSArray *)array;

- (void)onLoadSuccess:(NSArray *)array;

- (void)reload;

- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

-(void)updateEmpty;

- (void)scrollViewDidScroll:(UIScrollView *)view;

- (void)scrollViewDidEndDragging:(UIScrollView *)view willDecelerate:(BOOL)decelerate;

- (void)viewWillAppear;

- (void)addItem:(id)dog;

-(void)insertItem:(id)item :(int)index;

-(void)removeItem:(id)item;
@end