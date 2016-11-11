//
//  VSAddRideViewController.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/4/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSAddRideViewController.h"
#import "VSLocationPickerTableViewCell.h"
#import "VSDatePickerTableViewCell.h"

@interface VSAddRideViewController () <UITableViewDelegate, UITableViewDataSource, VSDatePickerTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSMutableArray* dataSource;
@property (nonatomic, weak) VSDatePickerTableViewCell* startDatePickerCell;
@property (nonatomic, weak) VSDatePickerTableViewCell* endDatePickerCell;

@property (nonatomic) NSIndexPath* startTimeIndexpath;
@property (nonatomic) NSIndexPath* endTimeIndexpath;

@end

@implementation VSAddRideViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"Add New Ride";
	
	self.dataSource = [NSMutableArray array];
	[self testAddDataToTableViewDataSource];
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
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (2 == indexPath.section) {
		VSDatePickerTableViewCell* cell = (VSDatePickerTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"VSDatePickerTableViewCell"];
		CGFloat ht = [cell currentCellHeight];
		return ht;
	}
//	else if (3 == indexPath.section) {
//		VSDatePickerTableViewCell* cell = (VSDatePickerTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"VSDatePickerTableViewCell"];
//		CGFloat ht = [cell currentCellHeight];
//		return ht;
//	}
	return 180.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (2 == indexPath.section) {
		VSDatePickerTableViewCell* cell = self.startDatePickerCell;
		CGFloat ht = [cell currentCellHeight];
		NSLog(@"height for section 2 cell is %f", ht);
		return ht;
	}
//	else if (3 == indexPath.section) {
//		VSDatePickerTableViewCell* cell = self.endDatePickerCell;
//		CGFloat ht = [cell currentCellHeight];
//		NSLog(@"height for section 3 cell is %f", ht);
//		return ht;
//	}
	return 180.f;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//	[tableView deselectRowAtIndexPath:indexPath animated:YES];
//	if (indexPath.section == 2) {
//		self.startTimeIndexpath = indexPath;
//		[self.startDatePickerCell toggle];
//	} else if (3 == indexPath.section) {
//		self.endTimeIndexpath = indexPath;
//		[self.endDatePickerCell toggle];
//	}
//}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	if (indexPath.section == 2) {
		if (indexPath.row == 0) {
			self.startTimeIndexpath = indexPath;
			[self.startDatePickerCell toggle];
		} else if (indexPath.row == 1) {
			self.endTimeIndexpath = indexPath;
			[self.endDatePickerCell toggle];
		}
	}
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
}

#pragma mark - scroll
- (void)scrollTableViewToIndexpath:(NSIndexPath*)indexPath {
	[self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//	if (section == 2 || 3 == section) {
//		return 1;
//	}
	if (section == 2) {
		return 2;
	}
	return 1;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (0 == indexPath.section || 1 == indexPath.section) {
		VSLocationPickerTableViewCell* cell = (VSLocationPickerTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"VSLocationPickerTableViewCell"];
		[cell configure];
		return cell;
	} else if (2 == indexPath.section) {
		if (indexPath.row == 0) {
			VSDatePickerTableViewCell* cell = (VSDatePickerTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"VSDatePickerTableViewCell"];
			cell.delegate = self;
			self.startDatePickerCell = cell;
			return cell;
		} else if (indexPath.row == 1) {
			VSDatePickerTableViewCell* cell = (VSDatePickerTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"VSDatePickerTableViewCell"];
			cell.delegate = self;
			self.endDatePickerCell = cell;
			return cell;
		}
	}
//	else if (3 == indexPath.section) {
//		VSDatePickerTableViewCell* cell = (VSDatePickerTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"VSDatePickerTableViewCell"];
//		cell.delegate = self;
//		self.endDatePickerCell = cell;
//		return cell;
//	}
	return nil;
}

#pragma mark - VSDatePickerTableViewCellDelegate
- (void)toggleDatePickerHeight {
	[self expandOrShrinkDateCell];
}

- (void)expandOrShrinkDateCell {
	[self.tableView beginUpdates];
			if (self.endTimeIndexpath) {
				[self scrollTableViewToIndexpath:self.endTimeIndexpath];
			} else {
				[self scrollTableViewToIndexpath:self.startTimeIndexpath];
			}
	[self.tableView endUpdates];

}


	// XXX use model here later
#pragma mark - test
- (void)testAddDataToTableViewDataSource {
	[self.dataSource addObject:@"start-address-selector"];
	[self.dataSource addObject:@"end-address-selector"];
	[self.dataSource addObject:@"start-time and end picker"];
		//[self.dataSource addObject:@"end-time and end picker"];
}

@end
