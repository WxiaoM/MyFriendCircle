//
//  OCTBaseCircleViewController.m
//  OCTBaseProject
//
//  Created by SSOCT-YF-WM on 2018/1/13.
//  Copyright © 2018年 oct. All rights reserved.
//

#import "OCTBaseCircleViewController.h"
#import <Masonry.h>
#import "OCTCountTextView.h"
#import "OCTCountCell.h"
#import "OCTCircleCell.h"
#import "OCTCircleModel.h"
#import <UIImageView+WebCache.h>
#import "OCTAddDynamicViewController.h"
#import "OCTMediaManager.h"
@interface OCTBaseCircleViewController () <UITableViewDelegate,UITableViewDataSource,MWPhotoBrowserDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic,strong) OCTCountTextView *countView;
@property (nonatomic,strong) OCTCircleModel *selectModel;
@end

@implementation OCTBaseCircleViewController
{
    MWPhoto *_photo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
    [button setTitle:@"添加动态" forState:0];
    [button setTitleColor:[UIColor blackColor] forState:0];
    [button addTarget:self action:@selector(rightBarBtnItemClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = item;
//
    OCTCircleModel *model = [OCTCircleModel new];
    model.isLike = YES;
    model.Id = @"587A2F6D-ABBD-49B7-B399-F469AAC33EE6";
    model.MemberId = @"b73811d8-7a06-4aad-8a47-f0d86a8b84c3";
    model.Content = @"美";
    model.CreatedDate = @"2018-01-14";
    model.Status = @"1";
    model.Comment = 0;
    model.Like = @"1";
    model.ImageUrlList = @[
                           @"http://ra.ssoct.cn/UserData/Works/587A2F6D-ABBD-49B7-B399-F469AAC33EE6/Image/file0.jpg",
                            @"http://ra.ssoct.cn/UserData/Works/587A2F6D-ABBD-49B7-B399-F469AAC33EE6/Image/file0.jpg",
                            @"http://ra.ssoct.cn/UserData/Works/587A2F6D-ABBD-49B7-B399-F469AAC33EE6/Image/file0.jpg",
                            @"http://ra.ssoct.cn/UserData/Works/587A2F6D-ABBD-49B7-B399-F469AAC33EE6/Image/file0.jpg",
                            @"http://ra.ssoct.cn/UserData/Works/587A2F6D-ABBD-49B7-B399-F469AAC33EE6/Image/file0.jpg",
                            @"http://ra.ssoct.cn/UserData/Works/587A2F6D-ABBD-49B7-B399-F469AAC33EE6/Image/file0.jpg",
                            @"http://ra.ssoct.cn/UserData/Works/587A2F6D-ABBD-49B7-B399-F469AAC33EE6/Image/file0.jpg",
                            @"http://ra.ssoct.cn/UserData/Works/587A2F6D-ABBD-49B7-B399-F469AAC33EE6/Image/file0.jpg",
                            @"http://ra.ssoct.cn/UserData/Works/587A2F6D-ABBD-49B7-B399-F469AAC33EE6/Image/file0.jpg"
                           ];
    OCTMember *Member = [OCTMember new];
    Member.Id = @"b73811d8-7a06-4aad-8a47-f0d86a8b84c3";
    Member.Name = @"wang";
    Member.UserName = @"王";
    Member.ImageUrl = @"http://ra.ssoct.cn/UserData/Members/b73811d8-7a06-4aad-8a47-f0d86a8b84c3/Image/file0.jpg";
    model.Member = Member;
    model.WorkComments = @[];
    model.IsVedio = NO;
    
    
    OCTCircleModel *model1 = [OCTCircleModel new];
    model1.isLike = YES;
    model1.Id = @"587A2F6D-ABBD-49B7-B399-F469AAC33EE6";
    model1.MemberId = @"b73811d8-7a06-4aad-8a47-f0d86a8b84c3";
    model1.Content = @"美";
    model1.CreatedDate = @"2018-01-14";
    model1.Status = @"1";
    model1.Comment = 0;
    model1.Like = @"1";
    model1.ImageUrlList = @[
                           @"http://ra.ssoct.cn/UserData/Works/587A2F6D-ABBD-49B7-B399-F469AAC33EE6/Image/file0.jpg",
                           @"http://ra.ssoct.cn/UserData/Works/587A2F6D-ABBD-49B7-B399-F469AAC33EE6/Image/file0.jpg",
                           @"http://ra.ssoct.cn/UserData/Works/587A2F6D-ABBD-49B7-B399-F469AAC33EE6/Image/file0.jpg",
                           @"http://ra.ssoct.cn/UserData/Works/587A2F6D-ABBD-49B7-B399-F469AAC33EE6/Image/file0.jpg",
                           @"http://ra.ssoct.cn/UserData/Works/587A2F6D-ABBD-49B7-B399-F469AAC33EE6/Image/file0.jpg",
                           @"http://ra.ssoct.cn/UserData/Works/587A2F6D-ABBD-49B7-B399-F469AAC33EE6/Image/file0.jpg",
                           @"http://ra.ssoct.cn/UserData/Works/587A2F6D-ABBD-49B7-B399-F469AAC33EE6/Image/file0.jpg",
                           @"http://ra.ssoct.cn/UserData/Works/587A2F6D-ABBD-49B7-B399-F469AAC33EE6/Image/file0.jpg",
                           @"http://ra.ssoct.cn/UserData/Works/587A2F6D-ABBD-49B7-B399-F469AAC33EE6/Image/file0.jpg"
                           ];
    OCTMember *Member1 = [OCTMember new];
    Member1.Id = @"b73811d8-7a06-4aad-8a47-f0d86a8b84c3";
    Member1.Name = @"wang";
    Member1.UserName = @"王";
    Member1.ImageUrl = @"http://ra.ssoct.cn/UserData/Members/b73811d8-7a06-4aad-8a47-f0d86a8b84c3/Image/file0.jpg";
    model1.Member = Member;
    model1.WorkComments = @[];
    model1.IsVedio = YES;
    model1.VedioUrl = @"https://gslb.miaopai.com/stream/BjFxtH7EMW3DX37J3gP6MG8nG~KP17uv2Jx4Vw__.mp4?yx=&refer=weibo_app&mpflag=8&mpr=1515993630&Expires=1515997847&ssig=TKVJ4OyQKW&KID=unistore,video";
    
    self.dataArr = [NSMutableArray new];
    [self.dataArr addObject:model];
    [self.dataArr addObject:model1];
    [self tableView];
    // Do any additional setup after loading the view.
}

#pragma mark - 添加动态

- (void)rightBarBtnItemClick{
        [self.navigationController pushViewController:[OCTAddDynamicViewController new] animated:YES];
}

#pragma mark - 获取更多

- (void)getMore
{
    
}

#pragma mark - 点击评论
-(void)didCount:(UIButton *)button
{
    OCTCircleModel *model = self.dataArr[button.tag - 20000];
    self.selectModel = model;
    self.countView.hidden = NO;
    [self.countView.textView becomeFirstResponder];
}
#pragma mark - 点赞

- (void)likeFunc:(UIButton *)button
{
  
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    OCTCircleModel *model = self.dataArr[section];
    return 1 + model.WorkComments.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OCTCircleModel *model = self.dataArr[indexPath.section];
    if (indexPath.row == 0) {
        OCTCircleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        [cell.headImg sd_setImageWithURL:[NSURL URLWithString:model.Member.ImageUrl] placeholderImage:[UIImage imageNamed:@"headImg"]];
        cell.nameLb.text = model.Member.UserName;
        cell.contentLb.text = model.Content;
        cell.dateLb.text = model.CreatedDate;
        cell.isVedio = model.IsVedio;
        if(!model.IsVedio){
            cell.pictureView.accessArr = model.ImageUrlList;
            CGFloat itemWidth = (ScreenWidth - 70 - 70 - 20)/3.0;
            CGFloat pictureViewHeight = cell.pictureView.accessArr.count > 3 ? (cell.pictureView.accessArr.count < 7 ? itemWidth*2+20 : itemWidth*3+30) : itemWidth+10;
            if (cell.pictureView.accessArr.count == 0) {
                pictureViewHeight = 0;
            }
            [cell.pictureView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(pictureViewHeight);
            }];
            [cell.pictureView loadArr];
        }
        else{
           __block UIImage *vedioImg;
           __block CGFloat fixelW;
           __block CGFloat fixelH;
            dispatch_group_t group = dispatch_group_create();
            dispatch_group_enter(group);    dispatch_async(dispatch_get_global_queue(0, 0), ^{
                vedioImg = [self thumbnailImageForVideo:[NSURL URLWithString:model.VedioUrl] atTime:0];
                fixelW = CGImageGetWidth(vedioImg.CGImage);
                fixelH = CGImageGetHeight(vedioImg.CGImage);
                dispatch_group_leave(group);
            });
            dispatch_group_notify(group, dispatch_get_main_queue(), ^{
                [cell.icon mas_updateConstraints:^(MASConstraintMaker *make) {
                    if (fixelW > (ScreenWidth - 140)) {
                        make.width.mas_equalTo(ScreenWidth - 140);
                    }
                    else{
                        make.width.mas_equalTo(fixelW);
                    }
                   make.height.mas_equalTo(150);
                }];
                cell.icon.image =  vedioImg;
                cell.vedioImage.image = [UIImage imageNamed:@"ShowVideo"];
                cell.playVedioBlock = ^{
                    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
                    browser.displayActionButton = NO;
                    browser.alwaysShowControls = NO;
                    browser.displaySelectionButtons = NO;
                    browser.zoomPhotosToFill = YES;
                    browser.displayNavArrows = NO;
                    browser.startOnGrid = NO;
                    browser.enableGrid = YES;
                    MWPhoto *photo = [MWPhoto photoWithImage:vedioImg];
                    photo.videoURL = [NSURL URLWithString:model.VedioUrl];
                    _photo = photo;
                    [self.navigationController pushViewController:browser animated:YES];
                };
            });
           
            

        }
        
        [cell.countBtn addTarget:self action:@selector(didCount:) forControlEvents:UIControlEventTouchUpInside];
        cell.countBtn.tag = indexPath.section + 20000;
        [cell.praiseBtn setTitle:model.Like forState:0];
        cell.praiseBtn.selected = model.isLike;
        [cell.praiseBtn addTarget:self action:@selector(likeFunc:) forControlEvents:UIControlEventTouchUpInside];
        cell.praiseBtn.tag = indexPath.section + 2;
        [cell lineView];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    OCTCountCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Count"];
    OCTCircleCommentModel *commentModel = model.WorkComments[indexPath.row - 1];
    cell.countLb.text = [NSString stringWithFormat:@"%@: %@",  commentModel.Member.UserName, commentModel.Content];
    if (indexPath.row == model.WorkComments.count) {
        [cell.countLb mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-5);
        }];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
#pragma mark - UITableViewDatasource
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

#pragma mark - <MWPhotoBrowserDelegate>

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return 1;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    return _photo;
}

#pragma mark - 懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[OCTCircleCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[OCTCountCell class] forCellReuseIdentifier:@"Count"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"点击加载更多..." forState:0];
        [btn setTitleColor:[UIColor grayColor] forState:0];
        btn.frame = CGRectMake(0, 0, ScreenWidth, 50);
        [btn addTarget:self action:@selector(getMore) forControlEvents:UIControlEventTouchUpInside];
        _tableView.tableFooterView = btn;
    }
    return _tableView;
}
- (OCTCountTextView *)countView{
    if (!_countView) {
        _countView = [[OCTCountTextView alloc]initWithFrame:CGRectMake(0, ScreenHeight-49, ScreenWidth, 49)];
        [[UIApplication sharedApplication].keyWindow addSubview:_countView];
        _countView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        [_countView setPlaceholderText:@"请输入文字"];
        __weak typeof(self) weakSelf = self;
        _countView.OCTCountTextViewBlock = ^(NSString *text){
            
        };
    }
    return _countView;
}


- (UIImage *) thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time {
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    NSParameterAssert(asset);
    AVAssetImageGenerator *assetImageGenerator =[[AVAssetImageGenerator alloc] initWithAsset:asset];
    assetImageGenerator.appliesPreferredTrackTransform = YES;
    assetImageGenerator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
    
    CGImageRef thumbnailImageRef = NULL;
    CFTimeInterval thumbnailImageTime = time;
    NSError *thumbnailImageGenerationError = nil;
    thumbnailImageRef = [assetImageGenerator copyCGImageAtTime:CMTimeMake(thumbnailImageTime, 60)actualTime:NULL error:&thumbnailImageGenerationError];
    
    if(!thumbnailImageRef)
        NSLog(@"thumbnailImageGenerationError %@",thumbnailImageGenerationError);
    
    UIImage*thumbnailImage = thumbnailImageRef ? [[UIImage alloc]initWithCGImage: thumbnailImageRef] : nil;
    
    return thumbnailImage;
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
