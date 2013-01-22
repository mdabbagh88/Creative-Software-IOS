//
//  Created by Rene Dohan on 6/11/12.
//


#import <Foundation/Foundation.h>

@interface UITableView (Extension)

- (void)scrollToTop;

- (id)dequeueReusableCell:(NSString *)identifier;

- (void)hideEmptyCellSplitterBySettingEmptyFooter;
@end