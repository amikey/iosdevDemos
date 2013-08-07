//
//  CustomTableCell.m
//  qz_tableView_demo
//
//  Created by 侯 坤明 on 13-8-1.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//


#define DEFAULT_HEAD_URL @"http://qlogo2.store.qq.com/qzone/1799413401/1799413401/50"

#import "CustomTableCell.h"
#import <QuartzCore/QuartzCore.h>

@interface CustomTableCell()
@property (nonatomic, retain) FeedDataModule *feedData;
@end



@implementation CustomTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)renderWithData: (FeedDataModule *)feedData
{
    if (self.feedData != feedData) {
        self.feedData = feedData;
        [self setNeedsDisplay];
    }
}

-(void)drawRect:(CGRect)rect
{
    FeedLayerOutInfo *layerInfo = self.feedData.layerInfo;
    [layerInfo.headImage drawWithBlock: ^{}];
    [layerInfo.nickName draw];
    [layerInfo.feedTime draw];
    [layerInfo.feedContent draw];
    CGRect imageRect = layerInfo.feedImage.rect;
    imageRect.origin.y = layerInfo.feedContent.rect.size.height + layerInfo.feedContent.rect.origin.y + 10;
    layerInfo.feedImage.rect = imageRect;
    
    //__block id tmpDelegate = self.delegate;
    [layerInfo.feedImage drawWithBlock: ^{
        self.feedData.cellHeight += layerInfo.feedImage.rect.size.height;
        [self.delegate updateHeight];
    }];
}





@end
