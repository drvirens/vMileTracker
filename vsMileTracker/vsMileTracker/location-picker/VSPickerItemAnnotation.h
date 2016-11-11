//
//  VSPickerItemAnnotation.h
//  customUIView
//
//  Created by Virendra Shakya on 9/3/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface VSPickerItemAnnotation : NSObject <MKAnnotation>
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic) NSInteger searchResultNumber;
@end
