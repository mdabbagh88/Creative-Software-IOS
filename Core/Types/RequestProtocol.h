//
// Created by inno on 2/6/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@protocol RequestProtocol <NSObject>

@property(nonatomic, copy) NSString *url;
@property(nonatomic, readonly) NSDictionary *params;
@property(nonatomic,copy) NSString *content;

@end