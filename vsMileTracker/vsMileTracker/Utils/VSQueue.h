//
//  VSQueue.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 11/6/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VSQueue : NSObject
- (instancetype)initWithName:(NSString*)name;
+ (VSQueue*)mainQueue;

- (dispatch_queue_t)nativeQueue;
- (BOOL)isCurrentQueue;

- (void)dispatch:(dispatch_block_t)block;
- (void)dispatch:(dispatch_block_t)block syncrhonous:(BOOL)synchronous;
@end
