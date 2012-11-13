//
//  Created by Rene Dohan on 6/11/12.
//


#import "EGORefreshTableController.h"


@implementation EGORefreshTableController {
    BOOL _reloading;
    BOOL _noNext;
    EGORefreshTableHeaderView *_refreshHeaderView;
}

@synthesize table, loadNextIndicatorView, data = _data;

- (EGORefreshTableHeaderView *)refreshHeader {
    return _refreshHeaderView;
}

- (void)_createRefreshHeaderView {
    _refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, 0 - table.height,
            table.width, table.height)];
    _refreshHeaderView.delegate = self;
    [table addSubview:_refreshHeaderView];
    [_refreshHeaderView refreshLastUpdatedDate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _createRefreshHeaderView];
    [loadNextIndicatorView setHidden:YES];
    showProgress(table.superview);
    [table setHidden:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self _reload];
}

- (void)_reload {
    _reloading = YES;
}

- (void)_loadNext {
    loadNextIndicatorView.hidden = NO;
}

- (void)_onLoadNextDone {
    loadNextIndicatorView.hidden = YES;
}

- (void)_onReloadDone {
    hideProgress(table.superview);
    [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:table];
    if (table.hidden) [table fadeIn];
    _reloading = NO;
}

- (void)_onReloadSuccess:(NSArray *)data {
    _data = [NSMutableArray new];
    [self _onLoadSuccess:data];
}

- (void)_onLoadSuccess:(NSArray *)data {
    _noNext = data.count == 0;
    if (data.count > 0) {
        [_data addObjectsFromArray:data];
        [table reloadData];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_data count];
}

- (BOOL)shouldLoadNextRow:(NSIndexPath *)indexPath {
    return !_noNext && indexPath.row > _data.count - 5 && [loadNextIndicatorView isHidden];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self shouldLoadNextRow:indexPath]) [self _loadNext];
    return nil;
}

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view {
    [self _reload];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view {
    return _reloading;
}

@end