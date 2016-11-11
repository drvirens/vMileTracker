//
//  VSGeolocationPickerView.h
//  customUIView
//
//  Created by Virendra Shakya on 9/2/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

@class VSGeolocationPickerView;

@protocol VSGeolocationPickerViewDelegate <NSObject>

- (void)willStartShowingSearchResults:(VSGeolocationPickerView*)pickerView;
- (void)didStartShowingSearchResults:(VSGeolocationPickerView*)pickerView;

@end

@interface VSGeolocationPickerView : UIView
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) id<VSGeolocationPickerViewDelegate> delegate;

- (void)adjustSearchFieldBy:(CGFloat)yDistance;
@end
