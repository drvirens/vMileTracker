//
//  VSSummaryTableViewCell.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 8/19/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VSModelSummary.h"

@interface VSSummaryTableViewCell : UITableViewCell
+ (NSString*)reuseID;
- (void)configure:(VSModelSummary*)model;
@end
