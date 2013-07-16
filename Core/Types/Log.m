//
// Created by Rene Dohan on 7/12/13.
// Copyright (c) 2013 creative_studio. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSDateFormatter+Extension.h"

static NSString *const INFO = @"Info ";
static NSString *const ERROR = @"Error ";

@implementation Log {

}

static NSString *_log;
static NSDateFormatter *_format;


+ (void)addLogLine:(NSString *)value {
    _log = [self.log add:_format.now :@" " :value :@"\n"];
    if (_log.length > 20000)[_log substringTo:10000];
}

+ (NSString *)log {
    if (!_log) {
        _format = [NSDateFormatter create];
        _log = @"";
    }
    return _log;
}

+ (void)infoInt:(int)value {
    [self addLogLine:[INFO add:[NSString fromInt:value]]];
}

+ (void)infoDbl:(double)value {
    [self addLogLine:[INFO add:[NSString fromDbl:value]]];
}

+ (void)infoBool:(BOOL)value {
    [self addLogLine:[INFO add:[NSString fromBool:value]]];
}

+ (void)info:(NSObject *)value {
    [self addLogLine:[INFO add:value]];
}

+ (void)error:(NSObject *)value {
    [self addLogLine:[ERROR add:value]];
}

+ (void)infoEmpty {
    [self addLogLine:INFO];
}


@end