//
//  OCTCircleCommentModel.h
//  OCTBaseProject
//
//  Created by SSOCT-YF-WM on 2018/1/15.
//  Copyright © 2018年 oct. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OCTMember.h"
@interface OCTCircleCommentModel : NSObject
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, copy) NSString *MemberId;
@property (nonatomic, copy) NSString *WorkId;
@property (nonatomic, copy) NSString *Content;
@property (nonatomic, copy) NSString *CreatedDate;
@property (nonatomic, strong) OCTMember *Member;
@end
