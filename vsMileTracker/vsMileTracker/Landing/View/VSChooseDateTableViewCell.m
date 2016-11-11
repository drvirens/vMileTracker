//
//  VSChooseDateTableViewCell.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/5/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSChooseDateTableViewCell.h"

@interface VSChooseDateTableViewCell ()

@end

@implementation VSChooseDateTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (NSString*)reuseID {
	return NSStringFromClass([self class]);
}

- (void)configureWithModel:(NSDictionary*)dictionary {
	
}

@end
