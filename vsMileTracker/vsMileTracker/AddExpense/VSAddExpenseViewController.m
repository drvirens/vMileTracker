//
//  VSAddExpenseViewController.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/25/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSAddExpenseViewController.h"
#import "VSAddExpenseDataSource.h"
#import "VSExpenseAttachmentCell.h"
#import "VSHorizontalMenuCell.h"
#import "VSAmountCell.h"
#import "VSDateCell.h"
#import "VSNotesCell.h"
#import "VSCameraController.h"
#import "VSCameraViewController.h"
#import "VSCameraPermissionsViewController.h"
#import "VSQueue.h"
#import "VSBranding.h"

#define USE_SECTIONS 1

const static CGFloat kCellHeightAttachPic	= 160.f;
const static CGFloat kCellHeightCategory	= 120.f;
	//const static CGFloat kCellHeightLocation	= 180.f; // XXX - Phase 2
const static CGFloat kCellHeightDate		= 220.f;
const static CGFloat kCellHeightAmount		= 100.f;

const static CGFloat gArrayCellHeights[] = {
		//kCellHeightLocation, //XXX - Phase 2
	kCellHeightCategory,
	kCellHeightAttachPic,
	kCellHeightAmount,
	kCellHeightDate,
};
static const char* gArrayCellClass[] = {
		//"VSGeolocationPickerCell", //XXX - Phase 2
	"VSHorizontalMenuCell",
	"VSExpenseAttachmentCell",
	"VSAmountCell",
	"VSDateCell",
};

static NSString* const kAlertTitle = @"Remove Receipt";
static NSString* const kAlertMessage = @"Are you sure you want to delete this receipt?";

@interface VSAddExpenseViewController () <UITableViewDelegate, UITableViewDataSource, VSExpenseAttachmentCellDelegate, VSCameraViewControllerDelegate>
@property (nonatomic) VSAddExpenseDataSource* dataSrc;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) VSCameraController* cameraController;
@property (nonatomic, copy) NSString* message;
@property (nonatomic, copy) NSString* positiveBtnTitle;
@end

@implementation VSAddExpenseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
	[self setupNavigationBar];
	[self test];
}
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
	[self updateDoneBarButton];
}
- (void)viewWillDisappear:(BOOL)animated {
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
	[super viewWillDisappear:animated];
}
- (BOOL)prefersStatusBarHidden {
	return NO;
}
- (void)setupNavigationBar {
	if (self.modal) {
		UIBarButtonItem* lhs = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(didTapOnCancelButton:)];
		UIBarButtonItem* rhs = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(didTapOnDoneButton:)];
		self.navigationItem.leftBarButtonItem = lhs;
		self.navigationItem.rightBarButtonItem = rhs;
	}
}
- (void)decorateNavBarButtons {
	[VSBranding decorateCancelBtn:self.navigationItem.leftBarButtonItem];
}
- (void)updateDoneBarButton {
	UIBarButtonItem *barButtonDone = self.navigationItem.rightBarButtonItem;
	BOOL isvalid = [self sanitize];
	barButtonDone.enabled = isvalid;
	if (!isvalid) {
		[VSBranding decorateEnabledBtn:barButtonDone];
	} else {
		[VSBranding decorateDisabledBtn:barButtonDone];
	}
}
- (void)didTapOnCancelButton:(id)sender {
	[self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)didTapOnDoneButton:(id)sender {
	[self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return [self heightForIndexPath:indexPath];
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return [self heightForIndexPath:indexPath];
}
- (CGFloat)heightForIndexPath:(NSIndexPath *)indexPath {
	NSInteger index = 0;
#if USE_SECTIONS
	index = indexPath.section;
#else
	index = indexPath.row;
#endif
	return gArrayCellHeights[index];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#if USE_SECTIONS
	return 1;
#else
	NSInteger c = self.dataSrc.dataSrcArray.count;
	return c;
#endif
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#if USE_SECTIONS
	return self.dataSrc.dataSrcArray.count;
#else
	return 1;
#endif
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell* cell = nil;
	NSInteger index = 0;
#if USE_SECTIONS
	index = indexPath.section;
#else
	index = indexPath.row;
#endif
	const char* className = gArrayCellClass[index];
	NSString* str = [NSString stringWithUTF8String:className];
	cell = [tableView dequeueReusableCellWithIdentifier:str];
	if ([cell isKindOfClass:[VSExpenseAttachmentCell class]]) {
		VSExpenseAttachmentCell* attachCell = (VSExpenseAttachmentCell*)cell;
		attachCell.delegate = self;
		NSArray* data = self.dataSrc.dataSrcArray[index];
		NSMutableDictionary* dic = [data firstObject];
		[attachCell configure:dic];
	}
	return cell;
}

- (BOOL)sanitize {
	BOOL ret = NO; //XXX
	return ret;
}
#pragma mark - camera
- (VSCameraController*)cameraController {
	if (_cameraController) {
		return _cameraController;
	}
	VSCameraController* cc = [[VSCameraController alloc] init];
	_cameraController = cc;
	return _cameraController;
}

#pragma mark - VSExpenseAttachmentCellDelegate
- (void)cell:(VSExpenseAttachmentCell*)cell didTapOnCameraButton:(id)sender {
	typeof (self) __weak welf = self;
	[self.cameraController checkAuthorizationWithCompletion:^(VSCameraStatus status) {
		typeof (self) __strong strongSelf = welf;
		if (strongSelf) {
			[strongSelf runCompletionWithStatus:status sender:sender];
		}
	}];
}
- (void)runCompletionWithStatus:(VSCameraStatus)status sender:(id)sender {
	NSString* segueid = nil;
	if (status == VSCameraStatusAuthorized) {
		segueid = @"segueCamera";
	} else {
		if (status == VSCameraStatusRestricted) {
			self.message = @"You do not have access to Camera (Parental Control or Company policy) :( \n\nContact admin for details.";
			self.positiveBtnTitle = @"OK";
		} else if (status == VSCameraStatusDenied) {
			self.message = @"Please allow this app to access Camera to take pictures of Expense Receipts.";
			self.positiveBtnTitle = @"Open Camera Settings"; //XXX constant
		} else if (status == VSCameraStatusInDetermined) {
			self.message = @"In order to take pictures of receipts, we need acceess to your camera.\n\nPlease tap Allow on next system dialog.";
			self.positiveBtnTitle = @"Proceed";
		}
		segueid = @"segueCameraPermissionsHeadsUp";
	}
	
	typeof (self) __weak welf = self;
	dispatch_async(dispatch_get_main_queue(), ^{
		typeof (self) __strong strongSelf = welf;
		if (strongSelf) {
			[strongSelf performSegueWithIdentifier:segueid sender:sender];
		}
	});
}

- (void)cell:(VSExpenseAttachmentCell*)cell didTapOnRemovePicButton:(id)sender {
		//show a confirmatory dialog
	UIAlertController* alertController = [UIAlertController alertControllerWithTitle:kAlertTitle message:kAlertMessage preferredStyle:UIAlertControllerStyleAlert];
	typeof (self) __weak welf = self;
	UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		typeof (self) __strong strongSelf = welf;
		if (strongSelf) {
			[strongSelf removePic];
		}
	}];
	UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
		
	}];
	[alertController addAction:okAction];
	[alertController addAction:cancelAction];
	[self presentViewController:alertController animated:YES completion:nil];
}
- (void)removePic {
	[self.dataSrc removeImage];
	NSIndexPath* indexpath = [NSIndexPath indexPathForRow:0 inSection:VSIndexExpenseAttachmentCell];
	[self.tableView reloadRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationNone];
	
	[self updateDoneBarButton];
}

#pragma mark - segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([@"segueCamera" isEqualToString:segue.identifier] ) {
		VSCameraViewController* cameravc = (VSCameraViewController*)[segue destinationViewController];
		cameravc.cameraController = self.cameraController;
		cameravc.delegate = self;
	} else if ([@"segueCameraPermissionsHeadsUp" isEqualToString:segue.identifier]) {
		VSCameraPermissionsViewController* permissionsVC = (VSCameraPermissionsViewController*)[segue destinationViewController];
		permissionsVC.cameraController = self.cameraController;
		permissionsVC.message = self.message;
		permissionsVC.positiveBtnTitle = self.positiveBtnTitle;
	}
}

#pragma mark - VSCameraViewControllerDelegate
- (void)viewController:(VSCameraViewController*)vc didCaptureImage:(UIImage*)image {
	[self.dataSrc addImage:image];
	NSIndexPath* indexpath = [NSIndexPath indexPathForRow:0 inSection:VSIndexExpenseAttachmentCell];
	[self.tableView reloadRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - keyboard
- (void)keyboardWillShow:(NSNotification *)notification {
	NSDictionary *keyInfo = [notification userInfo];
	CGRect keyboardFrame = [[keyInfo objectForKey:@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
	keyboardFrame = [self.tableView convertRect:keyboardFrame fromView:nil];
	CGRect intersect = CGRectIntersection(keyboardFrame, self.tableView.bounds);
	if (!CGRectIsNull(intersect)) {
		NSTimeInterval duration = [[keyInfo objectForKey:@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
		[UIView animateWithDuration:duration animations:^{
			self.tableView.contentInset = UIEdgeInsetsMake(0, 0, intersect.size.height, 0);
			self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, intersect.size.height, 0);
		}];
	}
}
- (void) keyboardWillHide:  (NSNotification *) notification{
	NSDictionary *keyInfo = [notification userInfo];
	NSTimeInterval duration = [[keyInfo objectForKey:@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
	[UIView animateWithDuration:duration animations:^{
		self.tableView.contentInset = UIEdgeInsetsZero;
		self.tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
	}];
}

	//test+
- (void)test {
	self.dataSrc = [[VSAddExpenseDataSource alloc] init];
}
	//test-
@end
