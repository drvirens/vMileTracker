//
//  VSLocationPickerTableViewCell.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/4/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VSGeolocationPickerView.h"

@class VSLocationPickerTableViewCell;

@protocol VSLocationPickerTableViewCellDelegate <NSObject>

- (void)willStartShowingSearchResults:(VSLocationPickerTableViewCell*)pickerViewCell;
- (void)didStartShowingSearchResults:(VSLocationPickerTableViewCell*)pickerViewCell;

@end

@interface VSLocationPickerTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet VSGeolocationPickerView *geolocationPickerView;
@property (weak, nonatomic) id<VSLocationPickerTableViewCellDelegate> delegate;

- (void)configure:(BOOL)showWhiteMast;
@end
