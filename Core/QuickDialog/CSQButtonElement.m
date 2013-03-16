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

+ (CSQButtonElement *)createWithTitle:(QSection *)section :(NSString *)title :(void (^)(UITableViewCell *, CSQButtonElement *))onSelected {
    CSQButtonElement *element = [CSQButtonElement.alloc initWithTitle:title];
    element.onCellSelected = onSelected;
    [section addElement:element];
    return element;
}

@end