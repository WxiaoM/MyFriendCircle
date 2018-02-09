//
//  OCTAddDynamicViewController.m
//  OCTBaseProject
//
//  Created by SSOCT-YF-WM on 2018/1/13.
//  Copyright © 2018年 oct. All rights reserved.
//

#import "OCTAddDynamicViewController.h"
#import "OCTSelectMediaView.h"
#import "UIView+MediaExt.h"
#import "OCTTextView.h"
#import <Masonry.h>
@interface OCTAddDynamicViewController ()

@end

@implementation OCTAddDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    OCTTextView *textView = [[OCTTextView alloc]initWithPlaceHolder:@"你想说什么" MaxStrNum:@"200" HidenNum:YES];
    textView.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(150);
    }];
    
    
    OCTSelectMediaView *mediaView = [[OCTSelectMediaView alloc] initWithFrame:CGRectMake(0, 160, ScreenWidth, ScreenWidth/4)];
    [mediaView observeViewHeight:^(CGFloat value) {
        mediaView.height = value;
    }];
    //4、随时获取已经选择的媒体文件
    [mediaView observeSelectedMediaArray:^(NSArray<OCTMediaModel *> *list) {
        for (OCTMediaModel *model in list) {
            NSLog(@"%@",model);
        }
    }];
    [self.view addSubview:mediaView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
