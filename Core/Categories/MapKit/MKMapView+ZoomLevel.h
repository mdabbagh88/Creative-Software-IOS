//
//  Created by Rene Dohan on 6/25/12.
//


#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MKMapView (ZoomLevel)

- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
    zoomLevel:(NSUInteger)zoomLevel
    animated:(BOOL)animated;

@end