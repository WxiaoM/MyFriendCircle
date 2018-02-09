//
//  OCTCircleCell.m
//  OCTRun
//
//  Created by oct on 2017/8/9.
//  Copyright © 2017年 OCT. All rights reserved.
//

#import "OCTCircleCell.h"
#import <Masonry.h>
@implementation OCTCircleCell

- (UIImageView *)headImg{
    if (!_headImg) {
        _headImg = [UIImageView new];
        [self addSubview:_headImg];
        [_headImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(WidthScale(12));
            make.top.mas_offset(HeightScale(10));
            make.size.mas_equalTo(CGSizeMake(HeightScale(48), HeightScale(48)));
        }];
        _headImg.image = [UIImage imageNamed:@"headImg"];
    }
    return _headImg;
}

- (UILabel *)nameLb{
    if (!_nameLb) {
        _nameLb = [UILabel new];
        [self addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_headImg.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(HeightScale(10));
            make.height.mas_equalTo(12);
        }];
        _nameLb.font = [UIFont systemFontOfSize:12];
        _nameLb.textColor = [UIColor lightGrayColor];
    }
    return _nameLb;
}

- (UIButton *)attentionBtn{
    if (!_attentionBtn) {
        _attentionBtn = [UIButton new];
        [self addSubview:_attentionBtn];
        [_attentionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_nameLb.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(_nameLb.mas_topMargin);
            make.size.mas_equalTo(CGSizeMake(38, 14));
        }];
        [_attentionBtn setImage:[UIImage imageNamed:@"circle_attention"] forState:0];
        [_attentionBtn setImage:[UIImage imageNamed:@"circle_attentioned"] forState:UIControlStateSelected];
        _attentionBtn.hidden = YES;
    }
    return _attentionBtn;
}

- (UILabel *)contentLb{
    if (!_contentLb) {
        _contentLb = [UILabel new];
        [self addSubview:_contentLb];
        [_contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_headImg.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(_nameLb.mas_bottom).mas_equalTo(HeightScale(5));
            make.right.mas_equalTo(-15);
        }];
        _contentLb.font = [UIFont systemFontOfSize:12];
        _contentLb.textColor = [UIColor lightGrayColor];
        _contentLb.numberOfLines = 0;
    }
    return _contentLb;
}

- (UILabel *)dateLb{
    if (!_dateLb) {
        _dateLb = [UILabel new];
        [self addSubview:_dateLb];
        [_dateLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(_nameLb.mas_bottomMargin);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(13);
        }];
        _dateLb.font = [UIFont systemFontOfSize:10];
        _dateLb.textColor = [UIColor lightGrayColor];
    }
    return _dateLb;
}

- (OCTPictureImgControl *)pictureView{
    if (!_pictureView) {
        CGFloat itemWidth = (ScreenWidth - 70 - 70 - 10)/3.0;
        _pictureView = [[OCTPictureImgControl alloc]initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new] andItemWidth:itemWidth andItemHeight:itemWidth];
        [self addSubview:_pictureView];
        [_pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(_nameLb.mas_leftMargin);
            make.top.mas_equalTo(_contentLb.mas_bottom).mas_equalTo(HeightScale(5));
            make.right.mas_equalTo(-60);
            make.height.mas_equalTo(50);
        }];
    }
    return _pictureView;
}

- (UIButton *)reportBtn
{
    if (!_reportBtn) {
        _reportBtn = [UIButton new];
        [self addSubview:_reportBtn];
        [_reportBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(WidthScale(12));
            make.bottom.mas_offset(HeightScale(-15));
            make.size.mas_equalTo(CGSizeMake(50, 30));
        }];
        [_reportBtn setTitle:@"举报" forState:0];
        [_reportBtn setTitleColor:[UIColor lightGrayColor] forState:0];
        _reportBtn.hidden = YES;
    }
    return _reportBtn;
}

- (UIButton *)praiseBtn{
    if (!_praiseBtn) {
        _praiseBtn = [UIButton new];
        [self addSubview:_praiseBtn];
        [_praiseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_countBtn.mas_centerY);
            make.right.mas_equalTo(_countBtn.mas_left).mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(70, 30));
        }];
        [_praiseBtn setImage:[UIImage imageNamed:@"circle_zan_0"] forState:0];
        [_praiseBtn setImage:[UIImage imageNamed:@"circle_zan_1"] forState:UIControlStateSelected];
        [_praiseBtn setTitleColor:[UIColor lightGrayColor] forState:0];
        _praiseBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        _praiseBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 40, 0, 0);
        _praiseBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    }
    return _praiseBtn;
}

- (UIButton *)countBtn{
    if (!_countBtn) {
        _countBtn = [UIButton new];
        [self addSubview:_countBtn];
        [_countBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            if (self.isVedio) {
                make.topMargin.mas_equalTo(self.icon.mas_bottom).mas_equalTo(15);
            }
            else{
                make.topMargin.mas_equalTo(_pictureView.mas_bottom).mas_equalTo(15);
            }
            make.right.mas_equalTo(-20);
            make.bottom.mas_equalTo(-15);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        [_countBtn setImage:[UIImage imageNamed:@"circle_comment"] forState:0];
    }
    return _countBtn;
}

- (UIButton *)deleteBtn
{
    if (!_deleteBtn) {
        _deleteBtn = [UIButton new];
        [self addSubview:_deleteBtn];
        [_deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            if (self.isVedio) {
                make.topMargin.mas_equalTo(self.icon.mas_bottom).mas_equalTo(15);
            }
            else make.topMargin.mas_equalTo(_pictureView.mas_bottom).mas_equalTo(15);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-15);
            make.size.mas_equalTo(CGSizeMake(60, 30));
        }];
        _deleteBtn.hidden = YES;
        _deleteBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_deleteBtn setTitleColor:[UIColor lightGrayColor] forState:0];
        [_deleteBtn setTitle:@"删除" forState:0];
    }
    return _deleteBtn;
}

- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [UIView new];
        [self addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.right.mas_equalTo(-12);
            make.bottom.mas_equalTo(-10);
            make.height.mas_equalTo(1);
        }];
        _lineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineView;
}

- (UIImageView *)icon{
    if (!_icon) {
        _icon = [UIImageView new];
        [self addSubview:_icon];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(_nameLb.mas_leftMargin);
            make.top.mas_equalTo(_contentLb.mas_bottom).mas_equalTo(HeightScale(5));
            make.width.mas_offset(120);
            make.height.mas_offset(150);
        }];
        _icon.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(playVedio)];
        [_icon addGestureRecognizer:tap];
    }
    return _icon;
}

- (UIImageView *)vedioImage{
    if (!_vedioImage) {
        _vedioImage = [UIImageView new];
        [_icon addSubview:_vedioImage];
        [_vedioImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_offset(0);
            make.size.mas_equalTo(CGSizeMake(ScreenWidth/375.0*30, ScreenWidth/375.0*30));
        }];
        _vedioImage.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(playVedio)];
        [_vedioImage addGestureRecognizer:tap];
    }
    return _vedioImage;
}

#pragma mark - playVedio
- (void)playVedio
{
    if (self.playVedioBlock) {
        self.playVedioBlock();
    }
}
@end
