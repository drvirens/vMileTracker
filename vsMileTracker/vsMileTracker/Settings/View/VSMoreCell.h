//
//  VSMoreCell.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 10/16/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VSMoreModel;
@interface VSMoreCell : UITableViewCell
+ (NSString*)reuseID;
- (void)configure:(VSMoreModel*)model;
@end
