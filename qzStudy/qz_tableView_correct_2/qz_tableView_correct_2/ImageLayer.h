//
//  ImageLayer.h
//  qz_tableView_demo
//
//  Created by 侯 坤明 on 13-8-2.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageLayer : NSObject
@property (retain, nonatomic) NSString *urlStr;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, assign) CGRect rect;
@property (assign, nonatomic) int status;//0, 未初始化， 1: loading 2: complete
-(id)initWithDictionary: (NSMutableDictionary *) map;
-(void)drawWithBlock: (void(^)(void))block;
@end


