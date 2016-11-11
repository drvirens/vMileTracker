//
//  VSGeolocationPickerView.m
//  customUIView
//
//  Created by Virendra Shakya on 9/2/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSGeolocationPickerView.h"
#import "VSBranding.h"

static const CGFloat kSearchFieldMoveDuration = .25f;

@interface VSGeolocationPickerView () <UITextFieldDelegate>
@property (nonatomic, weak) VSGeolocationPickerView *customView;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSearch;
@property (weak, nonatomic) IBOutlet UIView *viewSelectCrrentLocation;
@property (weak, nonatomic) IBOutlet UIButton *buttonGoToCurrentLocation;

	//adjust this to move search textfiled up and down
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintSearchYOrdinate;

@end

@implementation VSGeolocationPickerView

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if(self) {
		[self setup];
		[self decorateViews];
	}
	return self;
}

- (void)setup {
	NSString *className = NSStringFromClass([self class]);
	_customView = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
	_customView.frame = self.bounds;
	
	[self addSubview:_customView];
}

- (void)decorateViews {
	self.mapView.userInteractionEnabled = NO; //by default, no
	[self decorateTextFieldView];
	[self decorateGotoCurrView];
}

- (void)decorateTextFieldView {
		//corner radius
	[self addCornerRadisuToTextField];
	
		//lhs icon
	[self addSearchIconToTextField];
	
		//alpha
	[self setTransparenccyForTextField];
	
		//font
	[self setFontForTextField];
}

- (void)addCornerRadisuToTextField {
		//corner radius
	self.textFieldSearch.layer.cornerRadius = 17;
	self.textFieldSearch.layer.masksToBounds = YES;
	self.textFieldSearch.layer.borderWidth = 1;
	self.textFieldSearch.layer.borderColor = [UIColor blackColor].CGColor;
}

- (void)addSearchIconToTextField {
	CGRect viewFrame = CGRectMake(0, 0, 30, 30);
	UIView* searchLeftView = [[UIView alloc] initWithFrame:viewFrame];
	searchLeftView.translatesAutoresizingMaskIntoConstraints = YES;
	searchLeftView.backgroundColor = [UIColor clearColor];
	
	UIImage* img = [UIImage imageNamed:@"ic_search_white"];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	UIImageView* searchIcon = [[UIImageView alloc] initWithImage:img];
	searchIcon.translatesAutoresizingMaskIntoConstraints = YES;
	searchIcon.backgroundColor = [UIColor clearColor];
	searchIcon.contentMode = UIViewContentModeScaleAspectFit;
	
	CGRect r = searchIcon.bounds;
	CGRect f = CGRectMake(r.origin.x + 10, r.origin.y + 7, r.size.width - 7, r.size.height - 5);
	searchIcon.frame = f;
	searchIcon.tintColor = [UIColor blackColor];
	[searchLeftView addSubview:searchIcon];
	self.textFieldSearch.leftView = searchLeftView;
	self.textFieldSearch.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setTransparenccyForTextField {
	self.textFieldSearch.alpha = 1.f;
}

- (void)setFontForTextField {
	NSDictionary* attributes = @{NSForegroundColorAttributeName:[VSBranding vs_darkGrayColor],
								 NSFontAttributeName:VS_FONT_VERYSMALL};
	NSMutableAttributedString* attrPlaceHolderStr = [[NSMutableAttributedString alloc] initWithString:@"Enter place or address" attributes:attributes];
	self.textFieldSearch.attributedPlaceholder = attrPlaceHolderStr;
}

- (void)decorateGotoCurrView {
	UIImage* img = [UIImage imageNamed:@"ic_my_location_white"];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	[self.buttonGoToCurrentLocation setBackgroundImage:img forState:UIControlStateNormal];
	self.buttonGoToCurrentLocation.tintColor = [UIColor blackColor];
	self.buttonGoToCurrentLocation.titleLabel.font = VS_FONT_SMALL;
}

#pragma mark - external functions
- (void)adjustSearchFieldBy:(CGFloat)yDistance {
	[self layoutIfNeeded];
	[self setNeedsUpdateConstraints];
	[UIView animateWithDuration:kSearchFieldMoveDuration animations:^{
		self.constraintSearchYOrdinate.constant = -10;
		[self layoutIfNeeded];
	}];
}

#pragma mark - textfield
- (IBAction)textfieldEditingChanged:(id)sender {
	NSLog(@"textfieldEditingChanged");
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	NSLog(@"textFieldShouldBeginEditing");
	if ([self.delegate respondsToSelector:@selector(willStartShowingSearchResults:)]) {
		[self.delegate willStartShowingSearchResults:self];
	}
	return YES;
}

@end
