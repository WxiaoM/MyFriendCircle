//
//  OCTMediaCell.h
//  OCTBaseProject
//
//  Created by SSOCT-YF-WM on 2018/1/13.
//  Copyright © 2018年 oct. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCTMediaCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *icon;
/** 删除按钮 */
@property (nonatomic, strong) UIButton *deleteButton;

/** 视频标志 */
@property (nonatomic, strong) UIImageView *videoImageView;

/** 点击删除按钮的回调block */
@property (nonatomic, copy) void(^OCTMediaClickDeleteButton)();


@end
