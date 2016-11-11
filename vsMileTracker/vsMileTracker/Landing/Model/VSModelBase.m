//
//  VSModelBase.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 8/24/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSModelBase.h"

@interface VSModelBase ()
@property (nonatomic, copy) NSString* reuseid;
@end

@implementation VSModelBase
- (instancetype)initWithReuseID:(NSString*)reuseID {
	if (self = [super init]) {
		_reuseid = reuseID;
	}
	return self;
}
- (NSString*)reuseID {
	return self.reuseid;
}
- (CGFloat)height {
	NSAssert(YES, @"this is no-op method. Derived classes must implement it");
	return 0;
}
@end
