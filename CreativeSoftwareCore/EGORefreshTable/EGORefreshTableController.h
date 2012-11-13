//
//  Created by Rene Dohan on 6/11/12.
//


#import <Foundation/Foundation.h>
#import "EGORefreshTableHeaderView.h"
#import "ViewController.h"


@interface EGORefreshTableController : ViewController <UITableViewDelegate, UITableViewDataSource,
        EGORefreshTableHeaderDelegate> {
    NSMutableArray *_data;
}

@property(strong, readonly) EGORefreshTableHeaderView *refreshHeader;
@property(strong) IBOutlet UITableView *table;
@property(strong) IBOutlet UIView *loadNextIndicatorView;
@property(strong) NSMutableArray *data;

- (void)_reload;

- (void)_onReloadDone;

- (void)_loadNext;

- (void)_onLoadNextDone;

- (void)_onReloadSuccess:(NSArray *)data;

- (void)_onLoadSuccess:(NSArray *)data;

@end