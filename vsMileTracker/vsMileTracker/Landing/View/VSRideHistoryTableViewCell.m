//
//  VSRideHistoryTableViewCell.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 8/19/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "VSRideHistoryTableViewCell.h"
#import "VSBranding.h"

@interface VSRideHistoryTableViewCell()

	// ----------------------------------------------
#pragma mark - TOP VIEW (ADDRESS - to / from)
	// ----------------------------------------------

@property (weak, nonatomic) IBOutlet UIView *topAddressView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *moreTopButton;


	//left view with home<->work and vertical line
@property (weak, nonatomic) IBOutlet UIImageView *homeImageView; //source
@property (weak, nonatomic) IBOutlet UIImageView *workImageView; //destination

@property (weak, nonatomic) IBOutlet UIView *horizontalSperatorLine;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *layoutConstraintHomeWorkWidth;

	//home/source address
@property (weak, nonatomic) IBOutlet UILabel *sourceAddress;
@property (weak, nonatomic) IBOutlet UILabel *destinationAddressLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *layoutConstraintHeightSeperator;
@property (weak, nonatomic) IBOutlet UIView *verticalSeperatorLine;

	//views/containers - for setting backgroundcolor
@property (weak, nonatomic) IBOutlet UIView *lhsIconsView; //containing home <-> work icons and vertical seperator line between two
@property (weak, nonatomic) IBOutlet UIView *sourceAddressContainerView;
@property (weak, nonatomic) IBOutlet UIView *destinationAddressContainerView;
@property (weak, nonatomic) IBOutlet UIView *bottomContainerView;

	// ----------------------------------------------
#pragma mark - MIDDLE VIEW (map view)
	// ----------------------------------------------
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

	// ----------------------------------------------
#pragma mark - BOTTOM VIEW (action)
	// ----------------------------------------------
@property (weak, nonatomic) IBOutlet UIView *bottommostView;

	//drive type view
@property (weak, nonatomic) IBOutlet UIView *driveTypeView;
@property (weak, nonatomic) IBOutlet UIImageView *driveTypeImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameDriveTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *instructionLabel;

	//vehicle type view
@property (weak, nonatomic) IBOutlet UIView *vehicleTypeView;
@property (weak, nonatomic) IBOutlet UIImageView *vehicleTypeImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameVehicleLabel;
@property (weak, nonatomic) IBOutlet UILabel *instructionVehicleLabel;

	//trip purpose
@property (weak, nonatomic) IBOutlet UIView *purposeView;
@property (weak, nonatomic) IBOutlet UIImageView *purposeImageView;
@property (weak, nonatomic) IBOutlet UILabel *purposeTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *purposeSubTitleLabel;

	//expense view
@property (weak, nonatomic) IBOutlet UIView *expenseView;
@property (weak, nonatomic) IBOutlet UIImageView *expenseImageView;
@property (weak, nonatomic) IBOutlet UILabel *expenseTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *expenseSubTitle;

@property (weak, nonatomic) IBOutlet UILabel *savingsPriceLabel;

@end

@implementation VSRideHistoryTableViewCell

- (void)configure:(VSModelRide*)model {
	NSLog(@"configure:VSModelRide");
	self.timeLabel.text = model.formattedTime;
	self.sourceAddress.text = model.addressSource;
	self.destinationAddressLabel.text = model.addressDestination;
	self.savingsPriceLabel.text = model.promotedPrice;
	self.nameDriveTypeLabel.text = model.classifyValue;
	self.instructionLabel.text = model.classifyKey;
	self.nameVehicleLabel.text = model.vehicleTypeValue;
	self.instructionVehicleLabel.text = model.vehicleTypeKey;
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
	
	self.backgroundColor = [VSBranding vs_whiteColor];
	
	[self applyThemeTopView];
	[self applyThemeMiddleView];
	[self applyThemeBottomView];
}

- (void)applyThemeTopView {
	UIImage* img = [UIImage imageNamed:@"ic_more_horiz"];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	
	[self.moreTopButton setImage:img forState:UIControlStateNormal];
	self.moreTopButton.tintColor = [VSBranding timeColor];
	
	self.horizontalSperatorLine.backgroundColor = [VSBranding summarySeperationLineColor];
	self.verticalSeperatorLine.backgroundColor = [VSBranding summarySeperationLineColor];
	self.layoutConstraintHomeWorkWidth.constant = [[UIScreen mainScreen] scale] * .5f;
	self.layoutConstraintHeightSeperator.constant = [[UIScreen mainScreen] scale] * .5f;
	
		//color
	self.topAddressView.backgroundColor = [VSBranding addressTopContainerBgColor];
	self.bottomContainerView.backgroundColor = [UIColor clearColor];
	self.lhsIconsView.backgroundColor = [UIColor clearColor];
	self.sourceAddressContainerView.backgroundColor = [UIColor clearColor];
	self.destinationAddressContainerView.backgroundColor = [UIColor clearColor];
	
	self.sourceAddress.textColor = [VSBranding addressFontColor];
	self.destinationAddressLabel.textColor = [VSBranding addressFontColor];
	
		//fonts
	self.sourceAddress.font = [VSBranding addressFont];
	self.destinationAddressLabel.font = [VSBranding addressFont];
	self.timeLabel.font = [VSBranding subSmmaryFont];
	self.timeLabel.textColor = [VSBranding timeColor];
	
		//image icons
	
		//SOURCE address icon
	img = [UIImage imageNamed:@"circle_filled_icon"];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	self.homeImageView.image = img;
	self.homeImageView.tintColor = [VSBranding rideCellSourceAddressIconColor];
		//DESTINATION address icon
	img = [UIImage imageNamed:@"circle_filled_icon"];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	self.workImageView.image = img;
	self.workImageView.tintColor = [VSBranding rideCellDestinationAddressIconColor];
	
}

- (void)applyThemeMiddleView {
	self.savingsPriceLabel.backgroundColor = [VSBranding priceLabelBgColor];
	self.savingsPriceLabel.layer.cornerRadius = 5.f;
	self.savingsPriceLabel.layer.masksToBounds = YES;
	
	self.mapView.userInteractionEnabled = NO;
	
		//test+
		//san francisco
//	double sanFranciscoLat = 37.7749;
//	double sanFranciscoLongitude = -122.4194;
	
		//santa monica
	double sanFranciscoLat = 34.0195;
	double sanFranciscoLongitude = -118.4912;
	
	//test-
	CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(sanFranciscoLat, sanFranciscoLongitude);
	MKCoordinateSpan span;
	span.longitudeDelta = 0.02;
	span.latitudeDelta = 0.02;
	
	MKCoordinateRegion region;
	region.center = coords;
	region.span = span;
	
	[self.mapView setRegion:region];
	
}

- (void)applyThemeBottomView {
	
		//color
	self.bottommostView.backgroundColor = [VSBranding vs_lightGrayColor];
	
		//drive type view
	self.driveTypeView.backgroundColor = [VSBranding travelBottomBgColor];
	
	UIImage* img = [UIImage imageNamed:@"ic_business_white"];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	self.driveTypeImageView.image = img;
	self.driveTypeImageView.tintColor = [VSBranding rideCellActionIconColor];
	
	self.nameDriveTypeLabel.textColor = [VSBranding actionTitleTextColor];
	self.nameDriveTypeLabel.font = [VSBranding actionTitleFont];
	
	self.instructionLabel.textColor = [VSBranding actionSubTitleTextColor];
	self.instructionLabel.font = [VSBranding actionSubTitleFont];
	
		//vehicle type
	self.vehicleTypeView.backgroundColor = [VSBranding travelBottomBgColor];
	
	img = [UIImage imageNamed:@"ic_directions_car_white_36pt"];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	self.vehicleTypeImageView.image = img;
	self.vehicleTypeImageView.tintColor = [VSBranding rideCellActionIconColor];
	
	self.nameVehicleLabel.textColor = [VSBranding actionTitleTextColor];
	self.nameVehicleLabel.font = [VSBranding actionTitleFont];
	
	self.instructionVehicleLabel.textColor = [VSBranding actionSubTitleTextColor];
	self.instructionVehicleLabel.font = [VSBranding actionSubTitleFont];
	
		//trip purpose
	self.purposeView.backgroundColor = [VSBranding travelBottomBgColor];
	
	img = [UIImage imageNamed:@"ic_event_white_48pt"];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	self.purposeImageView.image = img;
	self.purposeImageView.tintColor = [VSBranding rideCellActionIconColor];
	
	self.purposeTitleLabel.textColor = [VSBranding actionTitleTextColor];
	self.purposeTitleLabel.font = [VSBranding actionTitleFont];
	
	self.purposeSubTitleLabel.textColor = [VSBranding actionSubTitleTextColor];
	self.purposeSubTitleLabel.font = [VSBranding actionSubTitleFont];
	
		//expense type
	self.expenseView.backgroundColor = [VSBranding travelBottomBgColor];
	
	img = [UIImage imageNamed:@"ic_payment_white_48pt"];
	img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	self.expenseImageView.image = img;
	self.expenseImageView.tintColor = [VSBranding rideCellActionIconColor];
	
	self.expenseTitleLabel.textColor = [VSBranding actionTitleTextColor];
	self.expenseTitleLabel.font = [VSBranding actionTitleFont];
	
	self.expenseSubTitle.textColor = [VSBranding actionSubTitleTextColor];
	self.expenseSubTitle.font = [VSBranding actionSubTitleFont];
	
	[self addActionToBottomView];
}

- (void)addActionToBottomView {
		//drivetype
	self.driveTypeView.userInteractionEnabled = YES;
	UITapGestureRecognizer* singletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapDriveView:)];
	singletap.numberOfTapsRequired = 1;
	[self.driveTypeView addGestureRecognizer:singletap];
	
		//vehicletype
	self.vehicleTypeView.userInteractionEnabled = YES;
	singletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapVehicleTypeView:)];
	singletap.numberOfTapsRequired = 1;
	[self.vehicleTypeView addGestureRecognizer:singletap];
	
		//vehicletype
	self.purposeView.userInteractionEnabled = YES;
	singletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapPurposeView:)];
	singletap.numberOfTapsRequired = 1;
	[self.purposeView addGestureRecognizer:singletap];
	
		//add expense
	self.expenseView.userInteractionEnabled = YES;
	singletap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAddExpenseView:)];
	singletap.numberOfTapsRequired = 1;
	[self.expenseView addGestureRecognizer:singletap];
}

- (void)didTapDriveView:(id)sender {
	NSLog(@"didTapDriveView");
	if ([self.delegateRide conformsToProtocol:@protocol(VSRideHistoryTableViewCellDelegate)]) {
		if ([self.delegateRide respondsToSelector:@selector(didTapDriveViewIn:)]) {
			[self.delegateRide didTapDriveViewIn:self];
		}
	}
}

- (void)didTapVehicleTypeView:(id)sender {
	NSLog(@"didTapVehicleTypeView");
	if ([self.delegateRide conformsToProtocol:@protocol(VSRideHistoryTableViewCellDelegate)]) {
		if ([self.delegateRide respondsToSelector:@selector(didTapVehicleTypeViewIn:)]) {
			[self.delegateRide didTapVehicleTypeViewIn:self];
		}
	}
}

- (void)didTapPurposeView:(id)sender {
	NSLog(@"didTapPurposeView");
	if ([self.delegateRide conformsToProtocol:@protocol(VSRideHistoryTableViewCellDelegate)]) {
		if ([self.delegateRide respondsToSelector:@selector(didTapPurposeViewIn:)]) {
			[self.delegateRide didTapPurposeViewIn:self];
		}
	}
}

- (void)didTapAddExpenseView:(id)sender {
	NSLog(@"didTapAddExpenseView");
	if ([self.delegateRide conformsToProtocol:@protocol(VSRideHistoryTableViewCellDelegate)]) {
		if ([self.delegateRide respondsToSelector:@selector(didTapAddExpenseViewIn:)]) {
			[self.delegateRide didTapAddExpenseViewIn:self];
		}
	}
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];
}

@end
