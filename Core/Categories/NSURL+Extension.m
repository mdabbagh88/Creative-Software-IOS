//
//  Created by Rene Dohan on 12/19/12.
//


#import "NSURL+Extension.h"


@implementation NSURL (Extension)

- (BOOL)validate {
		return self.scheme && self.host;
}

- (NSString *)parseBaseURL {
		return [self.absoluteString stringByReplacingOccurrencesOfString:self.path withString:@""];
}

@end