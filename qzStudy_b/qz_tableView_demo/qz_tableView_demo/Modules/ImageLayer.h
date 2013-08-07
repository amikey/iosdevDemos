//
//  ImageLayer.h
//  qz_tableView_demo
//
//  Created by 侯 坤明 on 13-8-2.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageLayer : NSObject
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, assign) CGRect rect;
-(id)initWithDictionary: (NSMutableDictionary *) map;
@end


