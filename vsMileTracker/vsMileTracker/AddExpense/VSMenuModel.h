//
//  VSMenuModel.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 10/25/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VSMenuModel : NSObject
@property (nonatomic) BOOL isHighlighted;
@property (nonatomic, copy, readonly) NSString* title;
- (instancetype)initWithTitle:(NSString*)title isHighlighted:(BOOL)isHighlighted;
@end
