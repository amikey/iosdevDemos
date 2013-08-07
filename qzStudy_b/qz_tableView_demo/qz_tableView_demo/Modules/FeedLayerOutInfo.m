//
//  FeedLayerOutInfo.m
//  qz_tableView_demo
//
//  Created by 侯 坤明 on 13-8-2.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "FeedLayerOutInfo.h"

@implementation FeedLayerOutInfo
-(id)initWithConfig: (NSDictionary *) config
{
    self.nickName = [[LabelLayer alloc] initWithDictionary: [config objectForKey: @"nickName"]];
    self.headImage = [[ImageLayer alloc] initWithDictionary: [config objectForKey: @"headImage"]];
    self.feedTime = [[LabelLayer alloc] initWithDictionary: [config objectForKey: @"feedTime"]];
    self.feedContent = [[LabelLayer alloc] initWithDictionary: [config objectForKey: @"feedContent"]];
    self.feedImage = [[ImageLayer alloc] initWithDictionary: [config objectForKey: @"feedImage"]];
    return self;
}
@end
