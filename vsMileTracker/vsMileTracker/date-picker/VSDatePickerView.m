//
//  VSDatePickerView.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/5/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSDatePickerView.h"
#import "VSBranding.h"

@interface VSDatePickerView ()
@property (nonatomic, weak) VSDatePickerView* customView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *totalHeightOfView;

@property (weak, nonatomic) IBOutlet UIView *topContainerView;
@property (weak, nonatomic) IBOutlet UILabel *labelTimeKey;
@property (weak, nonatomic) IBOutlet UILabel *labelTimeValue;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewExpandShrinkIcon;

@property (weak, nonatomic) IBOutlet UIView *bottomContainerView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (nonatomic) BOOL isTouchEvent;
@property (nonatomic) BOOL isExpanded;

@end

@implementation VSDatePickerView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		_isExpanded = NO;
		_isTouchEvent = NO;
		
		[self setup];
		[self decorateViews];
	}
	return self;
}

- (void)setup {
	NSString* className = NSStringFromClass([self class]);
	self.customView = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
	self.customView.frame = self.bounds;
	
	[self addSubview:self.customView];
}

- (void)decorateViews {
	[self setBackgroundColors];
	[self setIcon:!self.isTouchEvent];
}

- (void)setBackgroundColors {
	self.topContainerView.backgroundColor = [UIColor clearColor];
	self.bottomContainerView.backgroundColor = [UIColor clearColor];
	self.datePicker.backgroundColor = [UIColor clearColor];
}

- (void)setIcon:(BOOL)isExpanded {
	NSString* iconname = nil;
	if (isExpanded) {
		iconname = @"ic_arrow_drop_down_white";
	} else {
		iconname = @"ic_arrow_drop_up_white";
	}
	UIImage* img = [UIImage imageNamed:iconname];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	self.imageViewExpandShrinkIcon.image = img;
	self.imageViewExpandShrinkIcon.tintColor = [VSBranding vs_darkGrayColor];
}

#pragma mark - api
- (CGFloat)heightWhenShrunk {
	return self.topViewHeight.constant;
}
- (CGFloat)heightWhenExpanded {
	CGFloat multiplier = self.topViewHeight.multiplier;
	CGFloat multiplier2 = self.totalHeightOfView.multiplier;
		//equation : multiplier2 * x = 1
		//  therefor, x = 1 / multiplier2
	CGFloat ratioValue = multiplier / multiplier2;
	CGFloat shrunkenHeight = self.topViewHeight.constant;
	CGFloat ret = shrunkenHeight * ratioValue;
	return ret;
}
- (CGFloat)currentHeight {
	if (!self.isTouchEvent) {
		return [self heightWhenShrunk];
	}
	
	if (self.isExpanded) {
		return [self heightWhenExpanded];
	}
	return [self heightWhenShrunk];
}

- (void)toggle {
	self.isTouchEvent = YES;
	[self setIcon:self.isExpanded];
	self.isExpanded = !self.isExpanded;
	if ([self.delegate conformsToProtocol:@protocol(VSDatePickerViewDelegate)]) {
		[self.delegate datePickerView:self didExpand:self.isExpanded];
	}
}

@end
