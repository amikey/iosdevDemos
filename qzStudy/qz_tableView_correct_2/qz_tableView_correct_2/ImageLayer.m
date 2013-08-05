//
//  ImageLayer.m
//  qz_tableView_demo
//
//  Created by 侯 坤明 on 13-8-2.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "ImageLayer.h"

@implementation ImageLayer

-(id)initWithDictionary: (NSMutableDictionary *) map
{
    self.rect = [[map objectForKey: @"rect"] CGRectValue];
    return self;
}
-(void)drawWithBlock: (void(^)(void))block
{
    if(self.urlStr != nil && self.image == nil && self.status == 0){
        self.status = 1;
        dispatch_queue_t queue = dispatch_queue_create("load feed image", nil);
        dispatch_async(queue, ^{
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.urlStr]]];
            self.image = image;
            CGRect rect =  self.rect;
            CGSize size = self.image.size;
            if(size.width > rect.size.width){
                rect.size.height = rect.size.width * size.height/size.width;
            }else{
                rect.size = size;
            }
            self.rect = rect;
            dispatch_async(dispatch_get_main_queue(), ^{
                self.status = 2;
                block();
            });
        });
    }else if(self.image != nil){
        [self.image drawInRect:self.rect];
    }
}
@end
