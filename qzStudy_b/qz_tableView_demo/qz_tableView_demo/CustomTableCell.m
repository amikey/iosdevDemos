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
        [self setNeedsDisplay];
    }
    self.feedData = feedData;
    
}



-(void)drawRect:(CGRect)rect
{
    NSLog(@"%p  %@", self, self.feedData);
    LabelLayer *nickNameLayerInfo = self.feedData.layerInfo.nickName;
    [self.feedData.nickName drawInRect:nickNameLayerInfo.rect withFont:nickNameLayerInfo.font lineBreakMode:nickNameLayerInfo.lineBreakMode alignment:nickNameLayerInfo.align];
    if(self.feedData.layerInfo.headImage.image != nil){
        [self.feedData.layerInfo.headImage.image drawInRect:self.feedData.layerInfo.headImage.rect];
    }
    
    LabelLayer *feedTimeLayer = self.feedData.layerInfo.feedTime;
    if(feedTimeLayer.fontColor != nil){
        [feedTimeLayer.fontColor setFill];
    }
    [self.feedData.feedTime drawInRect:feedTimeLayer.rect withFont:feedTimeLayer.font lineBreakMode:feedTimeLayer.lineBreakMode alignment:feedTimeLayer.align];
    if((NSNull *)self.feedData.feedContent != [NSNull null]){
        LabelLayer *feedContentLayer = self.feedData.layerInfo.feedContent;
        if(feedContentLayer.fontColor != nil){
            [feedContentLayer.fontColor setFill];
        }
        [self.feedData.feedContent drawInRect:feedContentLayer.rect withFont:feedContentLayer.font lineBreakMode:feedContentLayer.lineBreakMode alignment:feedContentLayer.align];
    }
    if(self.feedData.layerInfo.feedImage.image != nil){
        [self.feedData.layerInfo.feedImage.image drawInRect:self.feedData.layerInfo.feedImage.rect];
    }
}



@end
