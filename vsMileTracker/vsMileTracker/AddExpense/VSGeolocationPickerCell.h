//
//  VSGeolocationPickerCell.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 11/5/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VSGeolocationPickerView.h"

@class VSGeolocationPickerCell;

@protocol VSGeolocationPickerCellDelegate <NSObject>

- (void)willStartShowingSearchResults:(VSGeolocationPickerCell*)pickerViewCell;
- (void)didStartShowingSearchResults:(VSGeolocationPickerCell*)pickerViewCell;

@end

@interface VSGeolocationPickerCell : UITableViewCell
@property (weak, nonatomic) IBOutlet VSGeolocationPickerView *geolocationPickerView;
@property (weak, nonatomic) id<VSGeolocationPickerCellDelegate> delegate;
@end
