//
//  Created by Rene Dohan on 1/11/13.
//


#import <Foundation/Foundation.h>

@class Response;

@interface TableLoader : NSObject

@property(nonatomic, strong, readonly) UITableView *table;

@property(nonatomic, copy) Response *(^onLoad)(BOOL userRefresh);

@property(nonatomic, copy) Response *(^onLoadNext)();

@property(nonatomic, strong) UIView *emptyLabel;

@property(nonatomic, strong) NSMutableArray *data;

@property(nonatomic, copy) BOOL (^onUserRefresh)();

- (TableLoader *)from:(UITableView *)table:(UIView *)loadNextIndicator :(NSMutableArray *)data;

- (void)onReloadSuccess:(NSArray *)array;

- (void)onLoadSuccess:(NSArray *)array;

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

- (Response *)load;

- (void)updateEmpty;

- (void)viewWillAppear;

- (void)addItem:(id)dog;

- (void)insertItem:(id)item :(int)index;

- (void)removeItem:(id)item;

- (void)removeItemAtIndex:(NSUInteger)i;

- (void)cancelUserRefresh;
@end