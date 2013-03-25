//
// Created by inno on 1/24/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <MapKit/MapKit.h>
#import "CSMapElement.h"
#import "QMapViewController.h"
#import "CSMapViewController.h"
#import "QuickDialogController.h"


@implementation CSMapElement {

}

- (void)selected:(QuickDialogTableView *)tableView controller:(QuickDialogController *)controller indexPath:(NSIndexPath *)path {
    CSMapViewController *mapController = [[CSMapViewController alloc] initWithTitle:_title coordinate:_coordinate];
    mapController.onAnnotationDragEnd = self.onAnnotationDragEnd;
    [controller displayViewController:mapController];
}

- (CSMapElement *)addTo:(QSection *)section :(NSString *)title :(CLLocationCoordinate2D)coordinate {
    CSMapElement *element = (CSMapElement *) [CSMapElement.alloc initWithTitle:title coordinate:coordinate];
    [section addElement:element];
    return element;
}

@end