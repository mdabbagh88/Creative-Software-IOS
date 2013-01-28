//
// Created by inno on 1/24/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "QMapViewController.h"


@interface CSMapViewController : QMapViewController

@property (nonatomic,copy)void (^onAnnotationDragEnd)(MKAnnotationView *);

@end