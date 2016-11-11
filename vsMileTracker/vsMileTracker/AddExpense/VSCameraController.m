//
//  VSCameraController.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 11/5/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "VSCameraController.h"

@interface VSCameraController ()
@property (nonatomic) AVCaptureSession* session;
@property (nonatomic) AVCaptureStillImageOutput* output;
@property (nonatomic, copy) CapturePhotoCompletion completion;
@end

@implementation VSCameraController
#pragma mark - API
- (void)startPreviewInView:(UIView*)view completion:( void(^)(BOOL) )completion {
	[self createCaptureSession:view];
}
- (void)stopPreview {
	[self.session stopRunning];
	self.session = nil;
}
- (void)checkAuthorizationWithCompletion:( void(^)(VSCameraStatus) )completion {
	AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
	switch (status) {
		case AVAuthorizationStatusNotDetermined: {
			[self statusNotDeterminedCompletion:completion];
		} break;
		case AVAuthorizationStatusRestricted: {
			[self statusRestrictedCompletion:completion];
		} break;
		case AVAuthorizationStatusDenied: {
			[self statusDeniedCompletion:completion];
		} break;
		case AVAuthorizationStatusAuthorized: {
			[self statusAuthorizedCompletion:completion];
		} break;
	}
}

- (void)requestPermissionsWithCompletion:( void(^)(BOOL) )completion {
	[AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
		if (completion) {
			completion(granted);
		}
	}];
}

#pragma mark - utils
- (void)statusNotDeterminedCompletion:( void(^)(VSCameraStatus) )completion {
	if (completion) {
		completion(VSCameraStatusInDetermined);
	}
}
- (void)statusRestrictedCompletion:( void(^)(VSCameraStatus) )completion {
	if (completion) {
		completion(VSCameraStatusRestricted);
	}
}
- (void)statusDeniedCompletion:( void(^)(VSCameraStatus) )completion {
	if (completion) {
		completion(VSCameraStatusDenied);
	}
}
- (void)statusAuthorizedCompletion:( void(^)(VSCameraStatus) )completion {
	if (completion) {
		completion(VSCameraStatusAuthorized);
	}
}

- (void)createCaptureSession:(UIView*)view {
	if (self.session) {
		NSLog(@"session already exists");
		return;
	}
	self.session = [self doCrateCaptureSession:view];
	[self.session startRunning];
}


- (AVCaptureSession*)doCrateCaptureSession:(UIView*)view {
	if (_session) {
		return _session;
	}
	
	AVCaptureSession* session = nil;
	AVCaptureDevice* device = [self cameraForPosition:AVCaptureDevicePositionBack];
	if (!device) {
		return session;
	}
	
	session = [[AVCaptureSession alloc] init]; //session queue
	
		//create input
	NSError* err = nil;
	AVCaptureDeviceInput* input = [[AVCaptureDeviceInput alloc] initWithDevice:device error:&err];
	if (err) {
		NSLog(@"could not get input device ");
		return session;
	}
	if ([session canAddInput:input]) {
		[session addInput:input];
	}
	
		//create output
	AVCaptureStillImageOutput* output = [[AVCaptureStillImageOutput alloc] init];
	if ([session canAddOutput:output]) {
		[session addOutput:output];
	}
	_output = output;
	
		//preview layer
	AVCaptureVideoPreviewLayer* video = [AVCaptureVideoPreviewLayer layerWithSession:session];
	UIView* cameraview = [[UIView alloc] init];
	[view addSubview:cameraview];
	[cameraview.layer addSublayer:video];
	video.frame = view.bounds;
	
	[view sendSubviewToBack:cameraview];
	
	return session;
}

- (AVCaptureDevice*)cameraForPosition:(AVCaptureDevicePosition)position {
	__block AVCaptureDevice* camera = nil;
	NSArray<AVCaptureDevice*>* cameras = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
	[cameras enumerateObjectsUsingBlock:^(AVCaptureDevice * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		if (obj) {
			if ([obj position] == position) {
				camera = obj;
				*stop = YES;
			}
		}
	}];
	return camera;
}

- (void)capturePhotoWithCompletion:(CapturePhotoCompletion)completion {
	if (!self.output) {
		NSLog(@"no output created");
		return;
	}
	
	self.completion = completion;
	
	__block AVCaptureConnection* connection = nil;
	NSArray<AVCaptureConnection*>* connections = [self.output connections];
	[connections enumerateObjectsUsingBlock:^(AVCaptureConnection * _Nonnull conn, NSUInteger idx, BOOL * _Nonnull stop) {
		if (conn) {
			NSArray<AVCaptureInputPort*>* ports = [conn inputPorts];
			[ports enumerateObjectsUsingBlock:^(AVCaptureInputPort * _Nonnull port, NSUInteger portidx, BOOL * _Nonnull portstop) {
				if (port) {
					if ([[port mediaType] isEqual:AVMediaTypeVideo]) {
						connection = conn;
						*portstop = YES;
						*stop = YES;
					}
				}
			}];
		}
	}];
	
	if (!connection) {
		NSLog(@"no connection");
		return;
	}
	
	[self.output captureStillImageAsynchronouslyFromConnection:connection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
		if (!error) {
			NSData* imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
			UIImage* img = [UIImage imageWithData:imageData];
			if (img && self.completion) {
				dispatch_async(dispatch_get_main_queue(), ^{
					self.completion(img);
				});
			}
		}
	}];
}


@end
