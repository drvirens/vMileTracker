//
//  VSHorizontalMenuCell.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/29/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VSHorizontalMenuCell : UITableViewCell
+ (NSString*)reuseID;
- (void)configure:(id)model;
@end
