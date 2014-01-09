//
//  Created by Rene Dohan on 1/11/13.
//


#import "TableLoader.h"
#import "Response.h"

@implementation TableLoader {
    UIView *_loadNextIndicator;
    BOOL _noNext;
    BOOL _loading;
    UIRefreshControl *_refreshControl;
}

- (TableLoader *)from:(UITableView *)table :(UIView *)loadNextIndicator :(NSMutableArray *)data {
    _table = table;
    _loadNextIndicator = loadNextIndicator;
    _loadNextIndicator.hidden = YES;
    _data = data;
    [_table addSubview:_refreshControl = UIRefreshControl.alloc.init];
    [_refreshControl addTarget:self action:@selector(onRefreshControlInvoke) forControlEvents:UIControlEventValueChanged];
    return self;
}

- (void)loadNext {
    if (_loading)return;
    _loading = YES;
    [_loadNextIndicator fadeIn];
    _onLoadNext().onDone = ^{
        [self onDone];
        [_loadNextIndicator fadeOut];
    };
}

- (BOOL)shouldLoadNext:(NSIndexPath *)indexPath {
    if (_loading)return NO;
    return !_noNext && indexPath.row >= _data.count - 5;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self shouldLoadNext:indexPath]) [self loadNext];
}

- (void)onRefreshControlInvoke {
    if (self.onUserRefresh) {
        if (self.onUserRefresh())[self load:YES];
    } else [self load:YES];
}

- (Response *)load {
    return [self load:NO];
}

- (Response *)load:(BOOL)fromRefreshControl {
    self.emptyLabel.visible = NO;
    _noNext = NO;
    _loading = YES;
    Response *response = self.onLoad(fromRefreshControl);
    if (_table.hidden) [_table.superview showProgress:response];
    response.onDone = ^{
        [self onDone];
    };
    return response;
}

- (void)setEmptyLabel:(UIView *)emptyLabel {
    _emptyLabel = emptyLabel;
    _emptyLabel.visible = NO;
}

- (void)onDone {
    _loading = NO;
    [self updateEmpty];
    [self cancelUserRefresh];
    [_table fadeIn];
}

- (void)updateEmpty {
    _emptyLabel.fadeVisible = _data.empty;
    _emptyLabel.userInteractionEnabled = NO;
}

- (void)onReloadSuccess:(NSArray *)array {
    [_data replaceFromArray:array];
    _noNext = array.count == 0;
    [_table reloadData];
}

- (void)onLoadSuccess:(NSArray *)array {
    [self updateEmpty];
    _noNext = array.count == 0;
    if (_noNext)return;

    NSMutableArray *indexPaths = NSMutableArray.new;
    for (int i = 0; i < array.count; i++) [indexPaths addObject:[NSIndexPath indexPathForRow:i + _data.count inSection:0]];

    [_data addObjectsFromArray:array];
    [_table beginUpdates];
    [_table insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    [_table endUpdates];
}

- (void)viewWillAppear {
    [_table deselectRowAtIndexPath:_table.indexPathForSelectedRow animated:YES];
    [_table reloadData];
}

- (void)addItem:(id)item {
    [_data addObject:item];
    [_table reloadData];
    [self updateEmpty];
}

- (void)insertItem:(id)item :(int)index {
    [_data insertObject:item atIndex:(uint) index];
    [_table reloadData];
    [self updateEmpty];
}

- (void)removeItem:(id)item {
    [_data removeObject:item];
    [_table reloadData];
    [self updateEmpty];
}

- (void)removeItemAtIndex:(NSUInteger)index {
    [_data removeObjectAtIndex:index];
    [_table reloadData];
    [self updateEmpty];
}

- (void)cancelUserRefresh {
    [_refreshControl endRefreshing];
}
@end