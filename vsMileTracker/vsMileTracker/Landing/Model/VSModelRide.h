//
//  VSModelRide.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 8/24/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSModelBase.h"

@interface VSModelRide : VSModelBase

@property (nonatomic, copy, readwrite) NSString* formattedTime;
@property (nonatomic, copy, readwrite) NSString* addressSource;
@property (nonatomic, copy, readwrite) NSString* addressDestination;
@property (nonatomic, copy, readwrite) NSString* promotedPrice;
@property (nonatomic, copy, readwrite) NSString* classifyValue;
@property (nonatomic, copy, readwrite) NSString* classifyKey;
@property (nonatomic, copy, readwrite) NSString* vehicleTypeValue;
@property (nonatomic, copy, readwrite) NSString* vehicleTypeKey;
@property (nonatomic, copy, readwrite) NSString* purposeValue;
@property (nonatomic, copy, readwrite) NSString* purposeKey;
@property (nonatomic, copy, readwrite) NSString* expenseValue;
@property (nonatomic, copy, readwrite) NSString* expenseKey;

- (instancetype)initWithReuseID:(NSString*)reuseID;
@end
