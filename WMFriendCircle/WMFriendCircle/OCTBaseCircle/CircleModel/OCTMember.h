//
//  OCTMember.h
//  KQSystem
//
//  Created by MAC on 2017/6/20.
//  Copyright © 2017年 OCT. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface OCTMember : NSObject

/**
 用户ID
 */
@property (nonatomic, copy) NSString *Id;


@property (nonatomic, copy) NSString *RongCloudToken;

/**
 账号 手机0 邮箱1 微信2 QQ3 微博4
 */
@property (nonatomic, copy) NSString *AccountType;

/**
 电话长号
 */
@property (nonatomic, copy) NSString *MobileNumber;

/**
 部门ID
 */
@property (nonatomic, copy) NSString *OrganizationId;

/**
 部门
 */


/**
 职务
 */
@property (nonatomic, copy) NSString *Occupation;
/**
 身份证号码
 */
@property (nonatomic, copy) NSString *IdentificationNumber;

/**
 性别
 */
@property (nonatomic, copy) NSNumber *Gender;

/**
 出生日期
 */
@property (nonatomic, copy) NSString *DateOfBirth;
/**
 头像
 */
@property (nonatomic, copy) NSString *ImageUrl;
@property (nonatomic, copy) NSString *Avatar;

/**
 收货地址
 */
@property (nonatomic, copy) NSString *HarvestAddress;

/**
 个人介绍
 */
@property (nonatomic, copy) NSString *Introduce;

/**
 身高
 */
@property (nonatomic, copy) NSString *Height;

/**
 体重
 */
@property (nonatomic, copy) NSString *Weight;
/**
 单位
 */
@property (nonatomic, copy) NSString *Unit;

/**
 办公室号码
 */
@property (nonatomic, copy) NSString *Office;

/**
 用户名
 */
@property (nonatomic, copy) NSString *UserName;

/**
 邮箱
 */
@property (nonatomic, copy) NSString *Email;

/**
 密码
 */
@property (nonatomic, copy) NSString *Password;

/**
 重复密码
 */
@property (nonatomic, copy) NSString *ConfirmPassword;

/**
 姓名
 */
@property (nonatomic, copy) NSString *Name;

/**
 注册手机号
 */
@property (nonatomic, copy) NSString *PhoneNumber;

/**
 创建时间
 */
@property (nonatomic, copy) NSString *CreatedDate;

/**
 鉴别器：说明操作了什么模型
 */
@property (nonatomic, copy) NSString *Discriminator;

/**
 是否确认邮箱
 */
@property (nonatomic, assign) BOOL EmailConfirmed;

@property (nonatomic, copy) NSString *FriendStatus;

@property (nonatomic,copy) NSString *TotalDistance;

@end
