//
//  VSModelBaseDelegate.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 8/24/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VSModelBaseDelegate <NSObject>
- (NSString*)reuseID;
- (CGFloat)height;
@end
