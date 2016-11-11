//
//  VSLocationPickerTableViewCell.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/4/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSLocationPickerTableViewCell.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

#import "VSGeolocationPickerView.h"
#import "VSMapUtil.h"
#import "VSGeoLocation.h"
#import "VSPickerItemAnnotation.h"
#import "VSAnnotationView.h"

@interface VSLocationPickerTableViewCell () <MKMapViewDelegate, VSGeolocationPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *whiteMaskView;
@end

@implementation VSLocationPickerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
	self.whiteMaskView.backgroundColor = [UIColor whiteColor];
	self.geolocationPickerView.delegate = self;
}

- (void)prepareForReuse {
	
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - api
- (void)configure:(BOOL)showWhiteMast {
	[self setupMapviewOfGeoLocView];
	
	self.whiteMaskView.hidden = !showWhiteMast;
	if (!self.whiteMaskView.hidden) {
		self.whiteMaskView.alpha = 0.85f;
	}
		//test annotations
	NSArray<VSGeoLocation*>* locations = [self createFakeLocations];
	[self addSearchResultsAnnotations:locations];
	
		//test search field move
	[self testMoveSearchField];
}

- (void)setupMapviewOfGeoLocView {
	CLLocationDegrees lat = 37.7749;
	CLLocationDegrees lng = -122.4194;
	CLLocationCoordinate2D center = CLLocationCoordinate2DMake(lat, lng);
		//MKCoordinateSpan span = MKCoordinateSpanMake(0.002, 0.002);
	MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);
	
	MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
	[self.geolocationPickerView.mapView setRegion:region animated:YES];
	self.geolocationPickerView.mapView.showsUserLocation = YES;
	
	self.geolocationPickerView.mapView.delegate = self;
}

	//the query reult will come from google server autocomplete search results
- (void)addSearchResultsAnnotations:(NSArray<VSGeoLocation*>*)locations {
	[VSMapUtil addSearchResultsAnnotations:locations inMapView:self.geolocationPickerView.mapView];
}

- (NSArray<VSGeoLocation*>*)createFakeLocations {
	NSMutableArray* ret = [@[] mutableCopy];
	
		//pier
	double lat = 37.8087;
	double lng = -122.4098;
	VSGeoLocation* pier = [VSGeoLocation new];
	pier.latitude = lat;
	pier.longitude = lng;
	[ret addObject:pier];
	
		//market and 101
	lat = 37.7749;
	lng = -122.4194;
	VSGeoLocation* market = [VSGeoLocation new];
	market.latitude = lat;
	market.longitude = lng;
	[ret addObject:market];
	
	return ret;
}

#pragma mark - MKMapViewDelegate
- (MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
	MKAnnotationView* ret = nil;
	if ([annotation isKindOfClass:[VSPickerItemAnnotation class]]) {
		static NSString* reuseID = @"VSPickerItemAnnotationReuseID";
		ret = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseID];
		if (!ret) {
			VSPickerItemAnnotation* pickerAnnotation = (VSPickerItemAnnotation*)annotation;
			ret = [[VSAnnotationView alloc] initWithReuseID:reuseID annotation:pickerAnnotation];
		}
	} else {
		
	}
	return ret;
}

#pragma mark - VSGeolocationPickerViewDelegate

- (void)willStartShowingSearchResults:(VSGeolocationPickerView*)pickerView {
	NSLog(@"willStartShowingSearchResults");
	if ([self.delegate respondsToSelector:@selector(willStartShowingSearchResults:)]) {
		[self.delegate willStartShowingSearchResults:self];
	}
}

- (void)didStartShowingSearchResults:(VSGeolocationPickerView*)pickerView {
	NSLog(@"didStartShowingSearchResults");
	if ([self.delegate respondsToSelector:@selector(willStartShowingSearchResults:)]) {
		[self.delegate willStartShowingSearchResults:self];
	}
}

#pragma mark - test
- (void)testMoveSearchField {
//	[NSTimer scheduledTimerWithTimeInterval:4 repeats:NO block:^(NSTimer * _Nonnull timer) {
//		[self.geolocationPickerView adjustSearchFieldBy:-10];
//	}];
}


@end
