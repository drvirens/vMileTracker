//
//  VSCameraViewController.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 11/5/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VSCameraController.h"

@class VSCameraViewController;
@protocol VSCameraViewControllerDelegate <NSObject>
- (void)viewController:(VSCameraViewController*)vc didCaptureImage:(UIImage*)image;
@end

@interface VSCameraViewController : UIViewController
@property (nonatomic, weak) id<VSCameraViewControllerDelegate> delegate;
@property (nonatomic) VSCameraController* cameraController;
@end
