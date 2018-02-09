//
//  OCTMediaManager.h
//  OCTBaseProject
//
//  Created by SSOCT-YF-WM on 2018/1/13.
//  Copyright © 2018年 oct. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
@interface OCTMediaManager : NSObject

+ (void)getImageInfoFromImage: (UIImage *)image PHAsset: (PHAsset *)asset completion: (void(^)(NSString *name, NSData *data))completion;

+ (void)getVideoPathFromURL: (NSURL *)videoURL PHAsset: (PHAsset *)asset enableSave: (BOOL)enableSave completion: (void(^)(NSString *name, UIImage *screenshot, id pathData))completion;

+ (void)getMediaInfoFromAsset: (PHAsset *)asset completion: (void(^)(NSString *name, id pathData))completion;
@end
