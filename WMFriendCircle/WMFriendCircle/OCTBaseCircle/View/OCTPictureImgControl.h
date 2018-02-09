//
//  OCTPictureImgControl.h
//  OCTRun
//
//  Created by oct on 2017/8/9.
//  Copyright © 2017年 OCT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWPhotoBrowser.h"
/**写不写无所谓*/
@interface OCTPhotoItem : NSObject

@property (nonatomic, copy) NSString *thumbnail_pic;

@end
/** 单元格样式 */
@interface OCTPictureImgControlCell : UICollectionViewCell
@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, strong) OCTPhotoItem *item;
@end


@interface OCTPictureImgControl : UICollectionView <UICollectionViewDelegate,UICollectionViewDataSource,MWPhotoBrowserDelegate>
@property (nonatomic, strong) NSArray *modelsArray;
/**接收外界传来的数组*/
@property (nonatomic, strong) NSArray *accessArr;
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewFlowLayout *)layout andItemWidth:(CGFloat)itemWidth andItemHeight:(CGFloat)itemHeight;
- (void)loadArr;

@end
