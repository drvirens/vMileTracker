//
//  VSAnnotationView.m
//  customUIView
//
//  Created by Virendra Shakya on 9/4/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSAnnotationView.h"
#import "VSMapUtil.h"
#import "VSPickerItemAnnotation.h"

@interface VSAnnotationView ()

@end

@implementation VSAnnotationView

- (instancetype)initWithReuseID:(NSString*)reuseID annotation:(VSPickerItemAnnotation*)annotation {
	id<MKAnnotation> ann = (id<MKAnnotation>) annotation;
	if (self = [super initWithAnnotation:ann reuseIdentifier:reuseID]) {
		[self commonInit:annotation];
	}
	return self;
}

- (void)commonInit:(VSPickerItemAnnotation*)annotation {
	self.canShowCallout = NO;
	
	NSString* str = [NSString stringWithFormat:@"%ld", (long)annotation.searchResultNumber];
	CGSize size = CGSizeMake(30, 30);
	UIImage* img = [VSMapUtil imageFromText:str size:size]; //[UIImage imageNamed:@"ic_my_location_white"];
	self.image = img;
}
@end
