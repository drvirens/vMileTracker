//
//  VSSummaryTableViewCell.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 8/19/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSSummaryTableViewCell.h"
#import "VSBranding.h"
#import "ANDLineChartView.h"

#define MAX_NUMBER_COUNT 20
#define MAX_NUMBER 20

#define WHITE_THEME 1

@interface VSSummaryTableViewCell ()
	<ANDLineChartViewDataSource,ANDLineChartViewDelegate> //TODO: this should be in viewcontroller
{
	NSArray *_elements;
	NSUInteger _numbersCount;
	NSUInteger _maxValue;
	ANDLineChartView *_chartView;
}
@property (weak, nonatomic) IBOutlet UILabel *milesValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *milesKeyLabel;
@property (weak, nonatomic) IBOutlet UILabel *savingsValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *savingsKeyLabel;
@property (weak, nonatomic) IBOutlet UILabel *drivesValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *drivesKeyLabel;
@property (weak, nonatomic) IBOutlet UIView *seperationLineOne;
@property (weak, nonatomic) IBOutlet UIView *seperationLineTwo;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *seperatinLineWidthConstraint;
@property (weak, nonatomic) IBOutlet UIView *graphView;

@end

@implementation VSSummaryTableViewCell

- (void)configure:(VSModelSummary*)model {
	NSLog(@"configure:VSModelSummary");
}

+ (NSString*)reuseID {
	return NSStringFromClass([self class]);
}

- (void)awakeFromNib {
    [super awakeFromNib];
	[self setUpChartView];
#if WHITE_THEME
	[self applyThemeWhite];
#else
	[self applyTheme];
#endif
	
}

- (void)prepareForReuse {
//	self.milesValueLabel.text = nil;
//	self.savingsValueLabel.text = nil;
//	self.drivesValueLabel.text = nil;
	
}

- (void)applyThemeWhite {
	self.graphView.backgroundColor = [UIColor clearColor];
	
	self.seperationLineOne.backgroundColor = [VSBranding summarySeperationLineColor];
	self.seperationLineTwo.backgroundColor = [VSBranding summarySeperationLineColor];
	self.seperatinLineWidthConstraint.constant = [[UIScreen mainScreen] scale] * .5f;
	
		//color
	self.backgroundColor = [VSBranding vs_whiteColor];
	self.milesValueLabel.textColor = [VSBranding themeColor];
	self.savingsValueLabel.textColor = [VSBranding themeColor];
	self.drivesValueLabel.textColor = [VSBranding themeColor];
	
	self.milesKeyLabel.textColor = [VSBranding themeColor];
	self.savingsKeyLabel.textColor = [VSBranding themeColor];
	self.drivesKeyLabel.textColor = [VSBranding themeColor];
	
		//fonts
	self.milesValueLabel.font = [VSBranding summaryFont];
	self.savingsValueLabel.font = [VSBranding summaryFont];
	self.drivesValueLabel.font = [VSBranding summaryFont];
	
	self.milesKeyLabel.font = [VSBranding subSmmaryFont];
	self.savingsKeyLabel.font = [VSBranding subSmmaryFont];
	self.drivesKeyLabel.font = [VSBranding subSmmaryFont];
	
		//test+
		//dollar
	UIFont* fontDollar = VS_FONT_EXTRASMALL; //[UIFont fontWithName:@"Futura-Medium" size:12];
	UIColor* dollarColor = [VSBranding themeColor];
	NSDictionary* dollarAttributes = @{
									   NSFontAttributeName:fontDollar,
									   NSForegroundColorAttributeName:dollarColor
									   };
	NSAttributedString* dollarAttrStr = [[NSAttributedString alloc] initWithString:@"$" attributes:dollarAttributes];
	NSMutableAttributedString* attrText = [[NSMutableAttributedString alloc] initWithAttributedString:dollarAttrStr];
	
		//value
	UIFont* fontSavings = VS_FONT_GIANTLIKEBOWENSDIC; //[UIFont fontWithName:@"Futura-Medium" size:40];
	UIColor* savingsColor = [VSBranding themeColor];
	NSDictionary* savingsAttributes = @{
									   NSFontAttributeName:fontSavings,
									   NSForegroundColorAttributeName:savingsColor
									   };
	NSAttributedString* savingsAttrStr = [[NSAttributedString alloc] initWithString:@"1840" attributes:savingsAttributes];
	NSMutableAttributedString* attrSavingsText = [[NSMutableAttributedString alloc] initWithAttributedString:savingsAttrStr];
	
		//combine two attr strings
	[attrText appendAttributedString:attrSavingsText];
	
	
	self.savingsValueLabel.attributedText = attrText;
		//test-

}

- (void)applyTheme {
	self.graphView.backgroundColor = [UIColor clearColor];
	
	self.seperationLineOne.backgroundColor = [VSBranding summarySeperationLineColor];
	self.seperationLineTwo.backgroundColor = [VSBranding summarySeperationLineColor];
	self.seperatinLineWidthConstraint.constant = [[UIScreen mainScreen] scale] * .5f;
	
		//color
	self.backgroundColor = [VSBranding themeColor];
	self.milesValueLabel.textColor = [VSBranding summaryFontColor];
	self.savingsValueLabel.textColor = [VSBranding summaryFontColor];
	self.drivesValueLabel.textColor = [VSBranding summaryFontColor];
	
	self.milesKeyLabel.textColor = [VSBranding subSmmaryFontColor];
	self.savingsKeyLabel.textColor = [VSBranding subSmmaryFontColor];
	self.drivesKeyLabel.textColor = [VSBranding subSmmaryFontColor];
	
		//fonts
	self.milesValueLabel.font = [VSBranding summaryFont];
	self.savingsValueLabel.font = [VSBranding summaryFont];
	self.drivesValueLabel.font = [VSBranding summaryFont];
	
	self.milesKeyLabel.font = [VSBranding subSmmaryFont];
	self.savingsKeyLabel.font = [VSBranding subSmmaryFont];
	self.drivesKeyLabel.font = [VSBranding subSmmaryFont];
	
		//test+
		//dollar
	UIFont* fontDollar = VS_FONT_EXTRASMALL; //[UIFont fontWithName:@"Futura-Medium" size:12];
	UIColor* dollarColor = [VSBranding summaryFontColor];
	NSDictionary* dollarAttributes = @{
									   NSFontAttributeName:fontDollar,
									   NSForegroundColorAttributeName:dollarColor
									   };
	NSAttributedString* dollarAttrStr = [[NSAttributedString alloc] initWithString:@"$" attributes:dollarAttributes];
	NSMutableAttributedString* attrText = [[NSMutableAttributedString alloc] initWithAttributedString:dollarAttrStr];
	
		//value
	UIFont* fontSavings = VS_FONT_GIANTLIKEBOWENSDIC; //[UIFont fontWithName:@"Futura-Medium" size:40];
	UIColor* savingsColor = [VSBranding summaryFontColor];
	NSDictionary* savingsAttributes = @{
										NSFontAttributeName:fontSavings,
										NSForegroundColorAttributeName:savingsColor
										};
	NSAttributedString* savingsAttrStr = [[NSAttributedString alloc] initWithString:@"1840" attributes:savingsAttributes];
	NSMutableAttributedString* attrSavingsText = [[NSMutableAttributedString alloc] initWithAttributedString:savingsAttrStr];
	
		//combine two attr strings
	[attrText appendAttributedString:attrSavingsText];
	
	
	self.savingsValueLabel.attributedText = attrText;
		//test-
	
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark -

- (void)setUpChartView {
//	UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//	[self setView:mainView];
	
	_chartView = [[ANDLineChartView alloc] initWithFrame:CGRectZero];
	[_chartView setTranslatesAutoresizingMaskIntoConstraints:NO];
	[_chartView setDataSource:self];
	[_chartView setDelegate:self];
	[_chartView setAnimationDuration:0.4];
	[self.graphView addSubview:_chartView];
	_elements = [self arrayWithRandomNumbers];
	
	[self setupConstraints];
}

- (void)setupConstraints{
//	id topLayoutGuide = [self topLayoutGuide];
//	NSDictionary *viewsDict = NSDictionaryOfVariableBindings(topLayoutGuide,_chartView);
//	
//	[[self view] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[topLayoutGuide][_chartView]|"
//																		options:0 metrics:nil views:viewsDict]];
//	[[self view] addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_chartView]|" options:0 metrics:nil views:viewsDict]];
	
	UIView* parent = self.graphView;
	
	NSLayoutConstraint* leading = [NSLayoutConstraint constraintWithItem:_chartView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:parent attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
	NSLayoutConstraint* trailing = [NSLayoutConstraint constraintWithItem:_chartView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:parent attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
	NSLayoutConstraint* top = [NSLayoutConstraint constraintWithItem:_chartView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:parent attribute:NSLayoutAttributeTop multiplier:1 constant:0];
	NSLayoutConstraint* bottom = [NSLayoutConstraint constraintWithItem:_chartView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:parent attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
	
	[parent addConstraints:@[
							 leading,
							 trailing,
							 top,
							 bottom
							 ]];
}

	//test+
- (void)randomizeElements{
	__weak VSSummaryTableViewCell *weakSelf = self;
	__weak ANDLineChartView *weakChartView = _chartView;
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		_elements = [weakSelf arrayWithRandomNumbers];
		[weakChartView reloadData];
		[weakSelf randomizeElements];
	});
}

- (NSArray*)arrayWithRandomNumbers{
	_numbersCount = MAX_NUMBER_COUNT;//arc4random_uniform(MAX_NUMBER_COUNT + 1) + 1;
	_maxValue = MAX_NUMBER;//arc4random_uniform(MAX_NUMBER + 1);
	NSMutableArray *array = [NSMutableArray arrayWithCapacity:_numbersCount];
	for(NSUInteger i = 0;i<_numbersCount;i++){
		NSUInteger r = arc4random_uniform((u_int32_t)_maxValue + 1);
		[array addObject:@(r)];
	}
	return array;
}
	//text-

#pragma mark
#pragma mark - ANDLineChartViewDataSource methods

- (NSUInteger)numberOfElementsInChartView:(ANDLineChartView *)graphView{
	return _numbersCount;
}

- (CGFloat)chartView:(ANDLineChartView *)graphView valueForElementAtRow:(NSUInteger)row{
	return [(NSNumber*)_elements[row] floatValue];
}

- (CGFloat)maxValueForGridIntervalInChartView:(ANDLineChartView *)graphView{
	return _maxValue;
}

- (CGFloat)minValueForGridIntervalInChartView:(ANDLineChartView *)graphView{
	return -2.0;
}

- (NSUInteger)numberOfGridIntervalsInChartView:(ANDLineChartView *)graphView{
	return 12.0;
}

- (NSString*)chartView:(ANDLineChartView *)graphView descriptionForGridIntervalValue:(CGFloat)interval{
	return [NSString stringWithFormat:@"%.1f",interval];
}

#pragma mark
#pragma mark - ANDLineChartViewDelegate method

- (CGFloat)chartView:(ANDLineChartView *)graphView spacingForElementAtRow:(NSUInteger)row{
	return (row == 0) ? 60.0 : 30.0;
}


@end
