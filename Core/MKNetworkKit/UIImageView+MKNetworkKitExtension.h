//
// Created by inno on 1/28/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface UIImageView (MKNetworkKitExtension)

- (void)setImageWithURL:(NSURL *)url;

- (void)setImageWithURL:(NSURL *)url :(BOOL)animations;
@end