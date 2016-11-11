//
//  VSNotesTableViewCell.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/11/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSNotesTableViewCell.h"
#import "VSBranding.h"

@interface VSNotesTableViewCell ()
@property (weak, nonatomic) IBOutlet UITextField *textFieldPlaceholder;
@property (weak, nonatomic) IBOutlet UITextView *textViewNotes;
@end

@implementation VSNotesTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
	[self setup];
}

- (void)setup {
	self.backgroundColor = [UIColor whiteColor];
	self.contentView.backgroundColor = [UIColor clearColor];
	self.textFieldPlaceholder.backgroundColor = [UIColor clearColor];
	self.textViewNotes.backgroundColor = [UIColor clearColor];
	
	self.textFieldPlaceholder.font = VS_FONT_SMALL;
	
	NSDictionary* attributes = @{NSForegroundColorAttributeName:[VSBranding vs_darkGrayColor],
								 NSFontAttributeName:VS_FONT_VERYSMALL};
	NSMutableAttributedString* attrPlaceHolderStr = [[NSMutableAttributedString alloc] initWithString:@"Tap here to enter Notes" attributes:attributes];
	self.textFieldPlaceholder.attributedPlaceholder = attrPlaceHolderStr;
	
	[self showPlaceHolder];
}

- (void)showPlaceHolder {
	self.textFieldPlaceholder.hidden = NO;
	self.textFieldPlaceholder.userInteractionEnabled = YES;
		//[self.textFieldPlaceholder becomeFirstResponder];
	
	self.textViewNotes.hidden = YES;
	self.textViewNotes.userInteractionEnabled = NO;
		//[self.textViewNotes resignFirstResponder];
	
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
