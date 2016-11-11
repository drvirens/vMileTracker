//
//  VSAddExpenseDataSource.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/26/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VSAddExpenseDataSource.h"


@implementation VSAddExpenseDataSource
- (instancetype)init {
	if (self = [super init]) {
		[self commonInit];
	}
	return self;
}
- (void)commonInit {
	/* display order is important and so data should be added accordingly
	 //"VSGeolocationPickerCell", //XXX - Phase 2
	 "VSHorizontalMenuCell",
	 "VSExpenseAttachmentCell",
	 "VSAmountCell",
	 "VSDateCell",
	 */
		//test+
	self.dataSrcArray =[@[] mutableCopy];
	
		//category section : 0
	NSMutableArray* categoryAttachment = [@[] mutableCopy];
	[categoryAttachment addObject:@"category"];
	[self.dataSrcArray addObject:categoryAttachment];
	
		//attachment section : 1
	NSMutableArray* rowsAttachment = [@[] mutableCopy];
	UIImage* img = [UIImage imageNamed:@"ic_receipt_white"]; //placeholder
	NSNumber* defaultImg = [NSNumber numberWithBool:YES];
	NSMutableDictionary* dic = [NSMutableDictionary dictionary];
	[dic setObject:img forKey:@"image"];
	[dic setObject:defaultImg forKey:@"isdefault"];
	[rowsAttachment addObject:dic];
	
	[self.dataSrcArray addObject:rowsAttachment];

	
		//location section
	NSMutableArray* location = [@[] mutableCopy];
	[location addObject:@"location"];
		//[self.dataSrcArray addObject:location]; //XXX - Phase 2
	
		//amount section : 2
	NSMutableArray* amount = [@[] mutableCopy];
	[amount addObject:@"amount"];
	[self.dataSrcArray addObject:amount];
	
		//date section : 3
	NSMutableArray* date = [@[] mutableCopy];
	[date addObject:@"date"];
	[self.dataSrcArray addObject:date];
	
		//notes section
	NSMutableArray* notes = [@[] mutableCopy];
	[notes addObject:@"notes"];
		//[self.dataSrcArray addObject:notes];
		//test-
}

- (void)addImage:(UIImage*)capturedImage {
	NSMutableArray* rowsAttachment = [self.dataSrcArray objectAtIndex:VSIndexExpenseAttachmentCell];
	[rowsAttachment removeAllObjects];
	
	NSNumber* defaultImg = [NSNumber numberWithBool:NO];
	NSMutableDictionary* dic = [NSMutableDictionary dictionary];
	[dic setObject:capturedImage forKey:@"image"];
	[dic setObject:defaultImg forKey:@"isdefault"];
	[rowsAttachment addObject:dic];
}
- (void)removeImage {
	NSMutableArray* rowsAttachment = [self.dataSrcArray objectAtIndex:VSIndexExpenseAttachmentCell];
	[rowsAttachment removeAllObjects];
	
	UIImage* img = [UIImage imageNamed:@"ic_receipt_white"]; //placeholder
	NSNumber* defaultImg = [NSNumber numberWithBool:YES];
	NSMutableDictionary* dic = [NSMutableDictionary dictionary];
	[dic setObject:img forKey:@"image"];
	[dic setObject:defaultImg forKey:@"isdefault"];
	[rowsAttachment addObject:dic];
}
@end
