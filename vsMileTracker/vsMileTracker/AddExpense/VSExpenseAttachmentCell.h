//
//  VSExpenseAttachmentCell.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/25/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VSExpenseAttachmentCell;
@protocol VSExpenseAttachmentCellDelegate <NSObject>
- (void)cell:(VSExpenseAttachmentCell*)cell didTapOnCameraButton:(id)sender;
- (void)cell:(VSExpenseAttachmentCell*)cell didTapOnRemovePicButton:(id)sender;
@end

@interface VSExpenseAttachmentCell : UITableViewCell
@property (nonatomic, weak) id<VSExpenseAttachmentCellDelegate> delegate;
+ (NSString*)reuseID;
- (void)configure:(NSMutableDictionary*)model;
@end
