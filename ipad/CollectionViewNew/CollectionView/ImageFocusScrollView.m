//
//  ImageFocusScrollView.m
//  CollectionView
//
//  Created by 侯 坤明 on 13-7-10.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//
#import "ImageFocusScrollView.h"
@interface ImageFocusScrollView()<UIScrollViewDelegate>

@end
@implementation ImageFocusScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.bouncesZoom = YES;
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        self.delegate = self;
        self.minimumZoomScale = 0.1;
        self.maximumZoomScale = 5;
    }
    return self;
}

-(void)layoutSubviews
{
    [self updateImageViewFrameToCenter];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
/*
 *显示图片接口
 */
-(void)displayImage:(UIImage *)image
{
    self.contentOffset = CGPointZero;
    self.zoomScale = 1;
    
    self.contentSize = image.size;
    self.imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    self.imageView.image = image;
    [self updateImageViewScaleWithSize: image.size];
}
/**
 *根据图片设置图片的放大缩小倍数，及fram 位置计算
 */
-(void)updateImageViewScaleWithSize: (CGSize) imageSize
{
    CGSize boundsSize = self.bounds.size;
    //计算倍数
    CGFloat maxScale = 2;
    CGFloat xScale = boundsSize.width / imageSize.width;
    CGFloat yScalse = boundsSize.height /imageSize.height;
    CGFloat minScale = MIN(xScale, yScalse);
    
    CGFloat xImageScale = maxScale * imageSize.width / boundsSize.width;
    CGFloat yImageScale = maxScale * imageSize.height / boundsSize.height;
    
    CGFloat maxImageScale = MAX(xImageScale, yImageScale);
    maxScale = MAX(maxImageScale, maxScale);

    if(minScale > maxImageScale)
    {
        minScale = maxImageScale;
    }
    self.minimumZoomScale = minScale;
    self.maximumZoomScale = maxScale;
    self.zoomScale = minScale;
    self.contentSize = CGSizeMake(imageSize.width * minScale, imageSize.height * minScale);
    self.imageView.frame = CGRectMake(0, 0, self.contentSize.width, self.contentSize.height);
}
/**
 * 更新frame
 */
-(void)updateImageViewFrameToCenter
{
    //计算坐标
    CGSize boundsSize = self.bounds.size;
    CGRect frameToCenter = self.imageView.frame;
    
    if(frameToCenter.size.width < boundsSize.width)
    {
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width)/2;
    }else
    {
        frameToCenter.origin.x = 0;
    }
    if(frameToCenter.size.height < boundsSize.height)
    {
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height)/2;
    }else{
        frameToCenter.origin.y = 0;
    }
    self.imageView.frame = frameToCenter;
}
#pragma mark - scroll view delegate
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
    
}

@end
