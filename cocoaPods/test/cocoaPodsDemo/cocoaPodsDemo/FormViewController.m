//
//  FormViewController.m
//  cocoaPodsDemo
//
//  Created by 侯 坤明 on 14-1-18.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "FormViewController.h"

@interface FormViewController ()

@end

@implementation FormViewController

- (void)loadView
{
    CGRect f = [UIScreen mainScreen].bounds;
        UIView *view = [[UIView alloc] initWithFrame:f];
        UITableView *tableView = [[UITableView alloc] initWithFrame:f style:UITableViewStyleGrouped];
        [view addSubview:tableView];
        self.view = view;
        self.tableView = tableView;
}
    
@end
