//
//  VSAddNewRideModelController.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/5/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VSAddNewRideModel.h"

@interface VSAddNewRideModelController : NSObject
@property (nonatomic) NSArray<VSAddNewRideModel*>* dataSource;

- (NSInteger)rowsInSection:(NSInteger)section;
- (NSDictionary*)itemForIndexPath:(NSIndexPath*)indexPath;
@end
