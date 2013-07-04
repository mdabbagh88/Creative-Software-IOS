//
// Created by inno on 2/19/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "QImageElement.h"


@interface CSImageElement : QImageElement
@property(nonatomic, strong) NSURL *imageURL;

- (id)initWithTitle:(NSString *)string url:(NSURL *)url;


@end