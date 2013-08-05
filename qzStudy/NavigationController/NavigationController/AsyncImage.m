//
//  AsyncImage.m
//  NavigationController
//
//  Created by 侯 坤明 on 13-8-5.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "AsyncImage.h"

@implementation AsyncImage
-(id)init
{
    return self;
}
-(void)loadImageWithUrl: (NSString *)urlstr{
    dispatch_queue_t queue = dispatch_queue_create("load image", nil);
    int val = 10;
    __block int val2 = 10;
    dispatch_async(queue, ^{
        NSLog(@"begin load image");
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlstr]]];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"val is : %d", val);
            NSLog(@"val2 is : %d", val2);
            if(self.delegate != nil){
                [self.delegate loadedImage:image];
            }
            
        });
    });
    val = 20;
    val2 = 20;
}

-(void)dealloc
{
    NSLog(@"Async dealloc called");
}
@end
