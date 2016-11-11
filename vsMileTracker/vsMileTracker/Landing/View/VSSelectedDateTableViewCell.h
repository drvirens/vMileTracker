//
//  VSSelectedDateTableViewCell.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/5/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VSAddNewRideModel.h"
#import "VSSelectedDateTableView.h"

@interface VSSelectedDateTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet VSSelectedDateTableView *selectedDateView;

+ (NSString*)reuseID;
- (void)configureWithModel:(NSDictionary*)model;
@end
