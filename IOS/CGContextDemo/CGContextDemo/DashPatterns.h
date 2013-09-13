//
//  DashPatterns.h
//  CGContextDemo
//
//  Created by 侯 坤明 on 13-8-30.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct
{
    CGFloat patterns[5];
    int count;
}Pattern;

@interface DashPatterns : UIView
@property (nonatomic) Pattern dashPattern;
@property (nonatomic) float dashPhase;
@end
