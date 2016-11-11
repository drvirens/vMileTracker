//
//  VSDatePickerTableViewCell.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/5/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSDatePickerTableViewCell.h"

@interface VSDatePickerTableViewCell () <VSDatePickerViewDelegate>
@property (weak, nonatomic) IBOutlet VSDatePickerView *datePickerView;

@end

@implementation VSDatePickerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
	
	self.datePickerView.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (CGFloat)currentCellHeight {
	CGFloat ht = [self.datePickerView currentHeight];
	return ht;
}

#pragma mark - VSDatePickerViewDelegate
- (void)datePickerView:(VSDatePickerView*)datePickerView
			 didExpand:(BOOL)isexpanded {
	if ([self.delegate conformsToProtocol:@protocol(VSDatePickerTableViewCellDelegate)]) {
		[self.delegate toggleDatePickerHeight];
	}
}

- (void)toggle {
	[self.datePickerView toggle];
}

@end
