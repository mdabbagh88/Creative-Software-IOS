//
//  Created by Rene Dohan on 6/11/12.
//


#import "UITableView+Extension.h"


@implementation UITableView (Extension)

- (void)scrollToTop {
    [self scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
}

- (id)dequeueOrCreateCell:(Class)class {
    id object = [self dequeueReusableCellWithIdentifier:[class description]];
    if (!object) object = [class create];
    return object;
}

- (id)dequeueReusableCell:(NSString *)identifier {
    return [self dequeueReusableCellWithIdentifier:identifier];
}

- (void)hideEmptyCellSplitterBySettingEmptyFooter {
    [self setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
}

@end