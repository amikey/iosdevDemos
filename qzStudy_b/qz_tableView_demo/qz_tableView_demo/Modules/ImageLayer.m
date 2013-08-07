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
@end
