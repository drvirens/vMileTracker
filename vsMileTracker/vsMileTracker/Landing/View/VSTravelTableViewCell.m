//
//  VSTravelTableViewCell.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 8/23/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSTravelTableViewCell.h"
#import "VSBranding.h"

@interface VSTravelTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIButton *topMoreImageView;
@property (weak, nonatomic) IBOutlet UILabel *topTimeLabel;


@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIView *buttonView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UIView *buttonLHSView;
@property (weak, nonatomic) IBOutlet UIImageView *lhsImageViewIcon;
@property (weak, nonatomic) IBOutlet UIView *lhsContainerView;
@property (weak, nonatomic) IBOutlet UILabel *purposeTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *purposeSubTitleLabel;


@property (weak, nonatomic) IBOutlet UIView *buttonRHSView;
@property (weak, nonatomic) IBOutlet UIImageView *rhsImageViewIcon;
@property (weak, nonatomic) IBOutlet UIView *rhsContainerView;
@property (weak, nonatomic) IBOutlet UILabel *expenseTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *expenseSubTitle;

@end

@implementation VSTravelTableViewCell

- (void)configure:(VSModelTravel*)model {
	NSLog(@"configure:VSModelTravel");
	self.topTimeLabel.text = model.formattedTime;
	self.nameLabel.text = model.titleTravel;
	self.priceLabel.text = model.promotedPrice;
	self.purposeTitleLabel.text = model.purposeValue;
	self.purposeSubTitleLabel.text = model.purposeKey;
	self.expenseTitleLabel.text = model.expenseValue;
	self.expenseSubTitle.text = model.expenseKey;
}

+ (NSString*)reuseID {
	return NSStringFromClass([self class]);
}

- (void)awakeFromNib {
    [super awakeFromNib];
	[self applyTheme];
}

- (void)applyTheme {
	self.backgroundColor = [VSBranding vs_whiteColor];
//	self.containerView.backgroundColor = [UIColor whiteColor];
	self.containerView.backgroundColor = [VSBranding vs_lightGrayColor];
	
	[self applyThemeTopView];
	[self applyThemeBottomView];
	[self applyThemeButtonView];
}

- (void)applyThemeTopView {
	self.topView.backgroundColor = [VSBranding vs_whiteColor];
	
	UIImage* img = [UIImage imageNamed:@"ic_more_horiz"];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	[self.topMoreImageView setImage:img forState:UIControlStateNormal];
	self.topMoreImageView.tintColor = [VSBranding timeColor];
	
	self.topTimeLabel.font = [VSBranding subSmmaryFont];
	self.topTimeLabel.textColor = [VSBranding timeColor];
	
	img = [UIImage imageNamed:@"ic_restaurant_white"];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	[self.bottomImageView setImage:img];
	self.bottomImageView.tintColor = [VSBranding timeColor];
}

- (void)applyThemeBottomView {
	self.bottomView.backgroundColor = [VSBranding vs_whiteColor];
	
	self.priceLabel.backgroundColor = [VSBranding priceLabelBgColor];
	self.priceLabel.layer.cornerRadius = 5.f;
	self.priceLabel.layer.masksToBounds = YES;
	
	self.nameLabel.textColor = [VSBranding addressFontColor];
	self.nameLabel.font = [VSBranding addressFont];
}

- (void)applyThemeButtonView {
	self.buttonView.backgroundColor = [VSBranding vs_lightGrayColor];
	self.buttonLHSView.backgroundColor = [VSBranding travelBottomBgColor];
	self.lhsContainerView.backgroundColor = [UIColor clearColor];
	self.buttonRHSView.backgroundColor = [VSBranding travelBottomBgColor];
	self.rhsContainerView.backgroundColor = [UIColor clearColor];
	
	UIImage* img = [UIImage imageNamed:@"ic_event_white_48pt"];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	self.lhsImageViewIcon.image = img;
	self.lhsImageViewIcon.tintColor = [VSBranding travelBottomTextColor];
	
	self.purposeTitleLabel.textColor = [VSBranding travelBottomTextColor];
	self.purposeTitleLabel.font = [VSBranding actionTitleFont];
	
	self.purposeSubTitleLabel.textColor = [VSBranding travelBottomTextColor];
	self.purposeSubTitleLabel.font = [VSBranding actionSubTitleFont];
	
	img = [UIImage imageNamed:@"ic_payment_white_48pt"];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	self.rhsImageViewIcon.image = img;
	self.rhsImageViewIcon.tintColor = [VSBranding travelBottomTextColor];
	
	self.expenseTitleLabel.textColor = [VSBranding travelBottomTextColor];
	self.expenseTitleLabel.font = [VSBranding actionTitleFont];
	
	self.expenseSubTitle.textColor = [VSBranding travelBottomTextColor];
	self.expenseSubTitle.font = [VSBranding actionSubTitleFont];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
