//
//  VSAddNewRideModel.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/5/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, VSAddNewRideModelType) {
	VSAddNewRideModelTypeSectionTitle,
	VSAddNewRideModelTypeStartAddress,
	VSAddNewRideModelTypeEndAddress,
	VSAddNewRideModelTypeWhen,
	VSAddNewRideModelTypePurpose,
	VSAddNewRideModelTypeNotes,
	VSAddNewRideModelTypeExpense
};

@interface VSAddNewRideModel : NSObject
@property (nonatomic, copy, readonly) NSString* sectionHeaderTitle;
	
- (instancetype)initWithSectionTitle:(NSString*)title type:(VSAddNewRideModelType)type;
- (NSInteger)rows;
- (NSDictionary*)dataDictionaryAt:(NSInteger)row;
@end
