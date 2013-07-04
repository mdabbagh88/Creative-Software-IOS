//
// Created by inno on 1/24/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SelectImageView.h"
#import "UIControl+Extension.h"

@implementation SelectImageView {
    UIPopoverController *popover;
    UIPopoverController *_popover;
}

- (id)initWith:(UIViewController *)controller {
    self.visible = false;
    self.controller = controller;
    [self.fromCamera addTouchDown:self :@selector(onTakePictureTouch:)];
    [self.fromGallery addTouchDown:self :@selector(onFromGalleryPhotoTouch:)];
    [self addTouchDown:self :@selector(onBackgroundTouch)];
    return self;
}

- (UIButton *)fromGallery {
    return [self getView:2];
}

- (UIButton *)fromCamera {
    return [self getView:1];
}

- (void)onBackgroundTouch {
    [self hide];
}

- (void)onFromGalleryPhotoTouch:(UIButton *)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *picker = [UIImagePickerController new];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        _popover = [_controller presentModalInPopoverIfPossible:sender :picker];
    } else {
        [self showMessage:@"Library not available"];
    }
    [self hide];
}

- (void)onTakePictureTouch:(UIButton *)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker = [UIImagePickerController new];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [_controller presentModalViewController:picker animated:YES];
    } else {
        [self showMessage:@"Camera not available"];
    }
    [self hide];
}

- (void)hide {
    [self fadeOut:(CS_FADE_TIME) :^{
        [self removeFromSuperview];
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)data {
    if (_popover) [_popover dismissPopoverAnimated:YES];
    else [self.controller dismissModalViewControllerAnimated:YES];
    if (picker.allowsEditing == YES) _selectedImage = [data objectForKey:UIImagePickerControllerEditedImage];
    else _selectedImage = [data objectForKey:UIImagePickerControllerOriginalImage];
//    [self.statusImage setImage:[[data get:UIImagePickerControllerOriginalImage] scaleAndRotateFromCamera:640]];
    NSURL *referenceUrl = [data get:UIImagePickerControllerReferenceURL];
    _imageExtension = [[[referenceUrl absoluteString] componentsSeparatedByString:@"ext="] lastObject];
    runWith(self.onImageSelected, self);
}

- (void)show {
    [_controller.view.window addSubview:self];
    [self fadeIn];
}
@end