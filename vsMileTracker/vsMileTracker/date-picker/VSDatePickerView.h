//
//  VSDatePickerView.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/5/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VSDatePickerView;

@protocol VSDatePickerViewDelegate <NSObject>

- (void)datePickerView:(VSDatePickerView*)datePickerView
			 didExpand:(BOOL)isexpanded;

@end

@interface VSDatePickerView : UIView

@property (nonatomic, weak) id<VSDatePickerViewDelegate> delegate;

- (CGFloat)currentHeight;
- (void)toggle;

@end
