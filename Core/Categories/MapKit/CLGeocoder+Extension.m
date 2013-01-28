//
// Created by inno on 1/20/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <AddressBookUI/AddressBookUI.h>
#import "CLGeocoder+Extension.h"
#import "CLLocation+Extension.h"


@implementation CLGeocoder (Extension)

- (CLGeocoder *)addressFromLocation:(CLLocation *)location:(BOOL)addCountryName :(void (^)(NSString *))onAddressReady {
    [self reverseGeocodeLocation:location completionHandler:^(NSArray *placemark, NSError *error) {
        runWith(onAddressReady, ABCreateStringWithAddressDictionary([placemark[0] addressDictionary], addCountryName));
    }];
    return self;
}

- (CLGeocoder *)addressFromCoordinate:(CLLocationCoordinate2D )coordinate:(BOOL)addCountryName :(void (^)(NSString *))onAddressReady {
    [self reverseGeocodeLocation:[CLLocation from:coordinate] completionHandler:^(NSArray *placemark, NSError *error) {
        runWith(onAddressReady, ABCreateStringWithAddressDictionary([placemark[0] addressDictionary], addCountryName));
    }];
    return self;
}

@end