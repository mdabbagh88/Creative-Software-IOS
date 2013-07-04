//
//  Created by Rene Dohan on 1/15/13.
//


#import "QuickDialogController+Extension.h"
#import "CSImageElement.h"
#import "CSPickerElement.h"
#import "UIImage+Extension.h"

@implementation QuickDialogController (Extension)

- (UIViewController *)createUI {
    self.root = [QRootElement new];
    self.root.grouped = YES;
    self.resizeWhenKeyboardPresented = YES;
    return self;
}

- (CSImageElement *)addImage:(QSection *)section :(NSString *)title :(float)height :(NSURL *)url:(UIImage *)placeholder:(void (^)(QImageElement *))onValueChange {
    CSImageElement *element = [CSImageElement.alloc initWithTitle:title url:url];
    element.height = height;
    element.imageValue = [placeholder scaleToHeight:height];
    return (CSImageElement *) [self initializeEntry:section onValueChange:(void (^)(QEntryElement *)) onValueChange entry:element];
}

- (CSImageElement *)addImage:(QSection *)section :(NSString *)title :(float)height :(NSURL *)url:(void (^)(QImageElement *))onValueChange {
    CSImageElement *element = [CSImageElement.alloc initWithTitle:title url:url];
    element.height = height;
    return (CSImageElement *) [self initializeEntry:section onValueChange:(void (^)(QEntryElement *)) onValueChange entry:element];
}

- (QEntryElement *)addLine:(QSection *)section :(NSString *)title :(NSString *)value :(NSString *)placeholder :(void (^)(QEntryElement *))onValueChange {
    QEntryElement *entry = [[QEntryElement alloc] initWithTitle:title Value:value Placeholder:placeholder];
    return [self initializeEntry:section onValueChange:onValueChange entry:entry];
}

- (QEntryElement *)initializeEntry:(QSection *)section onValueChange:(void (^)(QEntryElement *))onValueChange entry:(QEntryElement *)entry {
    [section addElement:entry];
    entry.keyboardType = UIKeyboardTypeNamePhonePad;
    entry.autocapitalizationType = UITextAutocapitalizationTypeWords;
    entry.delegate = self;
    entry.onValueChanged = ^(QRootElement *element) {
        runWith(onValueChange, element);
    };
    return entry;
}

- (QEntryElement *)addMultiLine:(QSection *)section :(NSString *)title :(NSString *)value :(NSString *)placeholder :(void (^)(QEntryElement *))onValueChange {
    QEntryElement *entry = [[QMultilineElement alloc] initWithTitle:title Value:value Placeholder:placeholder];
    return [self initializeEntry:section onValueChange:onValueChange entry:entry];
}

- (QDateTimeInlineElement *)addDateTime:(QSection *)section:(UIDatePickerMode)mode :(NSString *)title :(NSDate *)date :(void (^)(QDateTimeElement *))onValueChange {
    QDateTimeInlineElement *element = [[QDateTimeInlineElement alloc] initWithTitle:title date:date];
    [section addElement:element];
    element.mode = mode;
    element.delegate = self;
    element.onValueChanged = ^(QRootElement *_element) {
        runWith(onValueChange, _element);
    };
    return element;
}


- (QPickerElement *)addPicker:(QSection *)section :(NSString *)title :(NSArray *)items :(NSString *)value :(void (^)(QPickerElement *))onChange {
    QPickerElement *picker = [[CSPickerElement new] initWithTitle:title items:items value:value];
    picker.delegate = self;
    picker.onValueChanged = ^(QRootElement *element) {
        runWith(onChange, element);
    };
    [section addElement:picker];
    return picker;
}


@end