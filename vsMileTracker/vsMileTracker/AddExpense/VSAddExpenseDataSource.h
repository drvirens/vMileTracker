//
//  VSAddExpenseDataSource.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/26/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, VSIndex) {
		//VSIndexGeolocationPickerCell,
	VSIndexHorizontalMenuCell,
	VSIndexExpenseAttachmentCell,
	VSIndexAmountCell,
	VSIndexDateCell,
};

@interface VSAddExpenseDataSource : NSObject
@property (nonatomic) NSMutableArray<NSMutableArray*>* dataSrcArray;
- (void)addImage:(UIImage*)capturedImage;
- (void)removeImage;
@end
