//
//  PhotoItemView.h
//  PhotoSelector
//
//  Created by 侯 坤明 on 13-9-17.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

@class PhotoItemView;

@protocol PhotoItemViewDelegate <NSObject>
- (void)photoItemClicked: (PhotoItemView *)sender;
@end

#import <UIKit/UIKit.h>
#import "CommonDefine.h"
#import "PhotoInfoModel.h"

@interface PhotoItemView : UIView
@property (strong, nonatomic) PhotoInfoModel *photoInfo;
@property (strong, nonatomic) UIImage *image;
@property (nonatomic) P_STATUS status;
@property (nonatomic) int index;
@property (nonatomic) int rowNumber;
@property (weak, nonatomic) id<PhotoItemViewDelegate>delegate;

@end
