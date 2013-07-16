//
// Created by inno on 2/19/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CSImageElement.h"
#import "QImageTableViewCell.h"
#import "UIButton+MKNetworkKitExtension.h"
#import "CSAlertView.h"
#import "UIImage+Extension.h"

@implementation CSImageElement {
    CSAlertView *_alert;
}

- (id)initWithTitle:(NSString *)title url:(NSURL *)url {
    if (self = [super initWithTitle:title detailImage:nil]) {
        self.imageURL = url;
    }
    return self;
}

- (void)presentImagePicker:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller path:(NSIndexPath *)path {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        _alert = [CSAlertView.new show:@"Select Image" :@"" :@"Capture" :^{
            self.source = UIImagePickerControllerSourceTypeCamera;
            [super presentImagePicker:tableView controller:controller path:path];
        } :@"From gallery" :^{
            self.source = UIImagePickerControllerSourceTypePhotoLibrary;
            [super presentImagePicker:tableView controller:controller path:path];
        }];
    } else [super presentImagePicker:tableView controller:controller path:path];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
   [super imagePickerController:picker didFinishPickingMediaWithInfo:info];
    self.imageValue = [self.imageValue scaleAndRotateFromCamera:640];
    runWith(self.onValueChanged, self);
}

- (UITableViewCell *)getCellForTableView:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller {
    QImageTableViewCell *cell = (QImageTableViewCell *) [super getCellForTableView:tableView controller:controller];
    cell.imageViewButton.userInteractionEnabled = NO;
    cell.imageViewButton.backgroundImageWithURL = self.imageURL;
    cell.imageViewButton.contentMode = UIViewContentModeScaleAspectFit;
    return cell;
}

@end