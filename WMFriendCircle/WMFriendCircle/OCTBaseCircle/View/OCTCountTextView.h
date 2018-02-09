//
//  OCTCountTextView.h
//  RunSystem
//
//  Created by oct on 2017/8/14.
//  Copyright © 2017年 oct. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MaxTextViewHeight 80 //限制文字输入的高度
@interface OCTCountTextView : UIView
//------ 发送文本 -----//
@property (nonatomic,copy) void (^OCTCountTextViewBlock)(NSString *text);
//------  设置占位符 ------//
- (void)setPlaceholderText:(NSString *)text;
@property (nonatomic, strong) UITextView *textView;
@end
