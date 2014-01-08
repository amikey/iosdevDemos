//
//  FormViewController.m
//  IBAFormDemo
//
//  Created by 侯 坤明 on 14-1-8.
//  Copyright (c) 2014年 侯 坤明. All rights reserved.
//

#import "FormViewController.h"

@interface FormViewController (){
    UITableView *_tableView;
}

@end

@implementation FormViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_tableView];
    self.tableView = _tableView;
}

@end
