//
// Created by inno on 1/24/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "QButtonElement.h"


@interface CSQButtonElement : QButtonElement
@property (nonatomic,copy)void (^onCellSelected)(UITableViewCell *,CSQButtonElement *);

@end