//
//  VSAddNewRideModelController.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/5/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VSAddNewRideModelController.h"

@interface VSAddNewRideModelController ()

@end

@implementation VSAddNewRideModelController
- (instancetype)init {
	if (self = [super init]) {
		[self commonInit];
	}
	return self;
}

- (void)commonInit {
	VSAddNewRideModel* startAddress = [[VSAddNewRideModel alloc] initWithSectionTitle:@"START ADDRESS" type:VSAddNewRideModelTypeStartAddress];
	
	VSAddNewRideModel* endAddress = [[VSAddNewRideModel alloc] initWithSectionTitle:@"END ADDRESS" type:VSAddNewRideModelTypeEndAddress];
	
	VSAddNewRideModel* when = [[VSAddNewRideModel alloc] initWithSectionTitle:@"WHEN" type:VSAddNewRideModelTypeWhen];
	
	VSAddNewRideModel* purpose = [[VSAddNewRideModel alloc] initWithSectionTitle:@"PURPOSE" type:VSAddNewRideModelTypePurpose];
	
	VSAddNewRideModel* notes = [[VSAddNewRideModel alloc] initWithSectionTitle:@"NOTES" type:VSAddNewRideModelTypeNotes];
	
	VSAddNewRideModel* expense = [[VSAddNewRideModel alloc] initWithSectionTitle:@"EXPENSE" type:VSAddNewRideModelTypeExpense];
	
	self.dataSource = @[startAddress,
						endAddress,
						when,
						purpose,
						notes,
						expense];
}

- (NSInteger)rowsInSection:(NSInteger)section {
	VSAddNewRideModel* model = self.dataSource[section];
	NSInteger rows = [model rows];
	return rows;
}

- (NSDictionary*)itemForIndexPath:(NSIndexPath*)indexPath {
	VSAddNewRideModel* model = self.dataSource[indexPath.section];
	NSDictionary* dic = [model dataDictionaryAt:indexPath.row];
	return dic;
}
@end
