//
//  VSExpenseTableViewCell.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/11/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSExpenseTableViewCell.h"
#import "VSBranding.h"

@interface VSExpenseTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *buttonExpebnse;

@end

@implementation VSExpenseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
	[self setup];
}

- (void)setup {
	self.buttonExpebnse.backgroundColor = [VSBranding themeColor];
	[self.buttonExpebnse setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	
	self.buttonExpebnse.titleLabel.font = VS_FONT_SMALL;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


+ (NSString*)reuseID {
	return NSStringFromClass([self class]);
}

- (void)configureWithModel:(NSDictionary*)dic {
	NSLog(@"dictionary = %@", dic);
	NSString* btnTitle = [dic objectForKey:@"_btnTitle"];
	[self.buttonExpebnse setTitle:btnTitle forState:UIControlStateNormal];
}

- (IBAction)didTapOnAddExpenseButton:(id)sender {
	NSLog(@"didTapOnAddExpenseButton");
	if ([self.delegate conformsToProtocol:@protocol(VSExpenseTableViewCellDelegate)]) {
		[self.delegate didTapOnAddExpenseButton:self];
	}
}

@end
