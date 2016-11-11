//
//  VSHorizontalMenuCell.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/29/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSNotesCell.h"
#import "VSBranding.h"

@interface VSNotesCell ()
@property (weak, nonatomic) IBOutlet UILabel *labelSectionHeader;
@end

@implementation VSNotesCell

- (void)awakeFromNib {
    [super awakeFromNib];
	[self setupHeader];
}

- (void)setupHeader {
	self.labelSectionHeader.backgroundColor = [UIColor clearColor];
	UIFont* font = [VSBranding taableViewSectionTitleFont];
	self.labelSectionHeader.font = font;
	self.labelSectionHeader.textColor = [VSBranding vs_darkGrayColor];
}

+ (NSString*)reuseID {
	return NSStringFromClass([self class]);
}

- (void)configure:(id)model {
	NSLog(@"TODO: confugre VSHorizontalMenuCell");
}

@end
