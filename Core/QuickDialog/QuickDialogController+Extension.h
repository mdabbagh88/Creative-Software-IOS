//
//  Created by Rene Dohan on 1/15/13.
//


#import <Foundation/Foundation.h>
#import "QuickDialogController.h"

@class CSQButtonElement;

@interface QuickDialogController (Extension)<QuickDialogEntryElementDelegate>

- (UIViewController *)createUI;

- (CSQButtonElement *)addImage:(QSection *)section :(NSString *)title :(int)height :(NSURL *)url :(void (^)(QImageElement *))onValueChange;

- (QEntryElement *)addLine:(QSection *)section :(NSString *)title :(NSString *)value :(NSString *)placeholder :(void (^)(QEntryElement *))onChange;

- (QEntryElement *)addMultiLine:(QSection *)section :(NSString *)title :(NSString *)value :(NSString *)placeholder :(void (^)(QEntryElement *))onValueChange;

- (QDateTimeInlineElement *)addDateTime:(QSection *)section :(UIDatePickerMode)mode :(NSString *)title :(NSDate *)date :(void (^)(QDateTimeElement *))onValueChange;

- (QPickerElement *)addPicker:(QSection *)section :(NSString *)title :(NSArray *)items :(NSString *)value :(void (^)(QPickerElement *))onChange;

@end