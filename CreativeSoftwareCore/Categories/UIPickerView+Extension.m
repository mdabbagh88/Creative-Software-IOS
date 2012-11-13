//
//  Created by Rene Dohan on 10/22/12.
//


#import "UIPickerView+Extension.h"


@implementation UIPickerView (Extension)

- (void)selectRow:(int)row {
    [self selectRow:row inComponent:0 animated:YES];
}

@end