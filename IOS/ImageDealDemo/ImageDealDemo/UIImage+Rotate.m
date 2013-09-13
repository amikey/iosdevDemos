//
//  UIImage+Rotate.m
//  ImageDealDemo
//
//  Created by 侯 坤明 on 13-9-10.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "UIImage+Rotate.h"

@implementation UIImage (Rotate)

- (UIImage *)rotateImageWithRadian: (float)radian
{
    CGSize imageSize = CGSizeMake(self.size.width * self.scale, self.size.height * self.scale);
    CGRect outputRect = CGRectMake(0, 0, imageSize.width, imageSize.height);
    outputRect = CGRectApplyAffineTransform(outputRect, CGAffineTransformMakeRotation(radian));
    outputRect.origin.x = 0;
    outputRect.origin.y = 0;
    CGSize outputSize = CGSizeMake(outputRect.size.width, outputRect.size.height);
    UIGraphicsBeginImageContext(outputSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, outputSize.width / 2, outputSize.height / 2);
    CGContextRotateCTM(context, radian);
    CGContextTranslateCTM(context, -imageSize.width / 2, -imageSize.height / 2);
    CGContextClearRect(context, outputRect);
    CGContextSetRGBFillColor(context, 0, 1, 0, 0.5);
    CGContextSetShadow(context, CGSizeMake(-5, -5), 5);
    [self drawInRect:CGRectMake(0, 0, imageSize.width, imageSize.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
