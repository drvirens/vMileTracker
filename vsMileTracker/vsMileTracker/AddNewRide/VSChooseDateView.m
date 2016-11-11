//
//  VSChooseDateView.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/8/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSChooseDateView.h"

@interface VSChooseDateView ()
@property (nonatomic, weak) VSChooseDateView* customView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthDatePicker;

@end

@implementation VSChooseDateView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		[self commonInit];
		[self setup];
	}
	return self;
}

- (void)commonInit {
	self.customView = [[[NSBundle mainBundle] loadNibNamed:@"VSChooseDateView" owner:self options:nil] firstObject];
	self.customView.frame = self.bounds;
	[self addSubview:self.customView];
}

- (void)setup {
	[self.datePicker setDatePickerMode:UIDatePickerModeDateAndTime];
		//[self.datePicker setDatePickerMode:UIDatePickerModeTime];
	self.widthDatePicker.constant = [[UIScreen mainScreen] bounds].size.width;
}
@end
