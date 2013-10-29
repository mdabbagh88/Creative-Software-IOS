//
//  Created by Rene Dohan on 12/26/12.
//


@implementation UIDevice (Extension)

+ (BOOL)orientationPortrait {
    UIDeviceOrientation orientation = UIDevice.currentDevice.orientation;
    if (orientation == UIDeviceOrientationUnknown) return UIScreen.mainScreen.bounds.size.width < UIScreen.mainScreen.bounds.size.height;
    return UIInterfaceOrientationIsPortrait(UIDevice.currentDevice.orientation);
}

+ (BOOL)iPhone {
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
}

+ (BOOL)iPad {
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

+ (float)systemVersion {
    return UIDevice.currentDevice.systemVersion.floatValue;
}

@end