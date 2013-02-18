//
//  Created by Rene Dohan on 1/15/13.
//


#import "QuickDialogController+Extension.h"
#import "CSImageButton.h"

@implementation QuickDialogController (Extension)

- (UIViewController *)createUI {
    self.root = [QRootElement new];
    self.root.grouped = YES;
    self.resizeWhenKeyboardPresented = YES;
    return self;
}

- (CSQButtonElement*)addImageButton:(QSection *)section :(NSString *)title :(int)height :(UIImage *)image:(NSURL *)placeholder:(void (^)(UITableViewCell *, CSQButtonElement *))onSelected {
    CSImageButton *imageButton = (CSImageButton *) [[CSImageButton alloc] initWithTitle:title];
    imageButton.labelingPolicy = QLabelingPolicyTrimValue;
    imageButton.height = height;
    imageButton.image = image;
    imageButton.imageURL = placeholder;
    imageButton.onCellSelected = ^(UITableViewCell *cell, CSQButtonElement *element) {
        if (onSelected)onSelected(cell, element);
    };
    [section addElement:imageButton];
    return imageButton;
}

- (QEntryElement *)addEntry:(QSection *)section :(NSString *)title :(NSString *)value :(NSString *)placeholder :(void (^)(QEntryElement *))onValueChange {
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

- (QEntryElement *)addMultiLineEntry:(QSection *)section :(NSString *)title :(NSString *)value :(NSString *)placeholder :(void (^)(QEntryElement *))onValueChange {
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

- (QPickerElement *)addSingleItemPicker:(QSection *)section :(NSString *)title :(NSArray *)items :(NSString *)value :(void (^)(QPickerElement *))onChange {
    return [self addPicker:section :title :items :value :onChange];
}

- (QPickerElement *)addPicker:(QSection *)section :(NSString *)title :(NSArray *)items :(NSString *)value :(void (^)(QPickerElement *))onChange {
    QPickerElement *picker = [[QPickerElement new] initWithTitle:title items:items value:value];
    picker.delegate = self;
    picker.onValueChanged = ^(QRootElement *element) {
        runWith(onChange, element);
    };
    [section addElement:picker];
    return picker;
}


@end