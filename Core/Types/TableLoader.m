//
//  Created by Rene Dohan on 1/11/13.
//


#import "TableLoader.h"
#import "Response.h"

@implementation TableLoader {
    UIView *_loadNextIndicator;
    NSMutableArray *_data;
    BOOL _noNext;
    BOOL _loading;
}

- (TableLoader *)from:(UITableView *)table :(UIView *)loadNextIndicator :(NSMutableArray *)data {
    _table = table;
    _table.visible = NO;
    _loadNextIndicator = loadNextIndicator;
    _loadNextIndicator.hidden = YES;
    _data = data;
    return self;
}

- (void)setRefreshHeaderView:(EGORefreshTableHeaderView *)refreshHeaderView {
    _refreshHeaderView = refreshHeaderView;
    _refreshHeaderView.delegate = self;
}

- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self shouldLoadNext:indexPath]) [self loadNext];
}

- (void)loadNext {
    [_loadNextIndicator fadeIn];
    _loading = YES;
    self.onLoadNext().onDone = ^{
        [self onDone];
        [_loadNextIndicator fadeOut];
    };
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view {
    return _loading;
}

- (BOOL)shouldLoadNext:(NSIndexPath *)indexPath {
    if (_loading)return NO;
    return !_noNext && indexPath.row > _data.count - 5;
}

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view {
    [self reload];
}

- (void)reload {
    _noNext = NO;
    _loading = YES;
    Response *response = self.onReload();
    if (_table.hidden) [_table.superview showProgress:response];
    response.onDone = ^{
        [self onDone];
    };
}

- (void)onDone {
    _loading = NO;
    [self updateEmpty];
    [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:_table];
}

- (void)updateEmpty {
    _emptyLabel.visible = _data.empty;
    if (_data.count) {
        _table.backgroundColor = [UIColor whiteColor];
        [_table fadeIn];
    }
    else
        [_table fadeOut:0.5 :^{
            _table.backgroundColor = [UIColor clearColor];
            [_table setHidden:NO];
        }];
}

- (void)scrollViewDidScroll:(UIScrollView *)view {
    [_refreshHeaderView egoRefreshScrollViewDidScroll:view];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)view willDecelerate:(BOOL)decelerate {
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:view];
}

- (void)onReloadSuccess:(NSArray *)array {
    [_data replaceFromArray:array];
    [self onLoadSuccess:array];
}

- (void)onLoadSuccess:(NSArray *)array {
    _noNext = array.count == 0;
    [_table reloadData];
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
    [_data insertObject:item atIndex:index];
    [_table reloadData];
    [self updateEmpty];
}

- (void)removeItem:(id)item {
    [_data removeObject:item];
    [_table reloadData];
    [self updateEmpty];
}
@end