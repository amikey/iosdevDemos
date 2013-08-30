//
//  MainView.m
//  CGContextDemo
//
//  Created by 侯 坤明 on 13-8-29.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0, 0.2, 0, 0.6);
    CGContextSetRGBStrokeColor(context, 0.2, 0.2, 0, 1);
    CGContextSetLineWidth(context, 2);
    CGContextAddArc(context, 100, 150, 1, 20, 80, 2);
    CGContextFillRect(context, CGRectMake(50, 50, 100, 100));
    CGContextStrokeRect(context, CGRectMake(100, 200, 50, 50));
    CGContextStrokePath(context);

}

@end
