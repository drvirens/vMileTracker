//
//  VSSelectedDateTableViewCell.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/5/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSSelectedDateTableViewCell.h"
#import "VSBranding.h"

@interface VSSelectedDateTableViewCell ()

@end

@implementation VSSelectedDateTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
	[self setup];
}

- (void)setup {
	
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithModel:(NSDictionary*)dic {
	NSString* key = [dic objectForKey:@"_date"];
	NSDate* value = [dic objectForKey:@"_dateV"];
	self.selectedDateView.labelStartTimeKey.text = key;
		//XXX - use date formatter in dispatch_once etc
	self.selectedDateView.labelStartTimeValue.text = @"Sep 12, 2016  12:00 AM";
	[self setIcon:YES];
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
	self.selectedDateView.imageViewDropArrow.image = img;
	self.selectedDateView.imageViewDropArrow.tintColor = [VSBranding vs_darkGrayColor];
}

+ (NSString*)reuseID {
	return NSStringFromClass([self class]);
}

@end
