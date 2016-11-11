//
//  VSModelBase.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 8/24/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VSModelBaseDelegate.h"

@interface VSModelBase : NSObject <VSModelBaseDelegate>
- (instancetype)initWithReuseID:(NSString*)reuseID;
@end
