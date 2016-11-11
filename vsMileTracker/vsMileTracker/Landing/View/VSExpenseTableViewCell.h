//
//  VSExpenseTableViewCell.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/11/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VSExpenseTableViewCell;

@protocol VSExpenseTableViewCellDelegate <NSObject>

- (void)didTapOnAddExpenseButton:(VSExpenseTableViewCell*)cell;

@end

@interface VSExpenseTableViewCell : UITableViewCell
@property (nonatomic, weak) id<VSExpenseTableViewCellDelegate> delegate;
+ (NSString*)reuseID;
- (void)configureWithModel:(NSDictionary*)dic;
@end
