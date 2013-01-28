//
// Created by inno on 1/24/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface SelectImageView : UIControl <UIPopoverControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic,copy)void (^onImageSelected)(SelectImageView *);
@property (nonatomic,strong)UIViewController *controller;
@property (nonatomic,readonly)UIImage *selectedImage;

@property (nonatomic,strong)NSString * imageExtension;

- (id)initWith:(UIViewController *)controller;

-(UIButton *)fromGallery;

-(UIButton *)fromCamera;

- (void)show;
@end