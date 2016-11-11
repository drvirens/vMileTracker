//
//  VSVehicleCell.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 10/16/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VSVehicleModel;
@interface VSVehicleCell : UITableViewCell
+ (NSString*)reuseID;
- (void)configure:(VSVehicleModel*)model;
@end
