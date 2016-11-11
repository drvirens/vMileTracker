//
//  VSMenuModel.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 10/25/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSMenuModel.h"

@interface VSMenuModel ()
@property (nonatomic, copy, readwrite) NSString* title;
@end

@implementation VSMenuModel
- (instancetype)initWithTitle:(NSString*)title isHighlighted:(BOOL)isHighlighted {
	if (self = [super init]) {
		_title = title;
		_isHighlighted = isHighlighted;
	}
	return self;
}
@end
