//
//  VSMenuCell.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 10/24/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VSMenuModel;
@interface VSMenuCell : UICollectionViewCell
+ (NSString*)reuseID;
- (void)configure:(VSMenuModel*)menu;
- (void)highlightLabel:(VSMenuModel*)model;
@end
