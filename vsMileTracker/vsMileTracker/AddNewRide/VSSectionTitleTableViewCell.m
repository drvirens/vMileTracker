//
//  VSSectionTitleTableViewCell.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/6/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSSectionTitleTableViewCell.h"
#import "VSBranding.h"

@interface VSSectionTitleTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelSummary;
@end

@implementation VSSectionTitleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
	[self setup];
}

- (void)setup {
	self.backgroundColor = [UIColor whiteColor];
		//self.backgroundColor = [UIColor magentaColor];
	
	self.labelTitle.backgroundColor = [UIColor clearColor];
	self.labelSummary.backgroundColor = [UIColor clearColor];
	
	UIFont* font = [VSBranding taableViewSectionTitleFont];
	self.labelTitle.font = font;
	self.labelTitle.textColor = [VSBranding vs_darkGrayColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSString*)reuseID {
	return NSStringFromClass([self class]);
}
- (void)configureWithModel:(NSDictionary*)model {
	NSString* title = [model objectForKey:@"title"];
	self.labelTitle.text = title;
	
	NSString* summary = [model objectForKey:@"summary"];
	self.labelSummary.text = summary;
}

@end
