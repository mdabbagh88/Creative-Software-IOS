//
//  Created by Rene Dohan on 1/15/13.
//


#import <Foundation/Foundation.h>
#import "QuickDialogController.h"
#import "CSImageElement.h"
#import "QuickDialogEntryElementDelegate.h"

@class CSQButtonElement;
@class QDateTimeInlineElement;
@class QDateTimeElement;
@class QPickerElement;

@interface QuickDialogController (Extension)<QuickDialogEntryElementDelegate>

- (UIViewController *)createUI;

- (CSImageElement *)addImage:(QSection *)section :(NSString *)title :(float)height :(NSURL *)url :(UIImage *)placeholder :(void (^)(QImageElement *))onValueChange;

- (CSQButtonElement *)addImage:(QSection *)section :(NSString *)title :(float)height :(NSURL *)url :(void (^)(QImageElement *))onValueChange;

- (QEntryElement *)addLine:(QSection *)section :(NSString *)title :(NSString *)value :(NSString *)placeholder :(void (^)(QEntryElement *))onChange;

- (QEntryElement *)addMultiLine:(QSection *)section :(NSString *)title :(NSString *)value :(NSString *)placeholder :(void (^)(QEntryElement *))onValueChange;

- (QBooleanElement *)addBoolean:(QSection *)section :(NSString *)title :(BOOL)value :(void (^)(QBooleanElement *))onValueChange;

- (QDateTimeInlineElement *)addDateTime:(QSection *)section :(UIDatePickerMode)mode :(NSString *)title :(NSDate *)date :(void (^)(QDateTimeElement *))onValueChange;

- (QPickerElement *)addPicker:(QSection *)section :(NSString *)title :(NSArray *)items :(NSString *)value :(void (^)(QPickerElement *))onChange;

@end