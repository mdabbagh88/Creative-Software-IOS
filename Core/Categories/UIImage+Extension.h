//
//  Created by Rene Dohan on 10/14/12.
//


#import <Foundation/Foundation.h>

@interface UIImage (Extension)

+ (UIImage *)imageWithColor:(UIColor *)color;

- (UIImage *)scaleAndRotateFromCamera:(int)maxResolution;

-(UIImage *)scaleToWidth:(float)width;

-(UIImage *)scaleToHeight:(float)height;
@end