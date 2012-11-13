//
//  SettingsController.m


#import "MBProgressHUD.h"
#import "iToast.h"
#import "Lang.h"
#import "DDLog.h"

@implementation Lang

void showProgress(UIView *view) {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.margin = 17;
}

void hideProgress(UIView *view) {
    [MBProgressHUD hideHUDForView:view animated:YES];
}

void showMessage(NSString *string) {
    [[iToast makeText:string] show];
}

void run(void (^block)()) {
    if (block)block();
}

void runWith(void (^block)(id), id value) {
    if (block)block(value);
}

@end


//BACKGROUND TASK
//NSTimeInterval delay_in_seconds = 3.0;
//dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, delay_in_seconds * NSEC_PER_SEC);
//dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//
//UIImageView *imageView = tableViewCell.imageView;
//
//dispatch_after(delay, queue, ^{
//    // perform your background tasks here. It's a block, so variables available in the calling method can be referenced here.
//
//    UIImage *image = [self drawComplicatedImage];
//
//    // now dispatch a new block on the main thread, to update our UI
//    dispatch_async(dispatch_get_main_queue(), ^{
//
//      imageView.image = image;
//
//    });
//});