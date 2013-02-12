//
//  Created by Rene Dohan on 1/15/13.
//


#import "QPickerElement+Extension.h"


@implementation QPickerElement (Extension)

- (id)selectedItem {
    return self.items[0][self.selectedIndex];
}

- (uint)selectedIndex {
    return [self.selectedIndexes[0] unsignedIntValue];
}

@end