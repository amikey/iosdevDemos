//
//  ViewController.h
//  tableViewDemo
//
//  Created by 侯 坤明 on 13-7-4.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong,nonatomic) NSArray *dataList;

@end
