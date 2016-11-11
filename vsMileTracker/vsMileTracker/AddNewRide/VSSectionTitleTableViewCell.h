//
//  VSSectionTitleTableViewCell.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/6/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VSSectionTitleTableViewCell : UITableViewCell
+ (NSString*)reuseID;
- (void)configureWithModel:(NSDictionary*)model;
@end
