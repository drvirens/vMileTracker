//
//  VSNotificationsTableViewCell.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 8/23/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSNotificationsTableViewCell.h"
#import "VSBranding.h"

@interface VSNotificationsTableViewCell ()

	//header view
@property (weak, nonatomic) IBOutlet UIView *notificationHeaderView;
@property (weak, nonatomic) IBOutlet UIImageView *headerLhsImageView;
@property (weak, nonatomic) IBOutlet UIImageView *headerRhsImageView;
@property (weak, nonatomic) IBOutlet UILabel *headerTitleLabel;

	//footer view
@property (weak, nonatomic) IBOutlet UIView *notifFooterView;
@property (weak, nonatomic) IBOutlet UIButton *seeAllButton;

	//body view
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet UIView *bodyContainerView;
@property (weak, nonatomic) IBOutlet UIImageView *lhsImageViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *rhsPriceLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *instructionLaabel;

@end

@implementation VSNotificationsTableViewCell
- (void)configure:(VSModelNotification*)model {
	NSLog(@"configure:VSModelNotification");
}

+ (NSString*)reuseID {
	return NSStringFromClass([self class]);
}

- (void)awakeFromNib {
    [super awakeFromNib];
	
	[self applyTheme];
}

- (void)applyTheme {
	[self applyThemeHeader];
	[self applyThemeBody];
	[self applyThemeFooter];
}

- (void)applyThemeHeader {
	self.notificationHeaderView.backgroundColor = [VSBranding notificationHeaderViewBGColor];
	
	UIImage* img = [UIImage imageNamed:@"ic_warning_white"];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	self.headerLhsImageView.image = img;
	self.headerLhsImageView.tintColor = [VSBranding alertYellowColor];
	
		//image rhs
	img = [UIImage imageNamed:@"ic_close_white"];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	self.headerRhsImageView.image = img;
	self.headerRhsImageView.tintColor = [UIColor whiteColor];
	
		//headerTitleLabel
	self.headerTitleLabel.font = [VSBranding subSmmaryFont];
	self.headerTitleLabel.textColor = [VSBranding vs_whiteColor];
	
		//rhsPriceLabel
	self.rhsPriceLabel.textColor = [VSBranding priceLabelColor];
	self.rhsPriceLabel.font = [VSBranding headerTitleFont];
}

- (void)applyThemeBody {
	self.middleView.backgroundColor = [VSBranding notifBodyBgColor];
	self.bodyContainerView.backgroundColor = [VSBranding vs_whiteColor];
	
	UIImage* img = [UIImage imageNamed:@"ic_restaurant_white"];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	
	self.lhsImageViewIcon.image = img;
	self.lhsImageViewIcon.tintColor = [VSBranding notifBodyLhsIconBgColor];
	
		//titleLabel
	self.titleLabel.textColor = [VSBranding notifBodyTitleColor];
	self.titleLabel.font = [VSBranding notifBodyTitleFont];
	
	self.subTitleLabel.textColor = [VSBranding notifBodySubTitleColor];
	self.subTitleLabel.font = [VSBranding notifBodySubTitleFont];
	
	self.instructionLaabel.textColor = [VSBranding notifBodyInstructionColor];
	self.instructionLaabel.font = [VSBranding notifBodySubTitleFont];
}

- (void)applyThemeFooter {
	
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
