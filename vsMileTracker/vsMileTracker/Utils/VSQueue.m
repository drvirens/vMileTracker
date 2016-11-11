//
//  VSQueue.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 11/6/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSQueue.h"

@interface VSQueue () {
	const char* namekey;
}
@property (nonatomic, copy) NSString* name;
@property (nonatomic) BOOL isMainQueue;
@property (nonatomic) dispatch_queue_t queue;
@end

@implementation VSQueue
- (instancetype)initWithName:(NSString*)name {
	if (self = [super init]) {
		_name = name;
		namekey = [_name UTF8String];
		_queue = dispatch_queue_create(namekey, 0);
		dispatch_queue_set_specific(_queue, namekey, (void*)namekey, 0);
		_isMainQueue = NO;
	}
	return self;
}
+ (VSQueue*)mainQueue {
	static VSQueue* q = nil;
	static dispatch_once_t pred = 0;
	dispatch_once( &pred, ^(){
		q = [[VSQueue alloc] init];
		q->_queue = dispatch_get_main_queue();
		q->_isMainQueue = YES;
		q->namekey = nil;
	});
	return q;
}
- (void)dealloc {
	_queue = nil;
}

- (dispatch_queue_t)nativeQueue {
	return self.queue;
}
- (BOOL)isCurrentQueue {
	if (!self.queue) return NO;
	if (self.isMainQueue) {
		return [NSThread mainThread];
	}
	BOOL ret = (namekey == dispatch_queue_get_specific(self.queue, namekey));
	return ret;
}

- (void)dispatch:(dispatch_block_t)block {
	[self dispatch:block syncrhonous:NO];
}
- (void)dispatch:(dispatch_block_t)block syncrhonous:(BOOL)synchronous {
	if (!block) return;
	if ((!self.queue)) return;
	
	if (self.isMainQueue) {
		if ([NSThread isMainThread]) {
			block();
		} else if (synchronous) {
			dispatch_sync(self.queue, block);
		} else {
			dispatch_async(self.queue, block);
		}
		return;
	}
	
	if (namekey == dispatch_get_specific(namekey)) { //calling on same queue
		block();
	} else if (synchronous) {
		dispatch_sync(self.queue, block);
	} else {
		dispatch_async(self.queue, block);
	}
}
@end
