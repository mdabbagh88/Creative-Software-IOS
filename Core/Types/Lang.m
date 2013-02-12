//
//  SettingsController.m

@implementation Lang

void run(void (^block)()) {
    if (block)block();
}

void runWith(void (^block)(id), id value) {
    if (block)block(value);
}

void doLater(void (^block)(void), NSTimeInterval delay) {
    dispatch_queue_t currentQueue = dispatch_get_current_queue();
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC* delay),
            currentQueue == mainQueue ? currentQueue : mainQueue, block);
}

void doLaterWith(void (^block)(id), id value, NSTimeInterval delay) {
    doLater(^{
        runWith(block, value);
    }, delay);
}

void invoke(void (^block)(void)) {
    dispatch_queue_t currentQueue = dispatch_get_current_queue();
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_after(0.0f, currentQueue == mainQueue ? currentQueue : mainQueue, block);
}

void invokeWith(void (^block)(id), id value) {
    invoke(^{
        runWith(block, value);
    });
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