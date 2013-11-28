//
//  MainView.m
//  SmileFaceAPIDemo
//
//  Created by 侯 坤明 on 13-11-18.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "MainView.h"
#import <ImageIO/CGImageProperties.h>

@interface MainView(){
    NSArray *_result;
    UIActivityIndicatorView *_loader;
}

@end

@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _loader = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(frame.size.width /2 , frame.size.height/2, 50, 50)];
        [self addSubview:_loader];
        [_loader startAnimating];
    }
    return self;
}

- (void)setImage:(UIImage *)image
{
    if(_image != image){
        _image = image;
        _result = nil;
        [_loader startAnimating];
        [self setNeedsDisplay];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            CIImage *ciImage = [[CIImage alloc] initWithImage:_image];
            NSDictionary *opt = @{CIDetectorAccuracy: CIDetectorAccuracyHigh};
            CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeFace context:nil options:opt];
            _result = [detector featuresInImage:ciImage];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setNeedsDisplay];
                [_loader stopAnimating];
            });
        });
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawRect:(CGRect)rect
{
    //UIGraphicsBeginImageContextWithOptions(_image.size, YES, 0);
    
    // Get image context reference
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    [_image drawAtPoint:CGPointMake(0, 0)];

    
    // Flip Context
    CGContextTranslateCTM(context, 0, _image.size.height);
    CGContextScaleCTM(context, 1.0f, -1.0f);
    
    if(_result){
        for (CIFaceFeature *feature in _result) {
            
            CGContextSetRGBFillColor(context, 0.0f, 0.0f, 0.0f, 0.3f);
            CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
            CGContextSetLineWidth(context, 0.5f);
            CGContextAddRect(context, feature.bounds);
            CGContextDrawPath(context, kCGPathFillStroke);
            
            // Set red feature color
            CGContextSetRGBFillColor(context, 1.0f, 0.0f, 0.0f, 0.2f);

            if (feature.hasLeftEyePosition) {
                [self drawFeatureInContext:context atPoint:feature.leftEyePosition];
            }
            
            if (feature.hasRightEyePosition) {
                [self drawFeatureInContext:context atPoint:feature.rightEyePosition];
            }
            
            if (feature.hasMouthPosition) {
                [self drawFeatureInContext:context atPoint:feature.mouthPosition];
            }

        }
    }
}

- (void)drawFeatureInContext:(CGContextRef)context atPoint:(CGPoint)featurePoint {
    CGFloat radius = 5.0f;
    CGContextAddArc(context, featurePoint.x, featurePoint.y, radius, 0, M_PI * 2, 1);
    CGContextDrawPath(context, kCGPathFillStroke);
}


@end
