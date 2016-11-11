//
//  VSTravelTableViewCell.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 8/23/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VSModelTravel.h"

@interface VSTravelTableViewCell : UITableViewCell
+ (NSString*)reuseID;
- (void)configure:(VSModelTravel*)model;
@end
