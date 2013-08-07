//
//  FeedDataModule.m
//  qz_tableView_demo
//
//  Created by 侯 坤明 on 13-8-1.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "FeedDataModule.h"

@implementation FeedDataModule

-(FeedDataModule *)initWithMutableArray:(NSDictionary *)item
{
    self.nickName = [item objectForKey:@"nickName"];
    self.headImage = [item objectForKey:@"headImage"];
    self.feedTime = [item objectForKey:@"feedTime"];
    self.feedContent = [item objectForKey:@"feedContent"];
    self.feedImageUrl = [item objectForKey:@"feedImageUrl"];
    self.layerInfo = [[FeedLayerOutInfo alloc] initWithConfig: [FeedDataModule getLayerConfig]];
    self.cellHeight = 40;
    if(self.headImage != nil){
        ImageLayer *headImageLayer =  self.layerInfo.headImage;
        headImageLayer.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.headImage]]];
        CGRect rect =  headImageLayer.rect;
        CGSize size = headImageLayer.image.size;
        if(size.width > rect.size.width){
            rect.size.height = rect.size.width * size.height/size.width;
        }else{
            rect.size = size;
        }
    }
    if((NSNull *)self.feedContent != [NSNull null]){
        LabelLayer *feedContentLayer = self.layerInfo.feedContent;
        CGRect feedContentRect = feedContentLayer.rect;
        feedContentRect.size.height = [self.feedContent sizeWithFont:feedContentLayer.font constrainedToSize:CGSizeMake(feedContentLayer.rect.size.width, 2000) lineBreakMode: feedContentLayer.lineBreakMode].height;
        feedContentLayer.rect = feedContentRect;
        NSLog(@"height is: %f", feedContentRect.size.height);
        self.cellHeight += feedContentLayer.rect.size.height;
    }
    if((NSNull *)self.feedImageUrl != [NSNull null]){
        ImageLayer *feedImageLayer =  self.layerInfo.feedImage;
        feedImageLayer.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.feedImageUrl]]];
        CGRect rect =  feedImageLayer.rect;
        CGSize size = feedImageLayer.image.size;
        if(size.width > rect.size.width){
            rect.size.height = rect.size.width * size.height/size.width;
        }else{
            rect.size = size;
        }
        rect.origin.y = self.cellHeight;
        feedImageLayer.rect = rect;
        self.cellHeight += rect.size.height + 10;
    }else{
        self.feedImageUrl = nil;
    }
    
    self.cellHeight = MAX(self.cellHeight, 70);
    return self;
}

+(NSDictionary *)getLayerConfig
{
    CGFloat contentWidth = [UIScreen mainScreen].bounds.size.width;
    NSArray *labelLayerKeys = [NSArray arrayWithObjects: @"fontFamily", @"fontSize", @"fontColor", @"bgColor", @"align", @"lineBreakMode", @"rect", nil];
    NSArray *imageLayerKeys = [NSArray arrayWithObjects: @"default", @"image", @"rect", nil];
    NSArray *itemKeys = [NSArray arrayWithObjects: @"nickName", @"headImage", @"feedTime", @"feedContent", @"feedImage", nil];
        
    NSMutableDictionary *nickName = [NSMutableDictionary dictionaryWithObjects: @[
                                                                                    @"Arial",
                                                                                    [NSNumber numberWithInt: 14],
                                                                                    @[[NSNumber numberWithInt: 0], [NSNumber numberWithInt: 0], [NSNumber numberWithInt: 200], [NSNumber numberWithInt: 1]],
                                                                                    [NSNull null],
                                                                                    [NSNumber numberWithInt: NSTextAlignmentLeft],
                                                                                    [NSNumber numberWithInt: UILineBreakModeClip],
                                                                                    [NSValue valueWithCGRect: CGRectMake(70, 10, 100, 20)]
                                                                                ]
                                                                       forKeys:labelLayerKeys];
    NSMutableDictionary *headImage = [NSMutableDictionary dictionaryWithObjects:
                                      [NSArray arrayWithObjects:
                                       @"http://qlogo2.store.qq.com/qzone/1799413401/1799413401/50",
                                       [NSNull null],
                                       [NSValue valueWithCGRect: CGRectMake(10, 10, 50, 50)],
                                       nil] forKeys: imageLayerKeys];
    NSMutableDictionary *feedTime = [NSMutableDictionary dictionaryWithObjects:
                                     @[@"Arial",
                                     [NSNumber numberWithInt: 13],
                                     @[[NSNumber numberWithInt: 100], [NSNumber numberWithInt: 100], [NSNumber numberWithInt: 100], [NSNumber numberWithInt: 1]],
                                     [NSNull null],
                                     [NSNumber numberWithInt: NSTextAlignmentRight],
                                     [NSNumber numberWithInt: UILineBreakModeClip],
                                      [NSValue valueWithCGRect: CGRectMake(contentWidth - 110, 10, 100, 20)]]
                                forKeys:labelLayerKeys];
    NSMutableDictionary *feedContent = [NSMutableDictionary dictionaryWithObjects:
                                        @[
                                        @"Arial",
                                        [NSNumber numberWithInt: 13],
                                        @[[NSNumber numberWithInt: 0], [NSNumber numberWithInt: 0], [NSNumber numberWithInt: 0], [NSNumber numberWithInt: 1]],
                                        [NSNull null],
                                        [NSNumber numberWithInt: NSTextAlignmentLeft],
                                        [NSNumber numberWithInt: UILineBreakModeWordWrap],
                                         [NSValue valueWithCGRect: CGRectMake(70, 30, contentWidth - 80, 0)]
                                        ] forKeys:labelLayerKeys];
    NSMutableDictionary *feedImage = [NSMutableDictionary dictionaryWithObjects:
                                      [NSArray arrayWithObjects:
                                       @"http://qlogo2.store.qq.com/qzone/1799413401/1799413401/50",
                                       [NSNull null],
                                       [NSValue valueWithCGRect: CGRectMake(70, 0, contentWidth - 80, 0)],
                                       nil] forKeys: imageLayerKeys];
    return [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects: nickName,
                                                headImage,
                                                feedTime,
                                                feedContent,
                                                feedImage,
                                                nil] forKeys:itemKeys];
}

@end


