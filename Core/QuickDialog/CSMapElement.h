//
// Created by inno on 1/24/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "QMapElement.h"

@class QMapViewController;
@class CSMapViewController;


@interface CSMapElement : QMapElement


- (QMapElement *)addTo:(QSection *)section :(NSString *)title :(CLLocationCoordinate2D)coordinate;
@end