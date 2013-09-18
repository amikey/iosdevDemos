//
//  PhotoItemView.m
//  PhotoSelector
//
//  Created by 侯 坤明 on 13-9-17.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "PhotoItemView.h"

@implementation PhotoItemView{
    UIImage *selectingIcon;
    UIImage *selectedIcon;
    CGRect iconRect;
}

@synthesize status = _status;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        selectingIcon = [UIImage imageNamed:@"common_checkbox_nor.png"];
        selectedIcon = [UIImage imageNamed:@"common_checkbox_sel.png"];
        iconRect = CGRectMake(frame.size.width - selectedIcon.size.width - 5, frame.size.height - selectedIcon.size.height - 5, selectedIcon.size.width, selectedIcon.size.height);
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clicked:)];
        [self addGestureRecognizer:recognizer];
    }
    return self;
}

- (void)clicked: (id)sender
{
    if(self.status != NORMAL){
        _photoInfo.isChecked = _photoInfo.isChecked ? NO : YES;
        [self setNeedsDisplay];
    }
    if(self.delegate){
        [self.delegate performSelector:@selector(photoItemClicked:) withObject:self];
    }
}

- (void)setPhotoInfo:(PhotoInfoModel *)photoInfo
{
    if(_photoInfo != photoInfo){
        _photoInfo = photoInfo;
        [self setNeedsDisplay];
    }
}

- (void)setStatus:(P_STATUS)status{
    if(_status != status){
        _status = status;
        [self setNeedsDisplay];
    }
}

- (P_STATUS)status
{
    return _photoInfo.isChecked ? SELECTED : _status;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    CGContextSetRGBFillColor(context, 1, 1, 1, 1);
    CGContextFillRect(context, rect);
    if(_photoInfo && _photoInfo.cgImage){
        //CGContextDrawImage(context, rect, _photoInfo.cgImage);
        UIImage *image = [UIImage imageWithCGImage:_photoInfo.cgImage];
        [image drawInRect:rect];
        //[_photoInfo.thumbImage drawInRect:rect];
        if(self.status == NORMAL){
        
        }else if(_photoInfo.isChecked){
            [selectedIcon drawInRect:iconRect];
        }else{
            [selectingIcon drawInRect:iconRect];
        }
    }
}

@end
