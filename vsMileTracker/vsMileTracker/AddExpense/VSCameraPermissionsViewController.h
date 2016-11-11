//
//  VSCameraPermissionsViewController.h
//  vsMileTracker
//
//  Created by Virendra Shakya on 11/6/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VSCameraController.h"

@interface VSCameraPermissionsViewController : UIViewController
@property (nonatomic) VSCameraController* cameraController;
@property (nonatomic, copy) NSString* message;
@property (nonatomic, copy) NSString* positiveBtnTitle;
@end
