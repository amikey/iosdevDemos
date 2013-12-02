//
//  ImageContextView.m
//  CGContextDemo
//
//  Created by 侯 坤明 on 13-9-2.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ImageContextView.h"
#import "UIImage+fixOrientation.h"

@interface ImageContextView()
@end

@implementation ImageContextView

- (void) setImage:(UIImage *)image
{
    if(_image != image){
        _image = [image fixOrientation];//[self fixOrientation:image];
        [self setNeedsDisplay];
    }
}

- (UIImage *)fixOrientation: (UIImage *)image
{
    CGAffineTransform transform;
    CGSize imageSize = image.size;
    switch (image.imageOrientation) {
        case UIImageOrientationUp:
            return image;
            break;
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, imageSize.width, imageSize.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, imageSize.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, imageSize.width, 0);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    switch (image.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, imageSize.width, 0);
            transform = CGAffineTransformScale(transform, 1, -1);
            break;
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, imageSize.height);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    CGContextRef imgContext = CGBitmapContextCreate(NULL, imageSize.width, imageSize.height, CGImageGetBitsPerComponent(image.CGImage), 0, CGImageGetColorSpace(image.CGImage), CGImageGetBitmapInfo(image.CGImage));
    CGContextConcatCTM(imgContext, transform);
    switch(image.imageOrientation){
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            CGContextDrawImage(imgContext, CGRectMake(0, 0, imageSize.height, imageSize.width), image.CGImage);
            break;
        default:
            CGContextDrawImage(imgContext, CGRectMake(0, 0, imageSize.width, imageSize.height), image.CGImage);
            break;
    }
    CGImageRef  cgimage = CGBitmapContextCreateImage(imgContext);
    UIImage *resultImage = [UIImage imageWithCGImage:cgimage];
    return resultImage;

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
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, CGRectMake(0, 0, self.image.size.width / 2, self.bounds.size.height), self.image.CGImage);
}

@end
