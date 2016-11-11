//
//  VSAddRideViewController.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/4/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSAddRideViewController.h"
#import "VSLocationPickerTableViewCell.h"
#import "VSSelectedDateTableViewCell.h"
#import "VSChooseDateTableViewCell.h"
#import "VSAddNewRideModelController.h"
#import "VSSectionTitleTableViewCell.h"
#import "VSChooseDateTableViewCell.h"
#import "VSTextPickerTableViewCell.h"
#import "VSNotesTableViewCell.h"
#import "VSExpenseTableViewCell.h"
#import "VSBranding.h"
#import "VSAddExpenseViewController.h"

static const NSInteger kDatePickerTag = 69;
static const NSInteger kStartAddressSectionIndex = 0;
static const NSInteger kEndAddressSectionIndex = 1;
static const NSInteger kDatePickerSectionIndex = 2;
static const NSInteger kPurposeSectionIndex = 3;
static const NSInteger kNotesSectionIndex = 4;
static const NSInteger kExpenseSectionIndex = 5;

static const CGFloat kHeightSectionTitle = 50;
static const CGFloat kHeightRowAddress = 156;
static const CGFloat kHeightRowTime = 45;
static const CGFloat kHeightRowPurpose = 30;
static const CGFloat kHeightSectionDatePicker = 200;


@interface VSAddRideViewController () <UITableViewDelegate, UITableViewDataSource, VSLocationPickerTableViewCellDelegate,
	VSExpenseTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) VSAddNewRideModelController* dataSource;
@property (nonatomic) NSIndexPath* datePickerIndexPath;
@end

@implementation VSAddRideViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
	[self setupNavBar];
	
		//[self testAddChooseDateCell];
	[self testAddDataToTableViewDataSource];
}

- (void)setupNavBar {
	self.title = @"Add New Ride";
	
	UIImage* closeImg = [UIImage imageNamed:@"ic_close_white"];
	closeImg = [closeImg imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:closeImg style:UIBarButtonItemStylePlain target:self action:@selector(didTapCancelButton:)];
	self.navigationItem.leftBarButtonItem.tintColor = [VSBranding vs_darkGrayColor];
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(didTapSaveButton:)];
	NSDictionary* attributes = @{NSForegroundColorAttributeName:[VSBranding vs_darkGrayColor],
								 NSFontAttributeName:VS_FONT_SMALL};
	[self.navigationItem.rightBarButtonItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
}

- (void)didTapCancelButton:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didTapSaveButton:(id)sender {
		//XXX
	NSLog(@"save stuff here");
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self setupTableView];
}

- (BOOL)prefersStatusBarHidden {
	return NO;
}

#pragma mark - setup views
- (void)setupTableView {
	[self.tableView setDelegate:self];
	[self.tableView setDataSource:self];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
	if ([cell.reuseIdentifier isEqualToString:[VSSelectedDateTableViewCell reuseID]]) {
		[self showChooseDateCellAtIndexPath:indexPath];
	}
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
	CGFloat ht;
	if (kStartAddressSectionIndex == indexPath.section || kEndAddressSectionIndex == indexPath.section) {
		if (0 == indexPath.row) {
			ht = kHeightSectionTitle;
		} else {
			ht = kHeightRowAddress;
		}
	} else if (kDatePickerSectionIndex == indexPath.section) {
		if (0 == indexPath.row) {
			ht = kHeightSectionTitle;
		} else {
			if ([self isDatePickerCell:indexPath]) {
				ht = kHeightSectionDatePicker;
			} else {
				ht = kHeightRowTime;
			}
		}
	} else if (kPurposeSectionIndex == indexPath.section) {
		if (0 == indexPath.row) {
			ht = kHeightSectionTitle;
		} else {
			ht = kHeightRowPurpose;
		}
	} else if (kNotesSectionIndex== indexPath.section) {
		if (0 == indexPath.row) {
			ht = kHeightSectionTitle;
		} else {
			ht = 120.f;
		}
	} else if (kExpenseSectionIndex== indexPath.section) {
		if (0 == indexPath.row) {
			ht = kHeightSectionTitle;
		} else {
			ht = 60.f;
		}
	}
	return ht;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	CGFloat ht;
	if (kStartAddressSectionIndex == indexPath.section || kEndAddressSectionIndex == indexPath.section) {
		if (0 == indexPath.row) {
			ht = kHeightSectionTitle;
		} else {
			ht = kHeightRowAddress;
		}
	} else if (kDatePickerSectionIndex == indexPath.section) {
		if (0 == indexPath.row) {
			ht = kHeightSectionTitle;
		} else {
			if ([self isDatePickerCell:indexPath]) {
				ht = kHeightSectionDatePicker;
			} else {
				ht = kHeightRowTime;
			}
		}
	} else if (kPurposeSectionIndex == indexPath.section) {
		if (0 == indexPath.row) {
			ht = kHeightSectionTitle;
		} else {
			ht = kHeightRowPurpose;
		}
	} else if (kNotesSectionIndex== indexPath.section) {
		if (0 == indexPath.row) {
			ht = kHeightSectionTitle;
		} else {
			ht = 120.f;
		}
	} else if (kExpenseSectionIndex== indexPath.section) {
		if (0 == indexPath.row) {
			ht = kHeightSectionTitle;
		} else {
			ht = 60.f;
		}
	}
	return ht;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return self.dataSource.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSInteger rows = [self.dataSource rowsInSection:section];
	if (section == kDatePickerSectionIndex && [self hasDatePickerCell]) {
		rows++;
	}
	return rows;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (kStartAddressSectionIndex == indexPath.section || kEndAddressSectionIndex == indexPath.section) {
		if (0 == indexPath.row) {
			VSSectionTitleTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[VSSectionTitleTableViewCell reuseID]];
			NSDictionary* model = [self.dataSource itemForIndexPath:indexPath];
			[cell configureWithModel:model];
			return cell;
		} else {
			BOOL showWhiteMast = NO;
			if (1 == indexPath.section) {
				showWhiteMast = YES;
			} else {
				showWhiteMast = NO;
			}
			VSLocationPickerTableViewCell* cell = (VSLocationPickerTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"VSLocationPickerTableViewCell"];
			cell.delegate = self;
				//XXX - get model here
			[cell configure:showWhiteMast];
			return cell;
		}
	} else if (kDatePickerSectionIndex == indexPath.section) {
			//adjust the row number
		NSInteger modelRow = indexPath.row;
		if ([self hasDatePickerCell] && self.datePickerIndexPath.row <= indexPath.row) {
			modelRow--;
		}
		if (0 == indexPath.row) {
			VSSectionTitleTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[VSSectionTitleTableViewCell reuseID]];
			NSDictionary* model = [self.dataSource itemForIndexPath:indexPath];
			[cell configureWithModel:model];
			return cell;
		}
		
		if ([self isDatePickerCell:indexPath]) {
			VSChooseDateTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[VSChooseDateTableViewCell reuseID]];
				//XXX - here we dont store the model
			NSDictionary* model = nil; // [self.dataSource itemForIndexPath:indexPath];
			[cell configureWithModel:model];
			return cell;
		} else {
			VSSelectedDateTableViewCell* cell = (VSSelectedDateTableViewCell*)[tableView dequeueReusableCellWithIdentifier:[VSSelectedDateTableViewCell reuseID]];
			
			NSIndexPath* modifiedPath = [NSIndexPath indexPathForRow:modelRow inSection:kDatePickerSectionIndex];
			NSDictionary* model = [self.dataSource itemForIndexPath:modifiedPath];
			[cell configureWithModel:model];
			return cell;
		}
	} else if (kPurposeSectionIndex == indexPath.section) {
		if (0 == indexPath.row) {
			VSSectionTitleTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[VSSectionTitleTableViewCell reuseID]];
			NSDictionary* model = [self.dataSource itemForIndexPath:indexPath];
			[cell configureWithModel:model];
			return cell;
		} else {
			VSTextPickerTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[VSTextPickerTableViewCell reuseID]];
			NSDictionary* model = [self.dataSource itemForIndexPath:indexPath];
			[cell configureWithModel:model];
			return cell;
		}
	} else if (kNotesSectionIndex == indexPath.section) {
		if (0 == indexPath.row) {
			VSSectionTitleTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[VSSectionTitleTableViewCell reuseID]];
			NSDictionary* model = [self.dataSource itemForIndexPath:indexPath];
			[cell configureWithModel:model];
			return cell;
		} else {
			VSNotesTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[VSNotesTableViewCell reuseID]];
			NSDictionary* model = [self.dataSource itemForIndexPath:indexPath];
			[cell configureWithModel:model];
			return cell;
		}
	} else if (kExpenseSectionIndex == indexPath.section) {
		if (0 == indexPath.row) {
			VSSectionTitleTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[VSSectionTitleTableViewCell reuseID]];
			NSDictionary* model = [self.dataSource itemForIndexPath:indexPath];
			[cell configureWithModel:model];
			return cell;
		} else {
			VSExpenseTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[VSExpenseTableViewCell reuseID]];
			cell.delegate = self;
			NSDictionary* model = [self.dataSource itemForIndexPath:indexPath];
			[cell configureWithModel:model];
			return cell;
		}
	}
	return nil;
}

#pragma mark - utils
- (BOOL)hasDatePickerCell {
	return self.datePickerIndexPath != nil;
}
- (BOOL)isDatePickerCell:(NSIndexPath*)indexPath {
	return ( ([self hasDatePickerCell]) && (self.datePickerIndexPath.row == indexPath.row) );
}
- (void)showChooseDateCellAtIndexPath:(NSIndexPath*)indexpath {
	[self.tableView beginUpdates];
	[self doShowChooseDateCellAtIndexPath:indexpath];
	[self.tableView endUpdates];
}
- (void)doShowChooseDateCellAtIndexPath:(NSIndexPath*)indexpath {
	BOOL before = NO;
	if ([self hasDatePickerCell]) {
		before = self.datePickerIndexPath.row < indexpath.row;
	}
	BOOL sameCellTapped = (self.datePickerIndexPath.row - 1 == indexpath.row);
	if ([self hasDatePickerCell]) {
		[self removeCurrentlyDisplayedDatePickerCell];
	}
	if (!sameCellTapped) {
			//hide old and display new picker
		NSInteger rowToReveal = indexpath.row;
		if (before) {
			rowToReveal = rowToReveal - 1;
		}
		NSIndexPath* indexpathToShow = [NSIndexPath indexPathForRow:rowToReveal inSection:kDatePickerSectionIndex];
		[self toggleDatePickerForSelectedIndexPath:indexpathToShow];
		self.datePickerIndexPath = [NSIndexPath indexPathForRow:indexpathToShow.row + 1 inSection:kDatePickerSectionIndex];
	}
}
- (void)toggleDatePickerForSelectedIndexPath:(NSIndexPath*)indexPath {
	NSIndexPath* path = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:kDatePickerSectionIndex];
	NSArray<NSIndexPath*>* paths = @[path];
	if ([self hasDatePickerBelowIndexpath:indexPath]) { //remove it
		[self.tableView deleteRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationFade];
	} else { //nothing found, add a new
		[self.tableView insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationFade];
	}
}
- (void)removeCurrentlyDisplayedDatePickerCell {
	NSIndexPath* rowToBeDeleted = [NSIndexPath indexPathForRow:self.datePickerIndexPath.row inSection:self.datePickerIndexPath.section];
	[self.tableView deleteRowsAtIndexPaths:@[rowToBeDeleted] withRowAnimation:UITableViewRowAnimationFade];
	self.datePickerIndexPath = nil;
}
- (BOOL)hasDatePickerBelowIndexpath:(NSIndexPath*)indexPath {
	NSInteger row = indexPath.row;
	row++;
	
	NSIndexPath* pickerPath = [NSIndexPath indexPathForRow:row inSection:kDatePickerSectionIndex];
	UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:pickerPath];
	UIDatePicker* datepicker = [cell viewWithTag:kDatePickerTag];
	
	BOOL ret = datepicker != nil;
	return ret;
}

#pragma mark - VSLocationPickerTableViewCellDelegate

- (void)willStartShowingSearchResults:(VSLocationPickerTableViewCell*)pickerViewCell {
	NSLog(@"willStartShowingSearchResults");
		//which cell is this?
		//based on cell type, scroll the table view up or down
	
	NSIndexPath* indexpath = [self.tableView indexPathForCell:pickerViewCell];
	if (indexpath.section == kStartAddressSectionIndex) {
		NSLog(@"you tapped in start-address cell edit textfiled");
	} else if (indexpath.section == kEndAddressSectionIndex) {
		NSLog(@"you tapped in end-address cell edit textfiled");
	}
	
	CGFloat factor = 44;
	CGRect r = CGRectMake(0, factor, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - factor);
	[self.tableView scrollRectToVisible:r animated:YES];
}
- (void)didStartShowingSearchResults:(VSLocationPickerTableViewCell*)pickerViewCell {
	NSLog(@"didStartShowingSearchResults");
}

#pragma mark - VSExpenseTableViewCellDelegate
- (void)didTapOnAddExpenseButton:(VSExpenseTableViewCell*)cell {
	NSLog(@"didTapOnAddExpenseButton:cell");
	UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	VSAddExpenseViewController* expenseVC = [sb instantiateViewControllerWithIdentifier:@"VSAddExpenseViewController"];
	[self.navigationController pushViewController:expenseVC animated:YES];
}


	// XXX use model here later
#pragma mark - test
- (void)testAddDataToTableViewDataSource {
	self.dataSource = [[VSAddNewRideModelController alloc] init];
}

- (void)testAddChooseDateCell {
	if (self.datePickerIndexPath != nil) {
		self.datePickerIndexPath = nil;
	}
	self.datePickerIndexPath = [NSIndexPath indexPathForRow:3 inSection:2];
}

@end
