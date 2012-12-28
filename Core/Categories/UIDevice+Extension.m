//
//  Created by Rene Dohan on 12/26/12.
//


#import "UIDevice+Extension.h"


@implementation UIDevice (Extension)

+ (BOOL)orientationPortraite {
		UIDeviceOrientation orientation = UIDevice.currentDevice.orientation;
		if (orientation == UIDeviceOrientationUnknown) return UIScreen.mainScreen.bounds.size.width < UIScreen.mainScreen.bounds.size.height;
		return UIInterfaceOrientationIsPortrait(UIDevice.currentDevice.orientation);
}

+ (BOOL)iphone {
		return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
}

@end