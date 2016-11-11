//
//  VSMapUtil.h
//  customUIView
//
//  Created by Virendra Shakya on 9/4/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <Foundation/Foundation.h>
#import "VSGeoLocation.h"

@interface VSMapUtil : NSObject
+ (void)addSearchResultsAnnotations:(NSArray<VSGeoLocation*>*)locations inMapView:(MKMapView*)mapView;
+ (UIImage*)imageFromText:(NSString*)str size:(CGSize)size;
+ (UIImage*)imageFromText:(NSString*)str attributes:(NSDictionary*)attributes size:(CGSize)size ;
@end
