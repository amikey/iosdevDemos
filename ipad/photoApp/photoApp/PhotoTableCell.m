//
//  PhotoTableCell.m
//  photoApp
//
//  Created by 侯 坤明 on 13-7-4.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "PhotoTableCell.h"

@implementation PhotoTableCell
@synthesize img1;
@synthesize img2;
@synthesize img3;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setImgs:(NSString *) src1 src2:(NSString *)src2 src3:(NSString *)src3
{
    UIImage *img1 = [self createUrlImg:src1];
    UIImage *img2 = [self createUrlImg:src2];
    UIImage *img3 = [self createUrlImg:src3];
    
    self.img1.image = img1;
    self.img2.image = img2;
    self.img3.image = img3;
}
-(UIImage *)createUrlImg:(NSString *)urlStr{
    NSURL *url = [NSURL URLWithString:urlStr];
    NSData *imgData = [NSData dataWithContentsOfURL:url];
    UIImage *img = [UIImage imageWithData:imgData];
    return img;
}

@end
