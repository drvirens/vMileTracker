//
//  VSDrivesDataSource.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 8/19/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VSRideHistoryTableViewCell.h"

typedef void(^VSConfigureBlock)(id /*cell*/, id /*item*/);

@interface VSDrivesDataSource : NSObject <UITableViewDataSource>
@property (nonatomic, copy, readonly) NSArray<NSString*>* reuseID;
@property (nonatomic, copy, readonly) VSConfigureBlock block;
@property (nonatomic, copy, readonly) NSArray* items;
@property (nonatomic) BOOL hasNotifications;

- (instancetype)initWithBlock:(VSConfigureBlock)block
						 item:(NSArray*)items
						delegate:(id<VSRideHistoryTableViewCellDelegate>)delegate;
@end
