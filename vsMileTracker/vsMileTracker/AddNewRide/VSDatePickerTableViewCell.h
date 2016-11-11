//
//  VSDatePickerTableViewCell.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/5/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VSDatePickerView.h"

@class VSDatePickerTableViewCell;

@protocol VSDatePickerTableViewCellDelegate <NSObject>

- (void)toggleDatePickerHeight;

@end

@interface VSDatePickerTableViewCell : UITableViewCell

@property (nonatomic, weak) id<VSDatePickerTableViewCellDelegate> delegate;

- (CGFloat)currentCellHeight;
- (void)toggle;
@end
