//
//  OCTPictureImgControl.m
//  OCTRun
//
//  Created by oct on 2017/8/9.
//  Copyright © 2017年 OCT. All rights reserved.
//

#import "OCTPictureImgControl.h"
#import <UIImageView+WebCache.h>
#import "UIView+MediaExt.h"
@implementation OCTPhotoItem

@end


@implementation OCTPictureImgControlCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    UIImageView *imageView = [UIImageView new];
    [self.contentView addSubview:imageView];
    self.imageView = imageView;
    
    self.backgroundColor = [UIColor orangeColor];
}

- (void)setItem:(OCTPhotoItem *)item
{
    _item = item;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:item.thumbnail_pic]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
}

@end


@implementation OCTPictureImgControl
{
    NSMutableArray *_photos;
}
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewFlowLayout *)layout andItemWidth:(CGFloat)itemWidth andItemHeight:(CGFloat)itemHeight{
    /** 初始化设置layout */
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.scrollEnabled = NO;
        self.backgroundColor = [UIColor whiteColor];
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[OCTPictureImgControlCell class] forCellWithReuseIdentifier:@"Cell"];
    }
    return self;
}
/**加载数组*/
- (void)loadArr{
    NSArray *srcStringArray = [self.accessArr copy];
    NSMutableArray *temp = [NSMutableArray new];
    for (int i = 0; i < self.accessArr.count; i++) {
        OCTPhotoItem *item = [OCTPhotoItem new];
        item.thumbnail_pic = srcStringArray[i];
        [temp addObject:item];
    }
    self.modelsArray = [temp copy];
    [self reloadData];
}
#pragma mark ******************** UICollectionViewDataSource *********************************
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.modelsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    OCTPictureImgControlCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.item = self.modelsArray[indexPath.item];
    return cell;
}

#pragma mark *********************** UICollectionViewDelegate ************************

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    _photos = [NSMutableArray new];
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    browser.displayActionButton = NO;
    browser.alwaysShowControls = NO;
    browser.displaySelectionButtons = NO;
    browser.zoomPhotosToFill = YES;
    browser.displayNavArrows = NO;
    browser.startOnGrid = NO;
    browser.enableGrid = YES;
    for (OCTPhotoItem *item in self.modelsArray) {
        MWPhoto *photo = [MWPhoto photoWithURL:[NSURL URLWithString:item.thumbnail_pic]];
        [_photos addObject:photo];
    }
    [browser setCurrentPhotoIndex:indexPath.row];
    [[self viewController].navigationController pushViewController:browser animated:YES];
    
}

#pragma mark - <MWPhotoBrowserDelegate>

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return _photos.count;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < _photos.count) {
        return [_photos objectAtIndex:index];
    }
    return nil;
}




@end
