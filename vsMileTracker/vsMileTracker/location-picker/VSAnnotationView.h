//
//  VSAnnotationView.h
//  customUIView
//
//  Created by Virendra Shakya on 9/4/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <MapKit/MapKit.h>

@class VSPickerItemAnnotation;

@interface VSAnnotationView : MKAnnotationView
- (instancetype)initWithReuseID:(NSString*)reuseID annotation:(VSPickerItemAnnotation*)annotation;
@end
