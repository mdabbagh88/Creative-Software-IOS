//
//  Created by Rene Dohan on 10/24/12.
//


#import "TableViewCell.h"


@implementation TableViewCell {

}

- (NSString *)reuseIdentifier {
    if (super.reuseIdentifier)return super.reuseIdentifier;
    return self.class.description;
}

@end