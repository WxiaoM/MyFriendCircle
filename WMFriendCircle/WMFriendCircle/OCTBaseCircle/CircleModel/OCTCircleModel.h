//
//  OCTCircleModel.h
//  OCTBaseProject
//
//  Created by SSOCT-YF-WM on 2018/1/15.
//  Copyright © 2018年 oct. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OCTMember.h"
#import "OCTCircleCommentModel.h"
@interface OCTCircleModel : NSObject
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, copy) NSString *MemberId;
@property (nonatomic, copy) NSString *Content;
@property (nonatomic, copy) NSString *CreatedDate;
@property (nonatomic, copy) NSString *Status;
@property (nonatomic, copy) NSString *Comment;
@property (nonatomic, copy) NSString *Like;
@property (nonatomic, strong) NSArray *ImageUrlList;
@property (nonatomic, strong) OCTMember *Member;
@property (nonatomic, copy)  NSString *VedioUrl;
@property (nonatomic, assign) BOOL isLike;
@property (nonatomic, assign) BOOL IsVedio;
@property (nonatomic, strong) NSArray<OCTCircleCommentModel *> *WorkComments;
@end
