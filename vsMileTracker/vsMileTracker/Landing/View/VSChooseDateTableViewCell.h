//
//  VSChooseDateTableViewCell.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/5/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VSChooseDateTableViewCell : UITableViewCell
+ (NSString*)reuseID;
- (void)configureWithModel:(NSDictionary*)dictionary;
@end
