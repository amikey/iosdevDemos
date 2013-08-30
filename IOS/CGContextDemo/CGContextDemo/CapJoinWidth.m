//
//  CapJoinWidth.m
//  CGContextDemo
//
//  Created by 侯 坤明 on 13-8-30.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "CapJoinWidth.h"

@implementation CapJoinWidth

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setLineCap:(CGLineCap)lineCap
{
    if(_lineCap != lineCap){
        _lineCap = lineCap;
        [self setNeedsDisplay];
    }
}

- (void)setLineJoin:(CGLineJoin)lineJoin
{
    if(_lineJoin != lineJoin){
        _lineJoin = lineJoin;
        [self setNeedsDisplay];
    }
}

- (void)setLineWidth:(float)lineWidth
{
    if(_lineWidth != lineWidth){
        _lineWidth = lineWidth;
        [self setNeedsDisplay];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextSetRGBStrokeColor(context, 0, 1, 0, 1);
    
    CGContextMoveToPoint(context, 30, 30);
    CGContextAddLineToPoint(context, 290, 30);
    
    CGContextSetLineWidth(context, self.lineWidth);
    CGContextSetLineCap(context, self.lineCap);
    
    CGContextStrokePath(context);
    
    CGContextRestoreGState(context);
    
    CGContextSetRGBStrokeColor(context, 0, 1, 0, 1);
    CGContextSetLineWidth(context, self.lineWidth);
    CGContextMoveToPoint(context, 30, 150);
    CGContextAddLineToPoint(context, 150, 80);
    CGContextAddLineToPoint(context, 290, 150);
    CGContextSetLineJoin(context, self.lineJoin);
    CGContextSetLineCap(context, self.lineCap);
    
    CGContextStrokePath(context);
}

@end
