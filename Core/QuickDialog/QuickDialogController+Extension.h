//
//  Created by Rene Dohan on 1/15/13.
//


#import <Foundation/Foundation.h>

@class CSQButtonElement;

@interface QuickDialogController (Extension)

- (UIViewController *)createUI;

- (QEntryElement *)addEntry:(QSection *)section :(NSString *)title :(NSString *)value :(NSString *)placeholder :(void (^)(QEntryElement *))onChange;

- (QEntryElement *)addMultilineEntry:(QSection *)section :(NSString *)title :(NSString *)value :(NSString *)placeholder :(void (^)(QEntryElement *))onValueChange;

- (QMapElement *)addPosition:(QSection *)section :(NSString *)title :(CLLocationCoordinate2D)coordinate;

- (QDateTimeInlineElement *)addDateTime:(QSection *)section :(UIDatePickerMode)mode :(NSString *)title :(NSDate *)date :(void (^)(QDateTimeElement *))onValueChange;

- (QPickerElement *)addPicker:(QSection *)section :(NSString *)title :(NSArray *)items :(NSString *)value :(void (^)(QPickerElement *))onChange;

@end