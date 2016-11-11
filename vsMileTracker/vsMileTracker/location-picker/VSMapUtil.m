//
//  VSMapUtil.m
//  customUIView
//
//  Created by Virendra Shakya on 9/4/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "VSMapUtil.h"
#import "VSPickerItemAnnotation.h"
#import "VSBranding.h"

	//static const CGFloat kFontSize = 18.f;

@implementation VSMapUtil
+ (void)addSearchResultsAnnotations:(NSArray<VSGeoLocation*>*)locations inMapView:(MKMapView*)mapView {
	NSMutableArray* annotations = [NSMutableArray array];
	[locations enumerateObjectsUsingBlock:^(VSGeoLocation * _Nonnull location, NSUInteger idx, BOOL * _Nonnull stop) {
		CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(location.latitude, location.longitude);
		VSPickerItemAnnotation* anno = [[VSPickerItemAnnotation alloc] init];
		[anno setCoordinate:coord];
		anno.searchResultNumber = idx + 1;
		
		[annotations addObject:anno];
	}];
	
	[mapView addAnnotations:annotations];
}

+ (UIImage*)imageFromText:(NSString*)str size:(CGSize)size {
	UIFont* thefont = VS_FONT_MEDIUM;
	NSDictionary* defaultAttributes = @{
										//NSFontAttributeName : [UIFont fontWithName:@"Futura-Medium" size:kFontSize],
										NSFontAttributeName : thefont, 
										NSForegroundColorAttributeName : [UIColor whiteColor],
										NSBackgroundColorAttributeName : [UIColor clearColor]
										};
	return [[self class] imageFromText:str attributes:defaultAttributes size:size];
}


+ (UIImage*)imageFromText:(NSString*)str attributes:(NSDictionary*)attributes size:(CGSize)size {
	UIImage* img = nil;
	
	UIGraphicsBeginImageContextWithOptions(size, NO, 0);
	{
	CGRect rect = CGRectMake(0, 0, size.width, size.height);
	
		//circle
	CGRect circleRect = rect;
	UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:circleRect cornerRadius:size.width/2.f];
	UIColor* blueColor = [UIColor colorWithRed:52./255. green:152./255. blue:219./255. alpha:1.];
//	[blueColor setStroke];
//	path.lineWidth = 0.f;
//	[path stroke];
	
	[blueColor setFill];
	[path fill];
	
		//draw string
		// XXX - place the text in middle based on font etc
	CGSize strSize = [str sizeWithAttributes:attributes];
	
	
	CGFloat x = (size.width - strSize.width)/2;
	CGFloat y = (size.height - strSize.height)/2;
	CGRect drawRect = CGRectMake(x, y, strSize.width, strSize.height);
	[str drawInRect:drawRect withAttributes:attributes];
	
	img = UIGraphicsGetImageFromCurrentImageContext();
	}
	UIGraphicsEndImageContext();
	return img;
}


@end
