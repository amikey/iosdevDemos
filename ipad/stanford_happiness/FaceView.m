//
//  FaceView.m
//  stanford_happiness
//
//  Created by 侯 坤明 on 13-7-6.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "FaceView.h"

@implementation FaceView
@synthesize scale = _scale;
#define DEFAULT_SCALE 0.90
-(CGFloat)scale
{
    if(!_scale){
        return DEFAULT_SCALE;
    }else{
        return _scale;
    }
}
-(void)setScale:(CGFloat)scale{
    if(scale != _scale){
        _scale = scale;
        [self setNeedsDisplay];
    }
}
-(void)pinch:(UIPinchGestureRecognizer *)gesture{
    NSLog(@"change");
    if((gesture.state == UIGestureRecognizerStateChanged) || (gesture.state == UIGestureRecognizerStateEnded)){
        self.scale *= gesture.scale;
        gesture.scale = 1;
    }
}

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

- (void) drawCircleAtPoint: (CGPoint) p withRadius: (CGFloat) radius inContext: (CGContextRef)context
{
    UIGraphicsPushContext(context);
    CGContextBeginPath(context);
    CGContextAddArc(context, p.x, p.y, radius, 0, 2*M_PI, YES);
    CGContextStrokePath(context);
    UIGraphicsPopContext();
}
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //face
    CGPoint p;
    p.x = self.bounds.origin.x + self.bounds.size.width/2;
    p.y = self.bounds.origin.y + self.bounds.size.height/2;
    CGFloat size = self.bounds.size.width/2;
    if(self.bounds.size.width > self.bounds.size.height)size = self.bounds.size.height/2;
    size *= self.scale;
    CGContextSetLineWidth(context, 5.0);
    [[UIColor greenColor] setStroke];
    [self drawCircleAtPoint:p withRadius:size inContext:context];
    //eyes
    CGPoint eyeP;
    eyeP.x = p.x - size/2;
    eyeP.y = p.y - size/2;
    [self drawCircleAtPoint:eyeP withRadius:size*0.2 inContext:context];
    eyeP.x = p.x + size/2;
    [self drawCircleAtPoint:eyeP withRadius:size*0.2 inContext:context];
    
    //mouse
    CGPoint mouseStart = CGPointMake(p.x - size*0.5, p.y + size*0.4);
    CGPoint mouseEnd = CGPointMake(p.x + size*0.5, mouseStart.y);
    CGPoint p1 = CGPointMake(mouseStart.x + size*2/3*0.4, mouseStart.y);
    CGPoint p2 = CGPointMake(mouseEnd.x - size*2/3*0.4, mouseStart.y);
    
    float smile = [self.dataSource smileForFaceView:self];//self.happiness;
    if(smile > 1)smile = 1;
    if(smile < -1)smile = -1;
    CGFloat smileOffset = size*smile*0.25;
    p1.y += smileOffset;
    p2.y += smileOffset;
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, mouseStart.x, mouseStart.y);
    CGContextAddCurveToPoint(context, p1.x, p1.y, p2.x, p2.y, mouseEnd.x, mouseEnd.y);
    CGContextStrokePath(context);
}

@end
