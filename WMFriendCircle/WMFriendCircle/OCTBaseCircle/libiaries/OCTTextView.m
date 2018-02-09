//
//  OCTTextView.m
//  NDBaseProject
//
//  Created by Xmeng.Wang on 17/6/21.
//  Copyright © 2017年 王猛. All rights reserved.
//

#import "OCTTextView.h"

@implementation OCTTextView

- (instancetype)initWithPlaceHolder:(NSString *)placeHoderStr MaxStrNum:(NSString *)maxStrNum HidenNum:(BOOL)hidenNum
{
    if (self = [super init]) {
        self.placeHolderLabel.text = placeHoderStr;
        self.font = [UIFont systemFontOfSize:15];
        self.maxStrNum = maxStrNum;
        self.hidenNum = hidenNum;
        self.numLabel.text = [NSString stringWithFormat:@"0/%@",maxStrNum];
        self.delegate = self;
       
    }
    return self;
}

- (void)setTextFont:(CGFloat)textFont
{
    _textFont = textFont;
    self.font = [UIFont systemFontOfSize:textFont];
    _placeHolderLabel.font = [UIFont systemFontOfSize:textFont];
}

#pragma mark ***************************懒加载************************************
- (UILabel *)placeHolderLabel
{
    if (!_placeHolderLabel) {
        _placeHolderLabel = [UILabel new];
        [self addSubview:_placeHolderLabel];
        [_placeHolderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.top.mas_equalTo(7.5);
            make.width.mas_equalTo(ScreenWidth - 40);
        }];
        _placeHolderLabel.font = [UIFont systemFontOfSize:15];
        _placeHolderLabel.textColor = [UIColor lightGrayColor];
        _placeHolderLabel.numberOfLines = 0;
        
    }
    return _placeHolderLabel;
}

- (UILabel *)numLabel
{
    if (!_numLabel) {
        _numLabel = [UILabel new];
        [self addSubview:_numLabel];
        [_numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(100, 20));
        }];
        _numLabel.font = [UIFont systemFontOfSize:15];
        _numLabel.textColor = [UIColor lightGrayColor];
        _numLabel.hidden = self.hidenNum;
    }
    return _numLabel;
}
#pragma mark **************************UITextViewDelegate****************************
- (void)textViewDidChange:(UITextView *)textView
{
    NSString  *nsTextContent = textView.text;
    NSInteger existTextNum = nsTextContent.length;
    if (existTextNum > [self.maxStrNum integerValue])
    {
        //截取到最大位置的字符
        NSString *s = [nsTextContent substringToIndex:[self.maxStrNum integerValue]];
        [textView setText:s];
    }
    self.numLabel.text = [NSString stringWithFormat:@"%zd/%zd",MAX(0,[self.maxStrNum integerValue] - existTextNum),[self.maxStrNum integerValue]];
    self.placeHolderLabel.hidden = existTextNum;
    if (self.returnStr) {
        self.returnStr(textView.text);
    }
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSString *comcatstr = [textView.text stringByReplacingCharactersInRange:range withString:text];
    NSInteger caninputlen = [self.maxStrNum integerValue] - comcatstr.length;
    if (caninputlen >= 0)
    {
        return YES;
    }
    else
    {
        NSInteger len = text.length + caninputlen;
        //防止当text.length + caninputlen < 0时，使得rg.length为一个非法最大正数出错
        NSRange rg = {0,MAX(len,0)};
        if (rg.length > 0)
        {
            NSString *s = [text substringWithRange:rg];
            [textView setText:[textView.text stringByReplacingCharactersInRange:range withString:s]];
        }
        return NO;
    }
}
@end
