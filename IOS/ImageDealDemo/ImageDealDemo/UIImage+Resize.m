//
//  UIImage+Resize.m
//  ImageDealDemo
//
//  Created by 侯 坤明 on 13-9-10.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "UIImage+Resize.h"

@implementation UIImage (Resize)

- (UIImage *)resizeImage: (CGSize)newSize
{
    CGSize size = self.size;
    CGSize outputSize = CGSizeZero;
    if(size.width > newSize.width && size.width / size.height > newSize.width / newSize.height){
        outputSize.height = newSize.width * size.height / size.width;
        outputSize.width = newSize.width;
    }else if(size.height > newSize.height && size.width / size.height < newSize.width / newSize.height){
        outputSize.width = newSize.height * size.width / size.height;
        outputSize.height = newSize.height;
    }else{
        outputSize.width = newSize.width;
        outputSize.height = newSize.height;
    }
    CGRect rect = CGRectMake(0, 0, outputSize.width, outputSize.height);
    UIGraphicsBeginImageContext(outputSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, 0);
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
