//
// Created by inno on 1/28/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "UIButton+Extension.h"

@implementation UIButton (Extension)

- (void)stretchableBackgroundImageWithLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight {
    [self setBackgroundImage:[[self backgroundImageForState:UIControlStateNormal] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight] forState:UIControlStateNormal];
    [self setBackgroundImage:[[self backgroundImageForState:UIControlStateSelected] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight] forState:UIControlStateSelected];
    [self setBackgroundImage:[[self backgroundImageForState:UIControlStateDisabled] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight] forState:UIControlStateDisabled];
    [self setBackgroundImage:[[self backgroundImageForState:UIControlStateHighlighted] stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight] forState:UIControlStateHighlighted];
}

- (void)setTitleColor:(UIColor *)color {
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:color forState:UIControlStateHighlighted];
    [self setTitleColor:color forState:UIControlStateDisabled];
    [self setTitleColor:color forState:UIControlStateSelected];
}

- (void)setText:(NSString *)text {
    [self setTitle:text forState:UIControlStateNormal];
}

- (NSString *)text {
    return [self titleForState:UIControlStateNormal];
}

- (void)setImage:(UIImage *)image {
    [self setImage:image forState:UIControlStateNormal];
}
@end