//
//  ViewController.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 8/19/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "ViewController.h"
#import "VSDrivesDataSource.h"
#import "VSSummaryTableViewCell.h"
#import "VSRideHistoryTableViewCell.h"
#import "VSNotificationsTableViewCell.h"
#import "VSTravelTableViewCell.h"
#import "VSBranding.h"
#import "VSModelBase.h"
#import "VSModelBaseDelegate.h"
#import "VSModelSummary.h"
#import "VSModelNotification.h"
#import "VSModelRide.h"
#import "VSModelTravel.h"

	//other view controllers
#import "VSAddRideViewController.h"
#import "VSSettingsViewController.h"
#import "VSAddExpenseViewController.h"

static NSString* const kSegueAddExpense = @"segueAddExpense";

@interface ViewController () <UITableViewDelegate, VSRideHistoryTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) VSDrivesDataSource* tableDataSource;
@property (nonatomic) NSMutableArray<VSModelBase*>* dataSource;
@end

@implementation ViewController

- (BOOL)prefersStatusBarHidden {
	return NO;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.title = @"My Rides";
	[self decorateNavigationBar];
	
	self.dataSource = [NSMutableArray array];
		//test+
	NSString* reuseidSummary = [VSSummaryTableViewCell reuseID];
	NSString* reuseidRideHistory = [VSRideHistoryTableViewCell reuseID];
	NSString* reuseidTravelHistory = [VSTravelTableViewCell reuseID];
	NSString* reuseidNotifications = [VSNotificationsTableViewCell reuseID];
	
	
	VSModelBase* m0 = [[VSModelSummary alloc] initWithReuseID:reuseidSummary];
	[self.dataSource addObject:m0];
	
		//VSModelBase* m1 = [[VSModelNotification alloc] initWithReuseID:reuseidNotifications];
		//[self.dataSource addObject:m1]; // XXX - Phase 2?? or 3
	
	VSModelRide* m2 = [[VSModelRide alloc] initWithReuseID:reuseidRideHistory];
	m2.formattedTime = @"Yesterday 2:51 PM";
	m2.addressSource = @"Home";
	m2.addressDestination = @"Work";
	m2.promotedPrice = @"$56";
	m2.classifyValue = @"Business";
	m2.classifyKey = @"CLASSIFY";
	m2.vehicleTypeValue = @"Corolla";
	m2.vehicleTypeKey = @"VEHICLE TYPE";
	m2.purposeValue = @"Office Commute";
	m2.purposeKey = @"PURPOSE";
	m2.expenseValue = @"$69";
	m2.expenseKey = @"ADD EXPENSE";
	[self.dataSource addObject:m2];
	
	VSModelTravel* m3 = [[VSModelTravel alloc] initWithReuseID:reuseidTravelHistory];
	m3.formattedTime = @"Yesterday 3:00 AM";
	m3.titleTravel = @"Business trip to Los Angeles";
	m3.promotedPrice = @"$490";
	m3.purposeValue = @"Business";
	m3.purposeKey = @"PURPOSE";
	m3.expenseValue = @"$32";
	m3.expenseKey = @"ADD EXPENSE";
		//[self.dataSource addObject:m3];
	
	VSModelRide* m4 = [[VSModelRide alloc] initWithReuseID:reuseidRideHistory];
	m4.formattedTime = @"Aug 24, 5:51 PM";
	m4.addressSource = @"Work";
	m4.addressDestination = @"Home";
	m4.promotedPrice = @"$156";
	m4.classifyValue = @"Business";
	m4.classifyKey = @"CLASSIFY";
	m4.vehicleTypeValue = @"Corolla";
	m4.vehicleTypeKey = @"VEHICLE TYPE";
	m4.purposeValue = @"Commute";
	m4.purposeKey = @"PURPOSE";
	m4.expenseValue = @"$169";
	m4.expenseKey = @"ADD EXPENSE";
	[self.dataSource addObject:m4];
	
	VSModelTravel* m13 = [[VSModelTravel alloc] initWithReuseID:reuseidTravelHistory];
	m13.formattedTime = @"Aug 22 3:10 PM";
	m13.titleTravel = @"Business trip to San Diego";
	m13.promotedPrice = @"$240";
	m13.purposeValue = @"Business";
	m13.purposeKey = @"PURPOSE";
	m13.expenseValue = @"$32";
	m13.expenseKey = @"ADD EXPENSE";
		//[self.dataSource addObject:m13];
	
	VSModelRide* m5 = [[VSModelRide alloc] initWithReuseID:reuseidRideHistory];
	m5.formattedTime = @"Aug 12, 7:51 PM";
	m5.addressSource = @"1234 Valencia St., San Francisco";
	m5.addressDestination = @"Golden Gate Bridge, San Francisco";
	m5.promotedPrice = @"$12";
	m5.classifyValue = @"Personal";
	m5.classifyKey = @"CLASSIFY";
	m5.vehicleTypeValue = @"Corolla";
	m5.vehicleTypeKey = @"VEHICLE TYPE";
	m5.purposeValue = @"Beach";
	m5.purposeKey = @"PURPOSE";
	m5.expenseValue = @"$19";
	m5.expenseKey = @"ADD EXPENSE";
	[self.dataSource addObject:m5];
	
	VSModelRide* m6 = [[VSModelRide alloc] initWithReuseID:reuseidRideHistory];
	m6.formattedTime = @"Aug 04, 5:04 AM";
	m6.addressSource = @"Home";
	m6.addressDestination = @"3324 22nd St., San Francisco";
	m6.promotedPrice = @"$36";
	m6.classifyValue = @"Personal";
	m6.classifyKey = @"CLASSIFY";
	m6.vehicleTypeValue = @"Corolla";
	m6.vehicleTypeKey = @"VEHICLE TYPE";
	m6.purposeValue = @"Haircut";
	m6.purposeKey = @"PURPOSE";
	m6.expenseValue = @"$169";
	m6.expenseKey = @"ADD EXPENSE";
	[self.dataSource addObject:m6];
	
	VSModelTravel* m23 = [[VSModelTravel alloc] initWithReuseID:reuseidTravelHistory];
	m23.formattedTime = @"Aug 03, 11:23 AM";
	m23.titleTravel = @"Recruitment in Seattle";
	m23.promotedPrice = @"$458";
	m23.purposeValue = @"Business";
	m23.purposeKey = @"PURPOSE";
	m23.expenseValue = @"$675";
	m23.expenseKey = @"ADD EXPENSE";
		//[self.dataSource addObject:m23];
	
	VSModelTravel* m33 = [[VSModelTravel alloc] initWithReuseID:reuseidTravelHistory];
	m33.formattedTime = @"Aug 01, 10:14 AM";
	m33.titleTravel = @"Business trip to Los Angeles";
	m33.promotedPrice = @"$294";
	m33.purposeValue = @"Business";
	m33.purposeKey = @"PURPOSE";
	m33.expenseValue = @"$352";
	m33.expenseKey = @"ADD EXPENSE";
		//[self.dataSource addObject:m33];
		//test-
	
	[self setUpTableView];
	[self setUpNavbarItems];
}

- (void)decorateNavigationBar {
	[self.navigationController.navigationBar setBarTintColor:[VSBranding navBarColor]];
	[self.navigationController.navigationBar setTranslucent:NO];
	
		//remove seperator
	[self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
	[self.navigationController.navigationBar setShadowImage:[UIImage new]];
	
		//font
	UIFont* font = [VSBranding navBarFont];
	NSDictionary* dic = @{
						  NSFontAttributeName : font,
						  NSForegroundColorAttributeName : [VSBranding themeColor]
						  };
	self.navigationController.navigationBar.titleTextAttributes = dic;
//	[self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
//	[self setNeedsStatusBarAppearanceUpdate];
}

- (void)setUpNavbarItems {
	UIImage* settingsImg = [UIImage imageNamed:@"ic_settings_white"];
	UIBarButtonItem* settings = [[UIBarButtonItem alloc] initWithImage:settingsImg style:UIBarButtonItemStylePlain target:self action:@selector(didTapSettingsBtn:)];
	settings.tintColor = [VSBranding themeColor];
	self.navigationItem.leftBarButtonItems = @[settings];
	
	UIImage* plusImg = [UIImage imageNamed:@"ic_add_circle_outline_white"];
	UIBarButtonItem* rhsAddExpenseBtn = [[UIBarButtonItem alloc] initWithImage:plusImg style:UIBarButtonItemStylePlain target:self action:@selector(didTapAddExpenseBtn:)];
	rhsAddExpenseBtn.tintColor = [VSBranding themeColor];
	
	UIImage* filterImg = [UIImage imageNamed:@"ic_filter_list_white"];
	UIBarButtonItem* rhsFilterBtn = [[UIBarButtonItem alloc] initWithImage:filterImg style:UIBarButtonItemStylePlain target:self action:@selector(didTapFilterBtn:)];
	rhsFilterBtn.tintColor = [VSBranding themeColor];
	
	self.navigationItem.rightBarButtonItems = @[rhsAddExpenseBtn, rhsFilterBtn];
}

- (void)didTapFilterBtn:(id)sender {
	
}

- (void)didTapAddExpenseBtn:(id)sender {
	[self gotoAddNewRideVC];
}

- (void)didTapSettingsBtn:(id)sender {
	UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Settings" bundle:nil];
	VSSettingsViewController* settingsVC = (VSSettingsViewController*)[sb instantiateViewControllerWithIdentifier:@"VSSettingsViewController"];
	UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:settingsVC];
	[self presentViewController:navVC animated:YES completion:nil];
}

- (void)gotoAddNewRideVC {
	UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	VSAddRideViewController* addNewRideVC = (VSAddRideViewController*)[sb instantiateViewControllerWithIdentifier:@"VSAddRideViewController"];
	UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:addNewRideVC];
	[self presentViewController:navVC animated:YES completion:nil];
}

- (void)setUpTableView {
	self.tableView.dataSource = self.tableDataSource;
	UIView* header = [[UIView alloc] initWithFrame:CGRectZero];
		//XXX - this should have the month selector
	header.backgroundColor = [VSBranding themeColor];
		//self.tableView.tableHeaderView = header;
}

- (BOOL)isNotificationsCell:(NSIndexPath*)indexPath {
	if (indexPath.section == 1) {
		return YES;
	}
	return NO;
}
- (BOOL)isTravelCell:(NSIndexPath*)indexPath {
	if (indexPath.section == 3) {
		return YES;
	}
	return NO;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
	VSModelBase* item = self.dataSource[indexPath.section];
	CGFloat h = 0;
	if ([item conformsToProtocol:@protocol(VSModelBaseDelegate)]) {
		h = [item height];
	}
	return h;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	VSModelBase* item = self.dataSource[indexPath.section];
	CGFloat h = 0;
	if ([item conformsToProtocol:@protocol(VSModelBaseDelegate)]) {
		h = [item height];
	}
	return h;
}

#pragma mark - tableDataSource
- (VSDrivesDataSource*)tableDataSource {
	if (!_tableDataSource) {
		VSDrivesDataSource* tblDS = [[VSDrivesDataSource alloc] initWithBlock:^(id cell, id model) {
			NSLog(@"configure cell here");
			if ([cell respondsToSelector:@selector(configure:)]) {
				[cell configure:model];
			}
		} item:self.dataSource delegate:self];
		_tableDataSource = tblDS;
	}
	return _tableDataSource;
}

#pragma mark - VSRideHistoryTableViewCellDelegate
- (void)didTapDriveViewIn:(VSRideHistoryTableViewCell*)cell {
	NSLog(@"didTapDriveViewIn");
	[self showAlertController:@"Drive Type" message:@"Message here"];
}

- (void)didTapVehicleTypeViewIn:(VSRideHistoryTableViewCell*)cell {
	NSLog(@"didTapVehicleTypeViewIn");
}

- (void)didTapPurposeViewIn:(VSRideHistoryTableViewCell*)cell {
	NSLog(@"didTapPurposeViewIn");
}

- (void)didTapAddExpenseViewIn:(VSRideHistoryTableViewCell*)cell {
	NSLog(@"didTapAddExpenseViewIn");
	[self performSegueWithIdentifier:kSegueAddExpense sender:cell];
}

- (void)showAlertController:(NSString*)title message:(NSString*)message {
	UIAlertController* alertController = [UIAlertController alertControllerWithTitle:title
																			 message:message preferredStyle:UIAlertControllerStyleActionSheet];
	UIAlertAction* business = [UIAlertAction actionWithTitle:@"Business" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		NSLog(@"selected business type");
	}];
	[alertController addAction:business];
	UIAlertAction* personal = [UIAlertAction actionWithTitle:@"Personal" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		NSLog(@"selected personal type");
	}];
	[alertController addAction:personal];
	UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		[self dismissViewControllerAnimated:YES completion:nil];
	}];
	[alertController addAction:cancel];
	[self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([kSegueAddExpense isEqualToString:segue.identifier]) {
		VSAddExpenseViewController* addexpenseVC = nil;
		UIViewController* vc = segue.destinationViewController;
		if ([vc isKindOfClass:[UINavigationController class]]) {
			UINavigationController* navvc = (UINavigationController*)vc;
			addexpenseVC = (VSAddExpenseViewController*)[[navvc viewControllers] firstObject];
			addexpenseVC.modal = YES;
		}
	}
}
#pragma mark - unwind segue
- (IBAction)prepareForUnwindSegue:(UIStoryboardSegue*)segue {
	NSLog(@"prepareForUnwindSegue");
}


@end
