//
//  VSTextPickerTableViewCell.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/10/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSTextPickerTableViewCell.h"
#import "VSBranding.h"

@interface VSTextPickerTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *labelCurrentlySelectedDescription;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewRhsIcon;
@end

@implementation VSTextPickerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
	[self setupImage];
	[self setup];
}

- (void)setupImage {
	UIImage* img = [UIImage imageNamed:@"ic_keyboard_arrow_right_white"];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	
	self.imageViewRhsIcon.image = img;
	self.imageViewRhsIcon.tintColor = [VSBranding vs_darkGrayColor];
}

- (void)setup {
	self.labelCurrentlySelectedDescription.textColor = [VSBranding vs_veryDarkGrayColor];
	self.labelCurrentlySelectedDescription.font = VS_FONT_SMALL;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (NSString*)reuseID {
	return NSStringFromClass([self class]);
}

- (void)configureWithModel:(NSDictionary*)dic {
}

@end
