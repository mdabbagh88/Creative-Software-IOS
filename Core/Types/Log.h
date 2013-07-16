//
// Created by Rene Dohan on 7/12/13.
// Copyright (c) 2013 creative_studio. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface Log : NSObject

+ (void)infoInt:(int)value;

+ (NSString *)log;

+ (void)infoDbl:(double)value;

+ (void)infoBool:(BOOL)value;

+ (void)info:(NSObject *)value;

+ (void)error:(NSObject *)value;

+ (void)infoEmpty;

@end