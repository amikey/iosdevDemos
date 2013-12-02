//
//  DashPatterns.m
//  CGContextDemo
//
//  Created by 侯 坤明 on 13-8-30.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "DashPatterns.h"

@implementation DashPatterns

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setDashPhase:(float)dashPhase
{
    if(_dashPhase != dashPhase){
        _dashPhase = dashPhase;
    }
    [self setNeedsDisplay];
}

-(void)setDashPattern:(Pattern)pattern
{
    if(_dashPattern.patterns != pattern.patterns){
        _dashPattern = pattern;
        [self setNeedsDisplay];
    }
//    if(_dashPattern.count != pattern.count || memcmp(_dashPattern.patterns, pattern.patterns, sizeof(CGFloat) * pattern.count) != 0){
//        _dashPattern.count = pattern.count;
//        memcmp(_dashPattern.patterns, pattern.patterns, sizeof(CGFloat) * pattern.count);
//        [self setNeedsDisplay];
//    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineDash(context, self.dashPhase, self.dashPattern.patterns, self.dashPattern.count);
    
    CGContextMoveToPoint(context, 30, 20);
    CGContextAddLineToPoint(context, 290, 20);
    CGContextAddRect(context, CGRectMake(30, 30, 80, 80));
    CGContextStrokePath(context);
}

@end
