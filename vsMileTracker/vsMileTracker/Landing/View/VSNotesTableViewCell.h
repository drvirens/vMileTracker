//
//  VSNotesTableViewCell.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/11/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VSNotesTableViewCell : UITableViewCell
+ (NSString*)reuseID;
- (void)configureWithModel:(NSDictionary*)dic;
@end
