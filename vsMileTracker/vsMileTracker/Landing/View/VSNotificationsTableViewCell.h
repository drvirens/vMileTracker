//
//  VSNotificationsTableViewCell.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 8/23/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VSModelNotification.h"

@interface VSNotificationsTableViewCell : UITableViewCell
+ (NSString*)reuseID;
- (void)configure:(VSModelNotification*)model;
@end
