//
// Created by inno on 1/26/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CSImageButton.h"
#import "UIImageView+AFNetworking.h"


@implementation CSImageButton {

}

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    QTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuickformButtonElement"];
    if (cell == nil) {
        cell = [[QTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"QuickformButtonElement"];
    }
    [cell applyAppearanceForElement:self];
    __weak QTableViewCell *_cell = cell;
    [cell.imageView setImageWithURL:self.imageURL placeholderImage:cell.imageView.image
                            success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                [_cell layoutSubviews];
                            }];
    cell.textLabel.text = _title;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = self.appearance.labelFont;
    cell.textLabel.textColor = self.enabled ? self.appearance.actionColorEnabled : self.appearance.actionColorDisabled;
    cell.userInteractionEnabled = self.enabled;
    return cell;
}

@end