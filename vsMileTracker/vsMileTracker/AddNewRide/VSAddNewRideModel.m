//
//  VSAddNewRideModel.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/5/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSAddNewRideModel.h"

@interface VSAddNewRideModel ()
@property (nonatomic, copy, readwrite) NSString* sectionHeaderTitle;
@property (nonatomic) VSAddNewRideModelType type;
@property (nonatomic, readwrite) NSMutableArray* items;
@end

@implementation VSAddNewRideModel
- (instancetype)initWithSectionTitle:(NSString*)title  type:(VSAddNewRideModelType)type {
	if (self = [super init]) {
		_sectionHeaderTitle = title;
		_type = type;
		[self commonInit];
	}
	return self;
}
- (void)commonInit {
	self.items = [NSMutableArray array];
	if (VSAddNewRideModelTypeStartAddress == self.type) {
		NSMutableDictionary* startAddress = [NSMutableDictionary dictionary];
		[startAddress setValue:@"From" forKey:@"title"];
		NSMutableDictionary* body = [NSMutableDictionary dictionary];
		
		[self.items addObject:startAddress];
		[self.items addObject:body];
	} else if (VSAddNewRideModelTypeEndAddress == self.type) {
		NSMutableDictionary* endAddress = [NSMutableDictionary dictionary];
		[endAddress setValue:@"To" forKey:@"title"];
		NSMutableDictionary* body = [NSMutableDictionary dictionary];
		
		[self.items addObject:endAddress];
		[self.items addObject:body];
	} else if (VSAddNewRideModelTypeWhen == self.type) {
		NSMutableDictionary* title = [NSMutableDictionary dictionary];
		[title setValue:@"When" forKey:@"title"];
		
		NSMutableDictionary* startTime = [NSMutableDictionary dictionary];
		[startTime setValue:@"Start time:" forKey:@"_date"];
		[startTime setValue:[NSDate date] forKey:@"_dateV"];
		
//		NSMutableDictionary* startTimeChooser = [NSMutableDictionary dictionary];
//		NSDate* selectedDate = [NSDate date];
//		[startTimeChooser setValue:selectedDate forKey:@"_selDate"];
		
		NSMutableDictionary* endTime = [NSMutableDictionary dictionary];
		[endTime setValue:@"End time:" forKey:@"_date"];
		[endTime setValue:[NSDate date] forKey:@"_dateV"];
		
		[self.items addObject:title];
		[self.items addObject:startTime];
		[self.items addObject:endTime];
//		[self.items addObject:startTimeChooser];
	} else if (VSAddNewRideModelTypePurpose == self.type) {
		NSMutableDictionary* title = [NSMutableDictionary dictionary];
		[title setValue:@"Purpose" forKey:@"title"];
		
		NSMutableDictionary* desc = [NSMutableDictionary dictionary];
		[desc setValue:@"Commute to work" forKey:@"_desc"];
		
		[self.items addObject:title];
		[self.items addObject:desc];
	} else if (VSAddNewRideModelTypeNotes == self.type) {
		NSMutableDictionary* title = [NSMutableDictionary dictionary];
		[title setValue:@"Notes" forKey:@"title"];
		
		NSMutableDictionary* desc = [NSMutableDictionary dictionary];
		[desc setValue:@"Tap here to add notes" forKey:@"_notes"];
		
		[self.items addObject:title];
		[self.items addObject:desc];
	} else if (VSAddNewRideModelTypeExpense == self.type) {
		NSMutableDictionary* title = [NSMutableDictionary dictionary];
		[title setValue:@"Expenses" forKey:@"title"];
		[title setValue:@"$0.00" forKey:@"summary"];
		
		NSMutableDictionary* desc = [NSMutableDictionary dictionary];
		[desc setValue:@"Add Expense" forKey:@"_btnTitle"];
		
		[self.items addObject:title];
		[self.items addObject:desc];
	}
}
- (NSInteger)rows {
	return self.items.count;
}
- (NSDictionary*)dataDictionaryAt:(NSInteger)row {
	NSDictionary* dic = self.items[row];
	return dic;
}
@end
