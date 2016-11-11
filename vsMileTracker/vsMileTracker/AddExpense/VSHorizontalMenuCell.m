//
//  VSHorizontalMenuCell.m
//  vsMileTracker
//
//  Created by Virendra Shakya on 9/29/16.
//  Copyright © 2016 Virendra Shakya. All rights reserved.
//

#import "VSHorizontalMenuCell.h"
#import "VSBranding.h"
#import "VSMenuCell.h"
#import "VSMenuModel.h"

@interface VSHorizontalMenuCell () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *labelSectionHeader;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSMutableArray<VSMenuModel*>* dataSrc;
@property (nonatomic) NSIndexPath* currHighlightedCell;
@end

@implementation VSHorizontalMenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
	[self setupDataSrc];
	[self setupHeader];
	[self setupCollectionView];
}

- (void)setupDataSrc {
	self.dataSrc = [NSMutableArray array];
	VSMenuModel* m = [[VSMenuModel alloc] initWithTitle:@"Gas" isHighlighted:NO];
	[self.dataSrc addObject:m];
	m = [[VSMenuModel alloc] initWithTitle:@"Parking" isHighlighted:NO];
	[self.dataSrc addObject:m];
	m = [[VSMenuModel alloc] initWithTitle:@"Tire" isHighlighted:NO];
	[self.dataSrc addObject:m];
	m = [[VSMenuModel alloc] initWithTitle:@"Car Wash" isHighlighted:NO];
	[self.dataSrc addObject:m];
	m = [[VSMenuModel alloc] initWithTitle:@"Misc" isHighlighted:NO];
	[self.dataSrc addObject:m];
}
- (void)setupHeader {
	self.labelSectionHeader.backgroundColor = [UIColor clearColor];
	UIFont* font = [VSBranding taableViewSectionTitleFont];
	self.labelSectionHeader.font = font;
	self.labelSectionHeader.textColor = [VSBranding vs_darkGrayColor];
}

- (void)setupCollectionView {
	self.collectionView.delegate = self;
	self.collectionView.dataSource = self;
}

+ (NSString*)reuseID {
	return NSStringFromClass([self class]);
}

- (void)configure:(id)model {
	NSLog(@"TODO: confugre VSHorizontalMenuCell");
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return self.dataSrc.count;
}
- (__kindof UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	VSMenuCell* cell = (VSMenuCell*)[collectionView dequeueReusableCellWithReuseIdentifier:[VSMenuCell reuseID] forIndexPath:indexPath];
	[cell configure:self.dataSrc[indexPath.item]];
	return cell;
}
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
		//if the cell at current indexPath is already hightlighted, then don't do anything
	if (self.currHighlightedCell == indexPath) {
		NSLog(@"already highlighted");
		return;
	}
	
	NSMutableArray<NSIndexPath*>* indexPaths = [NSMutableArray array];
	
	if (self.currHighlightedCell) {
		VSMenuModel* currModel = self.dataSrc[self.currHighlightedCell.item];
		currModel.isHighlighted = NO;
		[indexPaths addObject:self.currHighlightedCell];
	}
	
	VSMenuModel* model = self.dataSrc[indexPath.item];
	model.isHighlighted = YES;
	[indexPaths addObject:indexPath];
	self.currHighlightedCell = indexPath;
	
	[collectionView reloadItemsAtIndexPaths:indexPaths];
}


@end
