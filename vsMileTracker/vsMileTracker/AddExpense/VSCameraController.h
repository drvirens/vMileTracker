//
//  VSCameraController.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 11/5/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h> 

typedef NS_ENUM(NSInteger, VSCameraStatus) {
	VSCameraStatusRestricted,
	VSCameraStatusDenied,
	VSCameraStatusInDetermined,
	VSCameraStatusAuthorized
};

typedef void(^CapturePhotoCompletion)(UIImage*);

@interface VSCameraController : NSObject
- (void)checkAuthorizationWithCompletion:( void(^)(VSCameraStatus) )completion;
- (void)requestPermissionsWithCompletion:( void(^)(BOOL) )completion;

- (void)startPreviewInView:(UIView*)view completion:( void(^)(BOOL) )completion;
- (void)stopPreview;

- (void)capturePhotoWithCompletion:(CapturePhotoCompletion)completion;
@end
