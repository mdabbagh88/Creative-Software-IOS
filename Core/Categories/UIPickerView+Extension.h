//
//  Created by Rene Dohan on 10/22/12.
//


#import <Foundation/Foundation.h>

@interface UIPickerView (Extension)

- (void)selectRow:(int)row;

- (UILabel *)createCenteredLabel:(NSString *)text height:(int)height;
@end