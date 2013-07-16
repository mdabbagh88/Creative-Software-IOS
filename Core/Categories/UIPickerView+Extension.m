//
//  Created by Rene Dohan on 10/22/12.
//


@implementation UIPickerView (Extension)

- (void)selectRow:(int)row {
    [self selectRow:row inComponent:0 animated:YES];
}

- (UILabel *)createCenteredLabel:(NSString *)text height:(int)height {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, height)];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.text = text;
    return label;
}

@end