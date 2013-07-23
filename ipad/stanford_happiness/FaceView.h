//
//  FaceView.h
//  stanford_happiness
//
//  Created by 侯 坤明 on 13-7-6.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FaceView;
@protocol FaceViewDataSource
-(float)smileForFaceView:(FaceView *)sender;
@end

@interface FaceView : UIView
@property (nonatomic) CGFloat scale;
-(void)pinch:(UIPinchGestureRecognizer *)gesture;
@property (nonatomic, weak) IBOutlet id<FaceViewDataSource> dataSource;
@end
