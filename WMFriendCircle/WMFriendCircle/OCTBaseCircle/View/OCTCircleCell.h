//
//  OCTCircleCell.h
//  OCTRun
//
//  Created by oct on 2017/8/9.
//  Copyright © 2017年 OCT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OCTPictureImgControl.h"
@interface OCTCircleCell : UITableViewCell
@property (nonatomic,strong) UIImageView *headImg;
@property (nonatomic,strong) UILabel *nameLb;
@property (nonatomic,strong) UIButton *attentionBtn;
@property (nonatomic,strong) UILabel *contentLb;
@property (nonatomic,strong) UILabel *dateLb;
@property (nonatomic,strong) OCTPictureImgControl *pictureView;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UIButton *praiseBtn;
@property (nonatomic,strong) UIButton *countBtn;
@property (nonatomic,strong) UIButton *deleteBtn;
@property (nonatomic,strong) UIButton *reportBtn;

@property (nonatomic,strong) UIImageView *icon;
@property (nonatomic,strong) UIImageView *vedioImage;
@property (nonatomic,copy) void(^playVedioBlock)(void);

@property (nonatomic,assign) BOOL isVedio;
@end
