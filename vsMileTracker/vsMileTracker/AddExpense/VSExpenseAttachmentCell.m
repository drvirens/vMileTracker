//
//  VSExpenseAttachmentCell.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/25/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSExpenseAttachmentCell.h"
#import "VSBranding.h"

@interface VSExpenseAttachmentCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewActualPhoto;
@property (weak, nonatomic) IBOutlet UIButton *buttonClose;
@property (weak, nonatomic) IBOutlet UILabel *labelSectionHeader;
@property (weak, nonatomic) IBOutlet UIButton *buttonCamera;
@end

@implementation VSExpenseAttachmentCell

- (void)awakeFromNib {
    [super awakeFromNib];
	[self commonInit];
}

- (void)commonInit {
	[self setupButtonCamera];
	[self setupCloseIconImageView];
	[self setupHeader];
}

- (void)setupHeader {
	self.labelSectionHeader.backgroundColor = [UIColor clearColor];
	self.labelSectionHeader.font			= VS_FONT_REGULAR;
	self.labelSectionHeader.textColor		= [VSBranding vs_darkGrayColor];
}

- (void)setupButtonCamera {
	self.buttonCamera.layer.cornerRadius = 5;
	self.buttonCamera.backgroundColor = [VSBranding themeColor];
	[self.buttonCamera addTarget:self action:@selector(didTapOnCameraButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupCloseIconImageView {
	self.buttonClose.backgroundColor =  [VSBranding themeColor];
	[self.buttonClose addTarget:self action:@selector(didTapOnRemovePicButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupImageView:(UIImageView*)imageView imgName:(NSString*)imgName {
	UIImage* img = [UIImage imageNamed:imgName];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	imageView.image = img;
	imageView.tintColor = [UIColor whiteColor];
	imageView.backgroundColor = [VSBranding themeColor];
	
	imageView.layer.cornerRadius = 12.f;
}

+ (NSString*)reuseID {
	return NSStringFromClass([self class]);
}

- (void)configure:(NSMutableDictionary*)model {
	BOOL isdefault = [[model objectForKey:@"isdefault"] boolValue];
	UIImage* img = [model objectForKey:@"image"];
	if (!isdefault) {
		self.imageViewActualPhoto.image = img;
	}
	self.buttonClose.hidden = isdefault;
	self.buttonClose.layer.cornerRadius = 20.f;
}

#pragma mark - user interaction
- (void)didTapOnCameraButton:(id)sender {
	if ([self.delegate respondsToSelector:@selector(cell:didTapOnCameraButton:)] ) {
		[self.delegate cell:self didTapOnCameraButton:sender];
	}
}
- (void)didTapOnRemovePicButton:(id)sender {
	if ([self.delegate respondsToSelector:@selector(cell:didTapOnRemovePicButton:)] ) {
		[self.delegate cell:self didTapOnRemovePicButton:sender];
	}
}

@end
