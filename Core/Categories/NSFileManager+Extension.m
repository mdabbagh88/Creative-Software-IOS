//
// Created by Rene Dohan on 9/10/13.
// Copyright (c) 2013 creative_studio. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSFileManager+Extension.h"


@implementation NSFileManager (Extension)

+ (long)fileLength:(NSString *)path {
    NSError *attributesError;
    NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:&attributesError];
    if (attributesError)error(attributesError);
    NSNumber *fileSizeNumber = [fileAttributes objectForKey:NSFileSize];
    return fileSizeNumber.longValue;
}

@end