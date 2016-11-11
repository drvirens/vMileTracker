//
//  VSTextPickerTableViewCell.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/10/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VSTextPickerTableViewCell : UITableViewCell
+ (NSString*)reuseID;
- (void)configureWithModel:(NSDictionary*)dic;
@end
