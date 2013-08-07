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
        __weak ImageLayer *_self = self;
        _self.status = 1;
        dispatch_queue_t queue = dispatch_queue_create("load feed image", nil);
        dispatch_async(queue, ^{
            _self.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.urlStr]]];
            CGRect rect =  _self.rect;
            CGSize size = _self.image.size;
            if(size.width > rect.size.width){
                rect.size.height = rect.size.width * size.height/size.width;
            }else{
                rect.size = size;
            }
            _self.rect = rect;
            dispatch_async(dispatch_get_main_queue(), ^{
                _self.status = 2;
                block();
            });
        });
    }else if(self.image != nil){
        [self.image drawInRect:self.rect];
    }
}
@end
