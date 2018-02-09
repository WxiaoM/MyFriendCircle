//
//  OCTSelectMediaView.m
//  OCTBaseProject
//
//  Created by SSOCT-YF-WM on 2018/1/13.
//  Copyright © 2018年 oct. All rights reserved.
//

#import "OCTSelectMediaView.h"
#import "OCTMediaCell.h"
#import "OCTMediaManager.h"
#import "TZImagePickerController.h"
#import "MWPhotoBrowser.h"
#import "UIView+MediaExt.h"
@interface OCTSelectMediaView () <UICollectionViewDelegate, UICollectionViewDataSource, TZImagePickerControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MWPhotoBrowserDelegate,UIActionSheetDelegate>

{
    UIViewController *rootVC;
}

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, copy) OCTMediaHeightBlock block;
@property (nonatomic, copy) OCTSelectMediaBackBlock backBlock;
/** 媒体信息数组 */
@property (nonatomic, strong) NSMutableArray *mediaArray;
/** MWPhoto对象数组 */
@property (nonatomic, strong) NSMutableArray *photos;

@end


@implementation OCTSelectMediaView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _mediaArray = [NSMutableArray array];
        rootVC = [[UIApplication sharedApplication] keyWindow].rootViewController;
        [self configureCollectionView];
    }
    return self;
}

- (void)configureCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(self.width/4, self.width/4);
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
    [_collectionView registerClass:[OCTMediaCell class] forCellWithReuseIdentifier:NSStringFromClass([OCTMediaCell class])];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_collectionView];
}

#pragma mark - public method

- (void)observeViewHeight:(OCTMediaHeightBlock)value {
    _block = value;
}

- (void)observeSelectedMediaArray: (OCTSelectMediaBackBlock)backBlock {
    _backBlock = backBlock;
}

+ (CGFloat)defaultViewHeight {
    return ScreenWidth/4;
}

#pragma mark -  Collection View DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    OCTMediaModel *model = [[OCTMediaModel alloc] init];
    if (_mediaArray.count > 0) {
        model = _mediaArray[0];
        if (model.isVideo) {
            return 1;
        }
    }
    return _mediaArray.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    OCTMediaCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([OCTMediaCell class]) forIndexPath:indexPath];
    if (indexPath.row == _mediaArray.count) {
        cell.icon.image = [UIImage imageNamed:@"AddMedia"];
        cell.videoImageView.hidden = YES;
        cell.deleteButton.hidden = YES;
    }else{
        OCTMediaModel *model = [[OCTMediaModel alloc] init];
        model = _mediaArray[indexPath.row];
        cell.icon.image = model.image;
        cell.videoImageView.hidden = !model.isVideo;
        cell.deleteButton.hidden = NO;
        [cell setOCTMediaClickDeleteButton:^{
            [_mediaArray removeObjectAtIndex:indexPath.row];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self layoutCollection:@[]];
            });
        }];
    }
    return cell;
}

#pragma mark - collection view delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _mediaArray.count && _mediaArray.count >= 9) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"最多只能选择9张" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定" , nil];
        [alert show];
        return;
    }
    //点击的是添加媒体的按钮
    if (indexPath.row == _mediaArray.count) {
        if (_mediaArray.count > 0) {
            UIActionSheet *actionSheet =
            [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"相册" otherButtonTitles:@"相机", nil];
            [actionSheet showInView:self];
        }
        else{
        UIActionSheet *actionSheet =
        [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"相册" otherButtonTitles:@"相机",@"录像", nil];
         [actionSheet showInView:self];
        }
    }
    //展示媒体
    else {
        _photos = [NSMutableArray array];
        MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
        browser.displayActionButton = NO;
        browser.alwaysShowControls = NO;
        browser.displaySelectionButtons = NO;
        browser.zoomPhotosToFill = YES;
        browser.displayNavArrows = NO;
        browser.startOnGrid = NO;
        browser.enableGrid = YES;
        for (OCTMediaModel *model in _mediaArray) {
            MWPhoto *photo = [MWPhoto photoWithImage:model.image];
            photo.caption = model.name;
            if (model.isVideo) {
                if (model.mediaURL) {
                    photo.videoURL = model.mediaURL;
                }else {
                    photo = [photo initWithAsset:model.asset targetSize:CGSizeZero];
                }
            }
            [_photos addObject:photo];
        }
        [browser setCurrentPhotoIndex:indexPath.row];
        [[self viewController].navigationController pushViewController:browser animated:YES];
    }
}

#pragma mark - <MWPhotoBrowserDelegate>

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return self.photos.count;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    if (index < self.photos.count) {
        return [self.photos objectAtIndex:index];
    }
    return nil;
}

#pragma mark - 布局

///添加选中的image，然后重新布局collectionview
- (void)layoutCollection: (NSArray *)images {
    [_mediaArray addObjectsFromArray:images];
    NSInteger allImageCount = _mediaArray.count + 1;
    NSInteger maxRow = (allImageCount - 1) / 4 + 1;
    _collectionView.height = maxRow * ScreenWidth/4;
    self.height = _collectionView.height;
    //block回调
    !_block ?  : _block(_collectionView.height);
    !_backBlock ?  : _backBlock(_mediaArray);
    
    [_collectionView reloadData];
}

#pragma mark - UIActionSheetViewDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
        if (buttonIndex == 0) {
            [self openAlbum];
        }else if (buttonIndex == 1) {
            [self openCamera];
        }else if (buttonIndex == 2) {
            if (_mediaArray.count > 0) {
                
            }
            else [self openVideotape];
        }else {
       
        }
}

#pragma mark - actions

/** 相册 */
- (void)openAlbum {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 - _mediaArray.count delegate:self];
    ///是否 在相册中显示拍照按钮
    imagePickerVc.allowTakePicture = NO;
    ///是否可以选择显示原图
    imagePickerVc.allowPickingOriginalPhoto = NO;
    ///是否 在相册中可以选择视频
    imagePickerVc.allowPickingVideo = YES;
    
    if (_mediaArray.count > 0) {
        imagePickerVc.allowPickingVideo = NO;
    }
    
    [rootVC presentViewController:imagePickerVc animated:YES completion:nil];
}

/** 相机 */
- (void)openCamera {
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [rootVC presentViewController:picker animated:YES completion:nil];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"该设备不支持拍照" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定" , nil];
        [alert show];
    }
}

/** 录像 */
- (void)openVideotape {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSArray * mediaTypes =[UIImagePickerController  availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.mediaTypes = mediaTypes;
        picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
        picker.videoQuality = UIImagePickerControllerQualityTypeMedium; //录像质量
        picker.videoMaximumDuration = 600.0f; //录像最长时间
    } else {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"当前设备不支持摄像" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定" , nil];
        [alert show];
    }
    [rootVC presentViewController:picker animated:YES completion:nil];
    
}

/** 视频 */
- (void)openVideo {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
    picker.allowsEditing = YES;
    UIViewController *vc = [[UIApplication sharedApplication] keyWindow].rootViewController;
    [vc presentViewController:picker animated:YES completion:nil];
}

#pragma mark - TZImagePickerController Delegate

//处理从相册单选或多选的照片
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto{
    NSMutableArray *models = [NSMutableArray array];
    for (NSInteger index = 0; index < assets.count; index++) {
        PHAsset *asset = assets[index];
        [OCTMediaManager getMediaInfoFromAsset:asset completion:^(NSString *name, id pathData) {
            OCTMediaModel *model = [[OCTMediaModel alloc] init];
            model.name = name;
            model.uploadType = pathData;
            model.image = photos[index];
            [models addObject:model];
            if (index == assets.count - 1) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self layoutCollection:models];
                });
            }
        }];
    }
}

///选取视频后的回调
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(id)asset {
    [OCTMediaManager getMediaInfoFromAsset:asset completion:^(NSString *name, id pathData) {
        OCTMediaModel *model = [[OCTMediaModel alloc] init];
        model.name = name;
        model.uploadType = pathData;
        model.image = coverImage;
        model.isVideo = YES;
        model.asset = asset;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self layoutCollection:@[model]];
        });
    }];
}

#pragma mark - UIImagePickerController Delegate
///拍照、选视频图片、录像 后的回调（这种方式选择视频时，会自动压缩，但是很耗时间）
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [picker dismissViewControllerAnimated:YES completion:^{
        [self setNeedsLayout];
    }];
    
    //媒体类型
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    //原图URL
    NSURL *imageAssetURL = [info objectForKey:UIImagePickerControllerReferenceURL];
    
    ///视频 和 录像
    if ([mediaType isEqualToString:@"public.movie"]) {
        
        NSURL *videoAssetURL = [info objectForKey:UIImagePickerControllerMediaURL];
        PHAsset *asset;
        //录像没有原图 所以 imageAssetURL 为nil
        if (imageAssetURL) {
            PHFetchResult *result = [PHAsset fetchAssetsWithALAssetURLs:@[imageAssetURL] options:nil];
            asset = [result firstObject];
        }
        [OCTMediaManager getVideoPathFromURL:videoAssetURL PHAsset:asset enableSave:NO completion:^(NSString *name, UIImage *screenshot, id pathData) {
            OCTMediaModel *model = [[OCTMediaModel alloc] init];
            model.image = screenshot;
            model.name = name;
            model.uploadType = pathData;
            model.isVideo = YES;
            model.mediaURL = videoAssetURL;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self layoutCollection:@[model]];
            });
        }];
    }
    
    else if ([mediaType isEqualToString:@"public.image"]) {
        
        UIImage * image = [info objectForKey:UIImagePickerControllerEditedImage];
        //如果 picker 没有设置可编辑，那么image 为 nil
        if (image == nil) {
            image = [info objectForKey:UIImagePickerControllerOriginalImage];
        }
        
        PHAsset *asset;
        //拍照没有原图 所以 imageAssetURL 为nil
        if (imageAssetURL) {
            PHFetchResult *result = [PHAsset fetchAssetsWithALAssetURLs:@[imageAssetURL] options:nil];
            asset = [result firstObject];
        }
        [OCTMediaManager getImageInfoFromImage:image PHAsset:asset completion:^(NSString *name, NSData *data) {
            OCTMediaModel *model = [[OCTMediaModel alloc] init];
            model.image = image;
            model.name = name;
            model.uploadType = data;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self layoutCollection:@[model]];
            });
        }];
    }
}

@end
