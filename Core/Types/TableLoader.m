//
//  Created by Rene Dohan on 1/11/13.
//


#import "TableLoader.h"
#import "Response.h"

@implementation TableLoader {
    UIView *_loadIndicator;
    NSMutableArray *_data;
    BOOL _noNext;
    BOOL _reloading;
}

- (TableLoader *)from:(UITableView *)table :(UIView *)loadIndicator :(NSMutableArray *)data {
    _table = table;
    _table.visible = NO;
    _loadIndicator = loadIndicator;
    _loadIndicator.hidden = YES;
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
    _loadIndicator.visible = YES;
    _reloading = YES;
    self.onLoadNext().onDone = ^{
        [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:_table];
        _reloading = NO;
        _loadIndicator.visible = NO;
    };
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view {
    return _reloading;
}

- (BOOL)shouldLoadNext:(NSIndexPath *)indexPath {
    if (_reloading)return NO;
    return !_noNext && indexPath.row > _data.count - 5 && _loadIndicator.hidden;
}

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view {
    [self reload];
}

- (void)reload {
    _noNext = NO;
    _reloading = YES;
    Response *response = self.onReload();
    if (_table.hidden) [_table.superview showProgress:response];
    response.onDone = ^{
        [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:_table];
        _reloading = NO;
        [_table fadeIn];
    };
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
    [((id) _table) reloadData];
}

- (void)viewWillAppear {
    [_table deselectRowAtIndexPath:_table.indexPathForSelectedRow animated:YES];
    [_table reloadData];
}
@end