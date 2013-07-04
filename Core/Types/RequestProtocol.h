//
// Created by inno on 2/6/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@protocol RequestProtocol <NSObject>

@property(nonatomic, retain) NSString *url;
@property(nonatomic, readonly) NSDictionary *params;
@property(nonatomic, readonly) NSString *content;
@property(nonatomic, readonly) NSDictionary *post;
@property(nonatomic, readonly) NSString *uploadFile;
@property(nonatomic, readonly) NSString *uploadName;
@property(nonatomic, readonly) NSString *uploadMIME;
@property(nonatomic, readonly) NSData *uploadData;



@end