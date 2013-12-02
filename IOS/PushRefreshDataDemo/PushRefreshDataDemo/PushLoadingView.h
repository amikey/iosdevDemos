//
//  PushLoadingView.h
//  PushRefreshDataDemo
//
//  Created by 侯 坤明 on 13-9-13.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    LOADING_STATUS_NOMARL = 0,
    LOADING_STATUS_ISLOADING,
    LOADING_STATUS_FINISHED
}LOADING_STATUS;

@protocol PushLoadingDelegate <NSObject>

- (void)beginLoadingData;
- (void)loadDataFinished;

@end
@interface PushLoadingView : UIView
@property (weak, nonatomic) id<PushLoadingDelegate> delegate;
@property (nonatomic) int height;
@property (weak, nonatomic) UIScrollView *scrollView;
@property (nonatomic) LOADING_STATUS status;
@property (nonatomic) int insetTop;

- (id)initWithSize: (CGSize)size;
- (void)update;
- (void)endDrag;

@end
