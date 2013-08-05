//
//  FeedLayerOutInfo.h
//  qz_tableView_demo
//
//  Created by 侯 坤明 on 13-8-2.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LabelLayer.h"
#import "ImageLayer.h"

@interface FeedLayerOutInfo: NSObject
@property (nonatomic, retain) LabelLayer *nickName;
@property (nonatomic, retain) ImageLayer *headImage;
@property (nonatomic, retain) LabelLayer *feedTime;
@property (nonatomic, retain) LabelLayer *feedContent;
@property (nonatomic, retain) ImageLayer *feedImage;
-(id)initWithConfig: (NSDictionary *) config;
@end

