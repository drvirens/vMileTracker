//
//  VSMenuCell.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 10/24/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSMenuCell.h"
#import "VSBranding.h"
#import "VSMenuModel.h"

@interface VSMenuCell ()
@property (weak, nonatomic) IBOutlet UILabel *labelCategory;
@property (nonatomic) UIColor* lightGrayColor;
@property (nonatomic) UIColor* skyBlueColor;
@property (nonatomic) UIColor* currColor;
@end
@implementation VSMenuCell
- (void)awakeFromNib {
	[super awakeFromNib];
	[self setupLabel];
}
- (void)setupLabel {
	self.lightGrayColor = [VSBranding vs_lightGrayColor];
	self.skyBlueColor = [VSBranding vs_skyBlueColor];
	self.currColor = self.skyBlueColor;
	self.labelCategory.layer.cornerRadius = 26.f;
	self.labelCategory.layer.masksToBounds = YES;
}
+ (NSString*)reuseID {
	return NSStringFromClass([self class]);
}
- (void)configure:(VSMenuModel*)menu {
	self.labelCategory.text = menu.title;
	[self highlightLabel:menu];
}
- (void)highlightLabel:(VSMenuModel*)model {
	UIColor* textColor = nil;
	if (model.isHighlighted) {
		self.currColor = self.skyBlueColor;
		textColor = [VSBranding vs_whiteColor];
	} else {
		self.currColor = self.lightGrayColor;
		textColor = [UIColor darkGrayColor];
	}
	
	self.labelCategory.backgroundColor = self.currColor;
	self.labelCategory.textColor = textColor;
}

@end
