//
//  VSSelectedDateTableView.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/5/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSSelectedDateTableView.h"
#import "VSBranding.h"

@interface VSSelectedDateTableView ()
@property (nonatomic, weak) VSSelectedDateTableView* customView;

@end

@implementation VSSelectedDateTableView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		[self commonInit];
	}
	return self;
}

- (void)commonInit {
	self.customView = (VSSelectedDateTableView*)[[[NSBundle mainBundle] loadNibNamed:@"VSSelectedDateTableView" owner:self options:nil] firstObject];
	self.customView.frame = self.bounds;
	
	[self addSubview:self.customView];
	
	[self setup];
}

- (void)setup {
	self.labelStartTimeKey.textColor = [VSBranding vs_veryDarkGrayColor];
	self.labelStartTimeKey.font = VS_FONT_SMALL;
	
	self.labelStartTimeValue.textColor = [VSBranding vs_veryDarkGrayColor];
	self.labelStartTimeValue.font = VS_FONT_SMALL;
}

@end
