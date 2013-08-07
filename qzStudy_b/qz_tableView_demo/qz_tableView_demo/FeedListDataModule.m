//
//  FeedListDataModule.m
//  qz_tableView_demo
//
//  Created by 侯 坤明 on 13-8-1.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "FeedListDataModule.h"
#import "FeedDataModule.h"

@implementation FeedListDataModule
/**
 * 构造数据
 */
-(NSMutableArray *)getFeedDatas
{
    NSMutableArray *list = [[NSMutableArray alloc] init];
    NSArray *keys = [NSArray arrayWithObjects:
                     @"nickName",
                     @"headImage",
                     @"feedTime",
                     @"feedContent",
                     @"feedImageUrl",
                     nil];
    NSArray *feedDatas = [NSMutableArray arrayWithObjects:
                          [NSArray arrayWithObjects:
                           @"luckchen",
                           @"http://qlogo3.store.qq.com/qzone/282928401/282928401/100",
                           @"7月29日 16:48",
                           @"说说要是有个搜索的功能就好了，曾经许下一个愿望，今天我实现了，好想将两个说说放在一起庆祝下的，难道是我的说说太多了吗~~",
                           @"http://a4.qpic.cn/psb?/6f72332d-de8a-492c-add3-5a9bfbf1ca5b/zN*GJYV.3YTxNHet3.yZRhVLjVA4UuZ7cJcaKEPBzAg!/c/dIYrlaHGIQAA&bo=eQBhAHkAYQABACc!",
                           nil
                           ],
                          [NSArray arrayWithObjects:
                           @"徐晓",
                           @"http://qlogo2.store.qq.com/qzone/95440569/95440569/50?1358005502",
                           @"11:46",
                           @"不错，契合天秤座@melody",
                           @"http://qzonestyle.gtimg.cn/qzone/em/horoscope/yellow_star/201308/20130801_SCORPIO_m.png",
                           nil
                           ],
                          [NSArray arrayWithObjects:
                           @"56网",
                           @"http://qlogo1.store.qq.com/qzone/1540075820/1540075820/50?1367060183",
                           @"7月29日 16:48",
                           @"悼念天使女孩女孩送假装肚子疼的孕妇回家，惨遭孕妇的丈夫迷晕后猥亵，然后被枕头蒙住致死。犯罪动机荒唐至极，丈夫发现孕妇有不正当关系，经常对其殴打辱骂，孕妇为了弥补丈夫，提出把女孩骗回家供丈夫性侵！据悉该男子认罪态度十分不好。你还会保有善良之心吗？http://url.cn/HzugQO",
                           @"http://b252.photo.store.qq.com/psb?/79bbd6da-7680-49c8-b774-644d60af6a06/jhlnIeiM9D9fhIN6e4dLhmKCF8ndY0aB8pkm4xYAtzw!/b/dELENZYdKwAA&bo=wAFZBAAAAAAAALo!",
                           nil
                           ],
                          [NSArray arrayWithObjects:
                           @"luckchen",
                           @"http://qlogo3.store.qq.com/qzone/282928401/282928401/100",
                           @"7月29日 16:48",
                           @"说说要是有个搜索的功",
                           [NSNull null],
                           nil
                           ],
                          [NSArray arrayWithObjects:
                           @"luckchen",
                           @"http://qlogo3.store.qq.com/qzone/282928401/282928401/100",
                           @"7月29日 16:48",
                           [NSNull null],
                           [NSNull null],
                           nil
                           ],
                          [NSArray arrayWithObjects:
                           @"luckchen",
                           @"http://qlogo3.store.qq.com/qzone/282928401/282928401/100",
                           @"7月29日 16:48",
                           @"说说要是有个搜索的功能就好了，曾经许下一个愿望，今天我实现了，好想将两个说说放在一起庆祝下的，难道是我的说说太多了吗~~",
                           [NSNull null],
                           nil
                           ],
                          [NSArray arrayWithObjects:
                           @"luckchen",
                           @"http://qlogo3.store.qq.com/qzone/282928401/282928401/100",
                           @"7月29日 16:48",
                           [NSNull null],
                           @"https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTeJaPsqs8QajxRBqU8O30W82DO3lBTUUdRa8P8gBhX3zQEHofGqQ",
                           nil
                           ],
                          [NSArray arrayWithObjects:
                           @"luckchen",
                           @"http://qlogo3.store.qq.com/qzone/282928401/282928401/100",
                           @"7月29日 16:48",
                           @"说说要是有个搜索的功能就好了，曾经许下一个愿望，今天我实现了，好想将两个说说吗~~",
                           @"http://www.mobiletupian.com/tupian/2011102215344996206.jpg",
                           nil
                           ],
                          [NSArray arrayWithObjects:
                           @"luckchen",
                           @"http://qlogo3.store.qq.com/qzone/282928401/282928401/100",
                           @"7月29日 16:48",
                           @"说说要是有个搜索的功能就好了，曾经许下一个愿望，今天我实现了，好想将两个说说放在一起庆祝下的，难道是我的说说太多了吗~~",
                           @"http://www.2jz.net/uploads/allimg/130227scfjjz/8_231519_1.jpg",
                           nil
                           ],
                          [NSArray arrayWithObjects:
                           @"luckchen",
                           @"http://qlogo3.store.qq.com/qzone/282928401/282928401/100",
                           @"7月29日 16:48",
                           @"说说要是有个搜索的功能就好了，曾经许下一个愿望，说说放在一起庆祝下的，难道是我的说说太多了吗~~",
                           [NSNull null],
                           nil
                           ]
                          , nil];
    for (NSInteger i = 0; i < [feedDatas count]; i++) {
        [list addObject: [[FeedDataModule alloc] initWithMutableArray:
                          [NSDictionary dictionaryWithObjects: [feedDatas objectAtIndex: i]
                                                      forKeys: keys
                           ]]];
    }
    return list;
}
@end
