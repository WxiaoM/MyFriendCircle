//
//  OCTCircleModel.m
//  OCTBaseProject
//
//  Created by SSOCT-YF-WM on 2018/1/15.
//  Copyright © 2018年 oct. All rights reserved.
//

#import "OCTCircleModel.h"
#import <MJExtension.h>
@implementation OCTCircleModel


+ (NSDictionary *)mj_objectClassInArray{
    return @{@"WorkComments":[OCTCircleCommentModel class]};
}

@end
