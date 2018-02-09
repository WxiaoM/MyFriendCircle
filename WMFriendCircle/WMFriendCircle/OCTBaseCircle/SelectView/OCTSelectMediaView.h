//
//  OCTSelectMediaView.h
//  OCTBaseProject
//
//  Created by SSOCT-YF-WM on 2018/1/13.
//  Copyright © 2018年 oct. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OCTMediaModel.h"

typedef void(^OCTMediaHeightBlock)(CGFloat mediaHeight);
typedef void(^OCTSelectMediaBackBlock)(NSArray<OCTMediaModel *> *list);


@interface OCTSelectMediaView : UIView
/** 监控view的高度变化 */
- (void)observeViewHeight: (OCTMediaHeightBlock)value;

/** 随时监控当前选择到的媒体文件 */
- (void)observeSelectedMediaArray: (OCTSelectMediaBackBlock)backBlock;

/**
 视图一开始默认高度
 */
+ (CGFloat)defaultViewHeight;
@end
