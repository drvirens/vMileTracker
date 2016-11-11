//
//  VSCameraViewController.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 11/5/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSCameraViewController.h"
#import "VSBranding.h"

@interface VSCameraViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonTopClose;
@property (weak, nonatomic) IBOutlet UIButton *buttonCapturePhoto;
@property (weak, nonatomic) IBOutlet UIView *btnContainer;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewPreview;
@property (weak, nonatomic) IBOutlet UIButton *buttonUse;
@property (weak, nonatomic) IBOutlet UIView *viewUseCancelContainer;
@property (weak, nonatomic) IBOutlet UIButton *buttonCancel;
@property (nonatomic) UIImage* image;
@end

@implementation VSCameraViewController
- (void)viewDidLoad {
    [super viewDidLoad];
	[self setupButtons];
}
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self startCameraPreview];
}
- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	[self decorateButtons];
}
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[self stopCameraPreview];
}

#pragma mark - UI
- (void)decorateButtons {
	CGFloat diameter = self.btnContainer.bounds.size.height;
	self.btnContainer.layer.cornerRadius = diameter/2.f;
	self.btnContainer.layer.borderWidth = 4.f;
	self.btnContainer.layer.borderColor = [UIColor whiteColor].CGColor;
	
	diameter = self.buttonCapturePhoto.bounds.size.height;
	self.buttonCapturePhoto.layer.cornerRadius = diameter/2.f;
	
	diameter = self.buttonTopClose.bounds.size.height;
	self.buttonTopClose.layer.cornerRadius = diameter/2.f;
}
- (void)setupButtons {
	self.btnContainer.backgroundColor = [UIColor clearColor];
	self.buttonCapturePhoto.backgroundColor = [VSBranding themeColor];
	self.buttonTopClose.backgroundColor = [VSBranding themeColor];
	self.imageViewPreview.backgroundColor = [UIColor blackColor];
	
	[self togglePreview:YES];
}

#pragma mark - tap handlers
- (BOOL)prefersStatusBarHidden {
	return YES;
}

#pragma mark - camera
- (void)startCameraPreview {
	[self.cameraController startPreviewInView:self.view completion:^(BOOL started) {
		if (started) {
			NSLog(@"camera preview started");
		} else {
			NSLog(@"camera preview did not start");
		}
	}];
}
- (void)stopCameraPreview {
	[self.cameraController stopPreview];
}

#pragma mark - button handlers
- (IBAction)didTapOnTakePictureButton:(id)sender {
	typeof (self) __weak welf = self;
	[self.cameraController capturePhotoWithCompletion:^(UIImage* image) {
		typeof (self) __strong strongSelf = welf;
		if (strongSelf) {
			[strongSelf togglePreview:NO];
			strongSelf.image = image;
			strongSelf.imageViewPreview.image = image;
		}
	}];
}
- (IBAction)didTapOnCloseButton:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTapOnUseButton:(id)sender {
	if ([self.delegate respondsToSelector:@selector(viewController:didCaptureImage:)]) {
		[self.delegate viewController:self didCaptureImage:self.image];
	}
	[self togglePreview:YES];
	[self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)didTapOnCancelButton:(id)sender {
	[self togglePreview:YES];
}
- (void)togglePreview:(BOOL)show {
	self.viewUseCancelContainer.hidden = show;
	self.imageViewPreview.hidden = show;
	self.buttonUse.hidden = show;
	self.buttonCancel.hidden = show;
}

@end
