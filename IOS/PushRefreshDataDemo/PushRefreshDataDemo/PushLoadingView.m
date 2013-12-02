//
//  PushLoadingView.m
//  PushRefreshDataDemo
//
//  Created by 侯 坤明 on 13-9-13.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "PushLoadingView.h"

@implementation PushLoadingView{
    UILabel *_titleLable;
}

- (id)initWithSize: (CGSize)size
{
    CGRect rect = CGRectMake(0, -size.height, size.width, size.height);
    self = [super initWithFrame:rect];
    self.frame = rect;
    self.status = LOADING_STATUS_NOMARL;
    _titleLable = [[UILabel alloc]initWithFrame: CGRectMake(0, 0, size.width, size.height)];
    _titleLable.backgroundColor = [UIColor clearColor];
    _titleLable.textColor = [UIColor whiteColor];
    _titleLable.text = @"下拉刷新页面";
    _titleLable.textAlignment = UITextAlignmentCenter;
    [self addSubview:_titleLable];
    return self;
    
}

- (void)update
{
    NSLog(@"%f", _scrollView.contentOffset.y);
    [self setNeedsDisplay];
}

- (void)endDrag
{
    float y = -_scrollView.contentOffset.y;
    if(y > self.insetTop && self.status != LOADING_STATUS_ISLOADING){
        self.status = LOADING_STATUS_ISLOADING;
        _titleLable.text = @"loading";
        [UIView transitionWithView:self duration:0.2 options:UIViewAnimationCurveLinear animations:^{
            UIEdgeInsets inset = _scrollView.contentInset;
            inset.top = self.insetTop;
            _scrollView.contentInset = inset;
        } completion:^(BOOL finished) {
        }];
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(loadFinished) userInfo:nil repeats:NO];
    }
    
}

- (void)loadFinished
{
    self.status = LOADING_STATUS_FINISHED;
    _titleLable.text = @"done";
    [UIView transitionWithView:self
                      duration:0.5 options: UIViewAnimationOptionCurveEaseInOut
                    animations:^{
                        UIEdgeInsets inset = _scrollView.contentInset;
                        inset.top = 0;
                        _scrollView.contentInset = inset;
                    } completion:^(BOOL finished) {
                        self.status = LOADING_STATUS_NOMARL;
                    }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawRect:(CGRect)rect
{
    // Drawing code
     float positionY = -_scrollView.contentOffset.y;
    if(self.status == LOADING_STATUS_NOMARL){
        if(positionY  > self.insetTop){
            _titleLable.text = @"松开刷新页面";
        }else{
            _titleLable.text = @"下拉刷新页面";
        }
        CGRect titleRect = _titleLable.frame;
        float y = self.bounds.size.height - (self.insetTop + titleRect.size.height)/ 2;
        titleRect.origin.y = y;
        _titleLable.frame = titleRect;
        float degree = 1.5 * M_PI * positionY / self.insetTop;
        NSLog(@"degree is : %f", degree);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 3);
        CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);
        CGContextAddArc(context, 30, self.bounds.size.height - self.insetTop / 2, 10, -M_PI/2, degree, 0);
        CGContextStrokePath(context);
        
    }
}

@end
