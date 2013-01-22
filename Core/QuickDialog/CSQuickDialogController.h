//
//  Created by Rene Dohan on 1/15/13.
//


#import <Foundation/Foundation.h>

@interface CSQuickDialogController : QuickDialogController

- (UIViewController *)createUI;

- (QEntryElement *)addEntry:(QSection *)section :(NSString *)title :(NSString *)value :(NSString *)placeholder :(void (^)(QEntryElement *))onValueChange;

- (void)addPicker:(QSection *)section :(NSString *)title :(NSArray *)items :(NSString *)value :(void (^)(QPickerElement *))onChange;
@end