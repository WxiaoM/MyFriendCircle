//
//  OCTMediaCell.m
//  OCTBaseProject
//
//  Created by SSOCT-YF-WM on 2018/1/13.
//  Copyright © 2018年 oct. All rights reserved.
//

#import "OCTMediaCell.h"

@implementation OCTMediaCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _setupViews];
    }
    return self;
}

- (void)_setupViews {
    _icon = [[UIImageView alloc] init];
    _icon.clipsToBounds = YES;
    _icon.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_icon];
    
    _deleteButton = [[UIButton alloc] init];
    [_deleteButton setBackgroundImage:[UIImage imageNamed:@"deleteButton"] forState:UIControlStateNormal];
    [_deleteButton addTarget:self action:@selector(clickDeleteButton) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_deleteButton];
    
    _videoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ShowVideo"]];
    [self.contentView addSubview:_videoImageView];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat buttonWidth = ScreenWidth/375.0*18;
    _icon.frame = CGRectMake(buttonWidth/2, buttonWidth/2, self.bounds.size.width - buttonWidth, self.bounds.size.width - buttonWidth);
    _deleteButton.frame = CGRectMake(self.bounds.size.width - buttonWidth, 0, buttonWidth, buttonWidth);
    _videoImageView.frame = CGRectMake(self.bounds.size.width/4, self.bounds.size.width/4, self.bounds.size.width/2, self.bounds.size.width/2);
}

- (void)clickDeleteButton {
    !_OCTMediaClickDeleteButton ?  : _OCTMediaClickDeleteButton();
}

@end
