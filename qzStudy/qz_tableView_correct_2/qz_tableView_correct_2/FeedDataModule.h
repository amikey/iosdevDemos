//
//  FeedDataModule.h
//  qz_tableView_demo
//
//  Created by 侯 坤明 on 13-8-1.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FeedLayerOutInfo.h"


@interface FeedDataModule : NSObject
@property (nonatomic, retain) NSString *nickName;
@property (nonatomic, retain) NSString *headImage;
@property (nonatomic, retain) NSString *feedTime;
@property (nonatomic, retain) NSString *feedContent;
@property (nonatomic, retain) NSString *feedImageUrl;
@property (nonatomic, retain) FeedLayerOutInfo *layerInfo;
@property (nonatomic, assign) CGFloat cellHeight;
-(FeedDataModule *)initWithMutableArray: (NSDictionary *)item;
@end
