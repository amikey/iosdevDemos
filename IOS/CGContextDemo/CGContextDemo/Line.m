//
//  Line.m
//  CGContextDemo
//
//  Created by 侯 坤明 on 13-8-30.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "Line.h"

@implementation Line

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
    CGContextSetRGBStrokeColor(context, 0, 0.3, 0, 0.8);
    CGContextSetLineWidth(context, 2.0);
    CGContextMoveToPoint(context, 30, 30);
    CGContextAddLineToPoint(context, 290, 30);
    CGContextStrokePath(context);
    
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGPoint points[] = {
        CGPointMake(30, 130),
        CGPointMake(80, 80),
        CGPointMake(130, 130),
        CGPointMake(180, 80),
        CGPointMake(230, 130),
        CGPointMake(280, 80),
    };
    CGContextAddLines(context, points, sizeof(points)/sizeof(points[0]));
    CGContextStrokePath(context);
    
    CGContextSetRGBStrokeColor(context, 0, 1, 0, 1);
    CGPoint segments[] = {
        CGPointMake(30, 230),
        CGPointMake(80, 180),
        CGPointMake(130, 230),
        CGPointMake(180, 180),
        CGPointMake(230, 230),
        CGPointMake(280, 180),
    };
    CGContextStrokeLineSegments(context, segments, sizeof(segments)/ sizeof(segments[0]));
}

@end
