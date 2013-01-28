//
// Created by inno on 1/24/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CSQButtonElement.h"


@implementation CSQButtonElement {
}


- (void)selected:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller indexPath:(NSIndexPath *)indexPath {
    [super selected:tableView controller:controller indexPath:indexPath];
    if (self.enabled && _onCellSelected) _onCellSelected([tableView cellForRowAtIndexPath:indexPath], self);
}

@end