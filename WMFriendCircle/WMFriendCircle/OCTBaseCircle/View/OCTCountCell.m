//
//  OCTCountCell.m
//  RunSystem
//
//  Created by oct on 2017/8/14.
//  Copyright © 2017年 oct. All rights reserved.
//

#import "OCTCountCell.h"
#import <Masonry.h>

@implementation OCTCountCell
- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView new];
        [self addSubview:_bgView];
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(70);
            make.right.mas_equalTo(-15);
            make.top.bottom.mas_equalTo(0);
        }];
        _bgView.backgroundColor = [UIColor lightGrayColor];
    }
    return _bgView;
}
- (UILabel *)countLb{
    if (!_countLb) {
        _countLb = [UILabel new];
        [self.bgView addSubview:_countLb];
        [_countLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.right.mas_equalTo(-5);
            make.top.mas_equalTo(5);
            make.bottom.mas_equalTo(0);
        }];
   
        _countLb.numberOfLines = 0;
        _countLb.font = [UIFont systemFontOfSize:12];
    }
    return _countLb;
}

@end
