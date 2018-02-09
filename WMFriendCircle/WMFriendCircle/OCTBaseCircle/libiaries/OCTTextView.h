//
//  OCTTextView.h
//  NDBaseProject
//
//  Created by Xmeng.Wang on 17/6/21.
//  Copyright © 2017年 王猛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
typedef void(^octTextViewReturnStr)(NSString *returnStr);

@interface OCTTextView : UITextView <UITextViewDelegate>
@property (nonatomic,strong) UILabel *placeHolderLabel;/**占位placeholder*/
@property (nonatomic,strong) UILabel *numLabel;/**输入个数label*/
@property (nonatomic,copy) NSString *maxStrNum;/**最大输入个数*/
@property (nonatomic,assign) BOOL hidenNum;/**是否需要限制个数*/
@property (nonatomic,copy) octTextViewReturnStr returnStr;
@property (nonatomic, assign) CGFloat textFont;


/**初始化*/
- (instancetype)initWithPlaceHolder:(NSString *)placeHoderStr MaxStrNum:(NSString *)maxStrNum HidenNum:(BOOL)hidenNum;
@end
