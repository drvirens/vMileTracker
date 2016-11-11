//
//  VSDrivesDataSource.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 8/19/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSDrivesDataSource.h"

@interface VSDrivesDataSource ()
@property (nonatomic, copy, readwrite) VSConfigureBlock block;
@property (nonatomic, copy, readwrite) NSArray* items;
@property (nonatomic, weak) id<VSRideHistoryTableViewCellDelegate> delegateRide;
@end

@implementation VSDrivesDataSource

- (instancetype)initWithBlock:(VSConfigureBlock)block
						   item:(NSArray*)items
						delegate:(id<VSRideHistoryTableViewCellDelegate>)delegate {
	if (self = [super init]) {
		_block = block;
		_items = items;
		_delegateRide = delegate;
	}
	return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return self.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString* reuseid = nil;
	id item = nil;
	id cell = nil;
	if (self.items) {
		item = self.items[indexPath.section];
		
		BOOL responds = [item respondsToSelector:@selector(reuseID)];
		NSAssert(responds == YES, @"you must implement @selector(reuseID) in your cell class");
		if (responds) {
			reuseid = [item reuseID];
			NSAssert(reuseid != nil, @"reuseid was nil");
			if (!reuseid) {
				return nil;
			}
		}
		
		if (self.block) {
			cell = [tableView dequeueReusableCellWithIdentifier:reuseid];
			
			if ([cell respondsToSelector:@selector(setDelegateRide:)]) {
				[cell setDelegateRide:self.delegateRide];
			}
			self.block(cell, item);
		}
	}
	
	NSAssert(cell != nil, @"cell can not be nil");
	return cell;
}


@end
