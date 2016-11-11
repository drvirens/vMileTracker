//
//  VSHorizontalMenuCell.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/29/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "VSLocationCell.h"
#import "VSBranding.h"

@interface VSLocationCell ()
@property (weak, nonatomic) IBOutlet UILabel *labelSectionHeader;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation VSLocationCell
- (void)awakeFromNib {
    [super awakeFromNib];
	[self setupHeader];
	[self setupMapView];
}

- (void)setupHeader {
	self.labelSectionHeader.backgroundColor = [UIColor clearColor];
	UIFont* font = [VSBranding taableViewSectionTitleFont];
	self.labelSectionHeader.font = font;
	self.labelSectionHeader.textColor = [VSBranding vs_darkGrayColor];
}
- (void)setupMapView {
	
}

+ (NSString*)reuseID {
	return NSStringFromClass([self class]);
}

- (void)configure:(id)model {
	NSLog(@"TODO: confugre VSHorizontalMenuCell");
}

@end
