//
//  VSRideHistoryTableViewCell.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 8/19/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VSModelRide.h"

@class VSRideHistoryTableViewCell;

@protocol VSRideHistoryTableViewCellDelegate <NSObject>

- (void)didTapDriveViewIn:(VSRideHistoryTableViewCell*)cell;
- (void)didTapVehicleTypeViewIn:(VSRideHistoryTableViewCell*)cell;
- (void)didTapPurposeViewIn:(VSRideHistoryTableViewCell*)cell;
- (void)didTapAddExpenseViewIn:(VSRideHistoryTableViewCell*)cell;

@end

@interface VSRideHistoryTableViewCell : UITableViewCell

@property (nonatomic) id<VSRideHistoryTableViewCellDelegate> delegateRide;
- (void)configure:(VSModelRide*)model;
+ (NSString*)reuseID;
@end
